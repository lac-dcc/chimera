module top
#(parameter param113 = (^~({(((8'hb9) < (8'haf)) ? (~(7'h40)) : ((8'hab) & (8'ha7)))} ? ((~((7'h40) | (8'ha8))) || ((^(8'h9d)) <= ((8'h9d) ? (7'h43) : (7'h40)))) : (({(8'ha4)} != ((8'ha8) ? (8'hbd) : (8'hb3))) ? (8'haa) : (8'hb4)))), 
parameter param114 = (((|param113) ? ({(^param113)} ? (~^(param113 ? param113 : param113)) : (&(^~param113))) : (7'h40)) ? param113 : (~&((&(param113 & (8'hbb))) ? ((~&param113) ? ((8'hab) ? param113 : (8'ha7)) : (param113 & param113)) : {param113}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire103;
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire112,
                 wire78,
                 wire9,
                 wire8,
                 wire80,
                 wire103,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg83,
                 reg82,
                 reg81,
                 reg5,
                 reg6,
                 reg7,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (($signed((wire4[(3'h6):(2'h2)] ?
                  (wire4 > wire1) : $unsigned((8'hb8)))) ?
              wire0[(3'h5):(2'h3)] : {$unsigned((^~wire2)),
                  wire0[(2'h2):(1'h0)]}) ?
          (8'ha4) : wire2[(2'h2):(1'h1)]);
      reg6 <= (((8'ha9) | wire2) >> {(($unsigned(wire3) * (~|wire4)) < $unsigned((reg5 <= wire4))),
          (-$signed($unsigned(wire4)))});
      reg7 <= ($unsigned($signed($unsigned(wire4))) ^~ $signed(($unsigned(reg6[(3'h6):(1'h1)]) ?
          wire4[(1'h1):(1'h1)] : ($unsigned(wire3) ? $unsigned(reg5) : reg5))));
    end
  assign wire8 = reg5[(2'h2):(2'h2)];
  assign wire9 = wire4[(4'h8):(3'h5)];
  module10 #() modinst79 (.wire13(wire8), .wire12(wire3), .clk(clk), .wire11(wire9), .wire14(reg5), .y(wire78));
  assign wire80 = $unsigned((($signed($signed(wire78)) <<< (wire3[(2'h2):(1'h0)] * $signed(wire0))) ?
                      (((&(8'had)) ^ (wire3 + (8'hb0))) ?
                          (wire8 >= wire8) : (wire3 ?
                              (wire0 ?
                                  (8'ha0) : (8'hb9)) : $unsigned(reg7))) : {wire8}));
  always
    @(posedge clk) begin
      reg81 <= (^$signed($signed(((wire78 ? wire1 : wire3) ~^ (|(8'hb7))))));
      reg82 <= wire80[(1'h1):(1'h1)];
      reg83 <= wire80;
    end
  module84 #() modinst104 (wire103, clk, reg5, wire2, reg7, wire80, wire1);
  always
    @(posedge clk) begin
      reg105 <= (~^wire0);
      if (({{$unsigned(wire1), (8'ha2)},
              (!((|wire3) ? (wire3 & wire3) : (wire8 >>> wire4)))} ?
          (8'h9d) : reg81))
        begin
          reg106 <= wire4;
        end
      else
        begin
          reg106 <= reg5;
          reg107 <= (wire4[(3'h4):(2'h3)] ?
              $unsigned((!($unsigned((8'hb9)) ?
                  wire2 : (|wire0)))) : $unsigned(($unsigned(reg81) ?
                  ($unsigned(reg82) & {wire2}) : ((wire4 <= wire80) ^~ $signed(wire3)))));
          reg108 <= (-$unsigned(wire8));
          reg109 <= ((&$unsigned($unsigned((wire8 - reg5)))) ?
              ($unsigned($signed($signed(reg81))) | (~reg108)) : $signed(reg105));
        end
      reg110 <= $unsigned(($unsigned($unsigned($unsigned(wire9))) + $signed({(wire0 + reg7)})));
      reg111 <= reg105[(1'h1):(1'h1)];
    end
  assign wire112 = (~|wire4[(4'h9):(3'h4)]);
endmodule

module module84  (y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire89;
  input wire signed [(2'h2):(1'h0)] wire88;
  input wire signed [(5'h15):(1'h0)] wire87;
  input wire [(5'h14):(1'h0)] wire86;
  input wire signed [(4'hf):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire102;
  wire signed [(5'h15):(1'h0)] wire91;
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  assign y = {wire102,
                 wire91,
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
                 reg90,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg90 <= (((~&wire86[(4'he):(2'h3)]) >> $unsigned(wire85[(1'h0):(1'h0)])) ~^ ((~|$signed(((8'hbd) ?
              wire88 : wire86))) ?
          $signed($signed($signed(wire88))) : (wire88[(1'h1):(1'h1)] == $unsigned($signed(wire85)))));
    end
  assign wire91 = wire87[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg92 <= reg90[(2'h2):(1'h0)];
      reg93 <= wire85[(4'hc):(4'h8)];
      reg94 <= (!{((wire91[(5'h15):(1'h1)] ~^ (|wire87)) <<< (~&wire91[(4'hb):(4'hb)])),
          ($unsigned((~^wire87)) ^ (8'hac))});
      reg95 <= ((wire86 && $signed($unsigned(wire89[(1'h1):(1'h1)]))) << reg90[(3'h4):(2'h2)]);
      if (wire87[(5'h12):(3'h6)])
        begin
          reg96 <= $signed((|{(^~(+wire91)), $signed($signed(wire88))}));
          if (reg93)
            begin
              reg97 <= (^$unsigned($unsigned($unsigned((reg95 ?
                  (7'h41) : wire88)))));
              reg98 <= $signed({reg94});
              reg99 <= (~^$signed((&((reg96 ? reg92 : reg90) < (8'h9f)))));
              reg100 <= wire86;
              reg101 <= {reg96[(4'hc):(4'hc)],
                  (~^{{$signed((8'hbd)), (reg90 <= reg100)}})};
            end
          else
            begin
              reg97 <= wire85;
              reg98 <= reg90[(2'h3):(1'h0)];
              reg99 <= reg94;
              reg100 <= $signed($signed($signed(reg98)));
            end
        end
      else
        begin
          if (((|(-reg100)) ? {reg93} : reg98))
            begin
              reg96 <= ({($unsigned(reg99[(5'h10):(3'h5)]) ?
                          (reg101[(1'h1):(1'h1)] == reg93) : $signed((reg93 ?
                              wire85 : reg90))),
                      $unsigned(reg93[(4'ha):(3'h6)])} ?
                  $signed($signed($signed({(8'haf)}))) : $unsigned($unsigned($unsigned(reg98[(4'hc):(2'h2)]))));
              reg97 <= ($unsigned(wire86) == $unsigned($unsigned((((8'hb2) ?
                  reg93 : reg98) >= wire86[(4'h8):(3'h6)]))));
              reg98 <= $unsigned($signed(($signed((reg101 != reg101)) ?
                  $signed(reg94[(2'h2):(2'h2)]) : (wire87 ? wire88 : wire85))));
            end
          else
            begin
              reg96 <= reg101;
              reg97 <= (~{reg100[(3'h5):(3'h4)]});
              reg98 <= (((!{{wire87, reg96}}) ?
                  (8'haa) : {wire91[(4'hb):(3'h4)]}) * $signed($unsigned((&(~&(8'hb6))))));
              reg99 <= ($unsigned((reg100[(4'hd):(2'h2)] ?
                  $unsigned({(8'haa)}) : ({wire85,
                      (8'hab)} + $signed((8'ha7))))) >>> wire89[(1'h1):(1'h1)]);
              reg100 <= (~(($unsigned($signed((8'ha6))) < (reg101[(1'h0):(1'h0)] <<< (wire87 ?
                      reg100 : reg100))) ?
                  (8'ha4) : $unsigned($signed($unsigned(reg94)))));
            end
        end
    end
  assign wire102 = reg97;
endmodule

module module10
#(parameter param76 = (({(+(~|(8'hb0))), (((8'ha3) & (7'h40)) ? (+(8'hb6)) : (^(8'hb5)))} ? (~|({(8'ha0)} ? (~^(8'ha2)) : (|(8'hac)))) : {{{(8'h9e), (8'ha9)}, ((8'hb6) - (8'had))}, (((8'ha4) - (8'had)) || ((8'ha1) ? (7'h42) : (8'h9f)))}) + {(!((8'hbc) ? ((8'hb4) ? (8'haa) : (8'hbb)) : {(8'hb2)}))}), 
parameter param77 = {(+{param76})})
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire73;
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  assign y = {wire75,
                 wire31,
                 wire32,
                 wire33,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire73,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= (&$signed(wire14[(4'hf):(4'hd)]));
      reg16 <= ((~($signed($unsigned((8'h9e))) >> $unsigned((~wire14)))) && ((~&($signed(wire13) & (&wire13))) - (+wire11[(1'h0):(1'h0)])));
      if (reg16[(3'h4):(2'h2)])
        begin
          reg17 <= $unsigned((-(8'hb0)));
          reg18 <= {($unsigned(((wire12 + (8'hbd)) | $signed(wire13))) & wire13),
              reg16[(4'h8):(3'h4)]};
        end
      else
        begin
          reg17 <= reg18[(3'h4):(2'h2)];
        end
      if (reg17[(2'h3):(1'h1)])
        begin
          if ($signed(wire11[(3'h7):(1'h0)]))
            begin
              reg19 <= reg17;
              reg20 <= (($signed($unsigned(wire12)) & reg15[(4'h8):(3'h7)]) > wire12);
              reg21 <= $unsigned(reg15[(3'h7):(3'h5)]);
              reg22 <= reg15[(3'h7):(2'h3)];
              reg23 <= {$signed(($signed(wire12[(3'h6):(2'h2)]) ?
                      {wire11, (reg19 ? reg16 : reg16)} : (8'ha9))),
                  $signed($unsigned($signed((^wire12))))};
            end
          else
            begin
              reg19 <= (~&(reg23 <<< ($unsigned((wire14 ?
                  wire13 : reg19)) + reg20)));
              reg20 <= wire13[(2'h2):(1'h0)];
              reg21 <= {(^~(reg19 + ((reg23 != wire11) | (+wire11))))};
            end
          if (reg16[(4'hd):(3'h4)])
            begin
              reg24 <= reg16;
              reg25 <= reg18;
              reg26 <= ($signed({($unsigned((8'h9e)) ? (+reg16) : wire12),
                      ((reg23 ? wire14 : reg17) ?
                          {wire13, wire13} : $unsigned(reg23))}) ?
                  (!$signed(({wire12, reg15} ?
                      $unsigned(reg21) : $unsigned((8'ha4))))) : reg16[(1'h1):(1'h0)]);
            end
          else
            begin
              reg24 <= {$signed((($unsigned(reg15) | $signed(reg16)) ?
                      reg18 : (~&$signed(wire14))))};
              reg25 <= {(~&reg19[(4'he):(3'h4)])};
              reg26 <= ((^~($signed((wire13 >= reg20)) ?
                  (8'h9f) : ($signed(reg22) ? (8'haa) : wire11))) + reg21);
            end
          if (wire11[(3'h4):(3'h4)])
            begin
              reg27 <= $unsigned($unsigned(wire13[(1'h1):(1'h0)]));
              reg28 <= $unsigned(reg25[(5'h10):(1'h0)]);
              reg29 <= $unsigned($signed({(8'hbf)}));
            end
          else
            begin
              reg27 <= reg28;
              reg28 <= ({$unsigned(reg15[(3'h7):(2'h2)])} ?
                  ($signed($signed((reg23 - (8'hbd)))) + $signed($unsigned(((8'h9f) ?
                      reg22 : (8'hae))))) : $signed($signed(((~reg16) ?
                      (+reg24) : $signed(reg16)))));
            end
          reg30 <= (wire12[(3'h4):(1'h1)] ?
              (-(^((8'hb2) ?
                  reg16 : reg18))) : (reg22 >= wire11[(4'he):(4'hd)]));
        end
      else
        begin
          reg19 <= ((~^(($unsigned(reg17) ? wire14 : reg17) ^~ reg24)) ?
              (~{{$unsigned(reg17),
                      (wire11 ?
                          reg16 : reg15)}}) : $signed(({$signed(wire13)} != reg16[(3'h4):(1'h0)])));
          reg20 <= (-((reg20 ?
              {(!(8'hb0))} : (&reg25[(4'h9):(4'h8)])) <= ($unsigned(reg24[(4'hb):(1'h1)]) ~^ (^~$unsigned(reg16)))));
          if ((~^reg16))
            begin
              reg21 <= $unsigned($signed((~$signed((~&(8'hb0))))));
            end
          else
            begin
              reg21 <= (((((reg29 & reg19) ^ (reg17 ?
                  wire12 : reg30)) > (~|(~^reg19))) <= reg17) ~^ $signed($unsigned(($signed(wire11) ^~ (8'h9c)))));
              reg22 <= (~&reg22);
              reg23 <= wire14[(4'ha):(4'h8)];
            end
          reg24 <= ($signed(reg26) < ((|((+reg21) <<< (~reg24))) ?
              (~|{(reg17 <<< (8'hbb)),
                  (wire14 > reg28)}) : ((+$signed(wire11)) ?
                  $signed($unsigned((8'hb6))) : $unsigned((7'h40)))));
        end
    end
  assign wire31 = $unsigned($signed((reg24 ?
                      $unsigned(reg25[(2'h2):(2'h2)]) : $signed(reg17))));
  assign wire32 = ((&(($unsigned(wire14) <<< {(8'hbe)}) ?
                      reg18[(3'h5):(1'h1)] : $signed({wire11,
                          reg18}))) <<< (8'hb4));
  assign wire33 = $unsigned($unsigned($signed(((-reg16) >> (~|reg16)))));
  always
    @(posedge clk) begin
      reg34 <= $unsigned(wire32[(4'h9):(4'h8)]);
      if ($signed($unsigned({(reg26 ?
              (reg34 ? reg30 : reg18) : $unsigned(wire13)),
          (+(wire14 <<< (8'haf)))})))
        begin
          reg35 <= $signed(((-(~$unsigned(reg24))) >>> $signed(((|reg30) ?
              {reg30} : $unsigned(wire32)))));
          if ($signed($signed(reg21)))
            begin
              reg36 <= (-(((+reg15[(3'h6):(3'h6)]) ?
                  {$unsigned(reg29)} : ((reg22 << reg15) || (^wire12))) >> $unsigned((~^{reg24}))));
              reg37 <= (+($signed(($signed(reg16) <<< reg27)) ?
                  $signed((|reg28)) : $unsigned((reg28[(4'hb):(1'h1)] ?
                      $unsigned(wire14) : ((7'h41) ~^ wire13)))));
            end
          else
            begin
              reg36 <= reg36[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg35 <= (-(+wire13[(1'h0):(1'h0)]));
        end
      if ((reg29[(4'hd):(4'hb)] ?
          (~^$unsigned($unsigned($signed(wire33)))) : ((~|$unsigned((!(8'ha9)))) + (((reg17 ?
              (8'hb9) : wire33) != $unsigned(reg26)) * (wire11[(5'h11):(1'h1)] ~^ reg30)))))
        begin
          reg38 <= (wire13[(2'h2):(1'h0)] & (7'h41));
          reg39 <= reg22;
        end
      else
        begin
          reg38 <= {reg20[(4'hd):(3'h5)]};
          reg39 <= reg25;
          if (reg38[(3'h6):(1'h1)])
            begin
              reg40 <= reg20[(2'h2):(2'h2)];
              reg41 <= wire11[(3'h6):(3'h5)];
            end
          else
            begin
              reg40 <= reg37[(4'hb):(4'h9)];
              reg41 <= (($unsigned($signed($unsigned(reg19))) ?
                  (8'ha3) : ($signed((reg28 != reg24)) >>> reg37[(4'h8):(3'h5)])) & reg35[(1'h1):(1'h1)]);
              reg42 <= reg26;
            end
        end
    end
  assign wire43 = ((~&$signed(wire12[(3'h7):(3'h5)])) + $signed((8'hb2)));
  assign wire44 = ({($unsigned((reg40 >> reg39)) && (wire11 || reg18[(1'h0):(1'h0)]))} != ((reg17[(1'h0):(1'h0)] ?
                          (&(reg28 ? wire14 : reg15)) : $signed((8'ha0))) ?
                      {wire43[(2'h2):(1'h1)]} : $unsigned(((wire31 * (8'ha7)) == (reg20 + reg34)))));
  assign wire45 = ($signed((~&$unsigned((^reg42)))) && $signed($signed(reg28)));
  assign wire46 = $signed(reg23[(2'h3):(2'h2)]);
  assign wire47 = (~^reg34);
  assign wire48 = $signed($signed((reg27[(5'h11):(1'h1)] << reg28[(4'hb):(1'h0)])));
  assign wire49 = $unsigned(reg18[(3'h6):(3'h6)]);
  module50 #() modinst74 (wire73, clk, reg16, wire43, wire48, wire33);
  assign wire75 = reg17;
endmodule

module module50
#(parameter param71 = {(!(~^(^~((7'h43) ? (8'h9c) : (8'h9d))))), (((((8'hbd) ? (8'hab) : (8'hb1)) << ((8'hac) ? (8'haa) : (7'h42))) == ((8'hb9) ? ((8'hbf) ? (7'h41) : (8'hb4)) : ((8'hb5) ? (8'ha6) : (8'hae)))) ? (|{((8'hb2) ? (8'hbd) : (8'ha9))}) : ((+((8'h9c) >>> (8'hbc))) && (!(-(8'hb7)))))}, 
parameter param72 = (^~{(param71 >>> (^param71))}))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire54;
  input wire [(2'h3):(1'h0)] wire53;
  input wire [(3'h5):(1'h0)] wire52;
  input wire signed [(4'he):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire55 = (~&(|wire51[(4'hc):(3'h5)]));
  assign wire56 = {({(&wire54[(1'h1):(1'h0)])} == wire54)};
  assign wire57 = (+(($signed(wire56[(4'hc):(1'h0)]) ~^ ($signed(wire54) ?
                          wire53 : {wire54, wire54})) ?
                      wire52 : $unsigned(((^wire52) ?
                          wire56[(5'h12):(2'h3)] : $unsigned(wire54)))));
  assign wire58 = {$signed((^~wire51[(4'he):(2'h3)])), wire52[(3'h5):(2'h2)]};
  always
    @(posedge clk) begin
      reg59 <= (~^wire54[(2'h3):(2'h2)]);
      reg60 <= {(~$signed((|{wire52})))};
      reg61 <= wire54[(3'h6):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg62 <= reg61[(3'h7):(3'h6)];
      reg63 <= (wire58 ^~ (8'ha5));
    end
  assign wire64 = ($unsigned((!$unsigned(wire53))) ?
                      (~^$unsigned((^(~|reg63)))) : ($signed(wire51) & $unsigned(wire52[(3'h5):(1'h1)])));
  assign wire65 = (~|wire55[(4'he):(4'ha)]);
  assign wire66 = (~|wire54);
  assign wire67 = ($signed((($signed(wire65) ? (+reg63) : $signed(wire64)) ?
                          wire66 : (^(!wire51)))) ?
                      $unsigned((^wire53)) : (~^($signed($unsigned(reg59)) & (wire55[(4'h9):(1'h0)] ?
                          $signed(wire66) : {wire58}))));
  assign wire68 = $signed($signed(wire51));
  assign wire69 = wire67[(1'h1):(1'h1)];
  assign wire70 = $unsigned((reg60[(4'h9):(3'h7)] ?
                      $signed($signed(wire54)) : {(reg60 ?
                              $signed((8'ha9)) : (reg62 ? wire64 : wire65)),
                          $unsigned(wire51)}));
endmodule
