module top
#(parameter param138 = {((|(+((8'hb5) ? (8'hbc) : (8'hab)))) + {(((7'h44) && (8'hbe)) ? ((7'h44) + (8'hab)) : {(8'hbe)})})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire137;
  wire signed [(2'h2):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire132;
  wire signed [(4'he):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire123;
  wire signed [(2'h3):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire121;
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  assign y = {wire137,
                 wire133,
                 wire132,
                 wire124,
                 wire123,
                 wire88,
                 wire5,
                 wire90,
                 wire93,
                 wire121,
                 reg136,
                 reg135,
                 reg134,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
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
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire5 = ((~&({(wire2 ? wire3 : wire1),
                         $signed(wire1)} >= (wire0[(4'hb):(2'h2)] ?
                         $unsigned(wire4) : (|wire1)))) ?
                     (8'hac) : $signed({(wire2[(2'h3):(2'h3)] ?
                             $unsigned(wire4) : (~wire2)),
                         $signed((^wire0))}));
  module6 #() modinst89 (wire88, clk, wire5, wire2, wire4, wire0, wire3);
  assign wire90 = wire2[(4'hd):(3'h6)];
  always
    @(posedge clk) begin
      reg91 <= wire0;
      reg92 <= wire4[(3'h6):(2'h2)];
    end
  assign wire93 = wire88;
  always
    @(posedge clk) begin
      if ({reg92, (~|$unsigned(wire88[(2'h2):(1'h1)]))})
        begin
          reg94 <= $signed({$unsigned(wire4[(3'h5):(1'h0)])});
          reg95 <= $signed((~|($signed((8'h9c)) ~^ $signed((~wire88)))));
          reg96 <= (wire4 ?
              {($signed(wire2[(4'h8):(3'h7)]) ?
                      wire88 : ((wire4 ? wire5 : wire4) << reg91)),
                  $signed($signed((&wire3)))} : wire0);
          reg97 <= ($signed($signed(((+reg95) ?
                  $signed(wire93) : (wire88 ? reg95 : reg94)))) ?
              (8'hb5) : {(~&{(wire93 ^~ wire93)})});
        end
      else
        begin
          if (((&wire88) ^ $unsigned((((reg96 >= wire4) << (wire1 ?
                  wire0 : (8'hbe))) ?
              {(8'ha0)} : (wire2[(4'hf):(2'h2)] & (reg97 ? (7'h40) : wire5))))))
            begin
              reg94 <= (^(reg97 ?
                  $signed(((^(8'hb1)) ?
                      (^reg91) : $unsigned(reg97))) : $signed((+(reg97 << reg96)))));
            end
          else
            begin
              reg94 <= reg92[(1'h0):(1'h0)];
              reg95 <= (~&wire2);
              reg96 <= $unsigned(wire90);
            end
          reg97 <= ((reg95 < wire90) >= (($unsigned(wire93) ?
                  ($unsigned(wire3) ?
                      (wire5 ?
                          reg94 : wire4) : wire1[(3'h5):(1'h1)]) : $signed($unsigned(wire93))) ?
              (~wire93) : $unsigned(((reg91 ? wire93 : wire3) ?
                  ((8'hbb) ? wire4 : reg95) : wire4))));
          reg98 <= ((reg91 ?
                  reg94 : {$signed($unsigned(reg92)),
                      $unsigned((wire93 == (8'hb4)))}) ?
              wire90 : reg97[(2'h3):(2'h3)]);
          reg99 <= wire3;
        end
      reg100 <= (8'ha5);
      if ((wire90 ?
          $signed((8'hb9)) : {{(|wire88),
                  ($signed(reg99) ~^ (reg96 ? reg92 : reg99))}}))
        begin
          reg101 <= (reg98[(3'h7):(3'h6)] ?
              ($signed($unsigned((wire88 | (8'hb1)))) && reg94[(3'h4):(1'h1)]) : ((((reg99 > wire0) + $unsigned(reg99)) >>> (reg99[(1'h1):(1'h0)] && (reg100 || wire4))) ^~ (wire3 << ((reg91 > reg97) ?
                  (wire0 ? (8'ha2) : reg97) : {wire2, reg94}))));
          reg102 <= wire90[(2'h3):(2'h2)];
          reg103 <= ($unsigned(($unsigned($unsigned(wire1)) == ((^(8'ha6)) ?
                  {wire3} : {reg91, reg96}))) ?
              wire3[(4'hf):(1'h0)] : $unsigned(reg101[(4'h9):(4'h9)]));
          reg104 <= ($signed((+wire1)) ?
              (~(wire0[(3'h7):(1'h0)] <<< (((8'hb9) ^ reg92) ?
                  (wire5 ? (8'hba) : reg101) : ((8'ha8) ?
                      reg92 : (7'h44))))) : $unsigned(reg100[(1'h1):(1'h0)]));
          reg105 <= {$unsigned((((reg101 << reg104) ?
                      (reg100 && reg99) : (|(8'ha5))) ?
                  $signed((wire88 + (8'hb8))) : (^$signed(reg101))))};
        end
      else
        begin
          reg101 <= $unsigned($signed({((8'hbb) ?
                  (wire88 ? wire93 : (8'hac)) : reg101[(3'h7):(3'h5)]),
              $signed((reg98 ? reg94 : wire2))}));
          reg102 <= ($signed((reg97[(4'h8):(1'h0)] ?
              reg97[(3'h7):(2'h3)] : ((+(8'ha8)) ^ {(8'hb5),
                  wire93}))) >>> reg95[(4'hd):(4'hd)]);
          if ($signed($signed($unsigned($unsigned(wire5)))))
            begin
              reg103 <= wire1[(1'h0):(1'h0)];
            end
          else
            begin
              reg103 <= (~&(wire90[(3'h7):(3'h4)] ?
                  ($signed((reg101 ?
                      (8'ha7) : wire4)) | wire5[(3'h4):(2'h3)]) : reg100));
              reg104 <= $unsigned($signed((~&reg94[(2'h3):(1'h1)])));
              reg105 <= $signed(($signed(reg92) ?
                  reg103 : wire0[(3'h7):(3'h4)]));
            end
          reg106 <= ((reg103 ?
              {(~$signed(reg91)),
                  $signed($unsigned(reg95))} : (~&reg105)) | ({((wire0 && reg104) - reg105),
              wire1} ~^ reg98[(3'h5):(3'h4)]));
        end
      reg107 <= (+reg105[(4'hc):(3'h7)]);
    end
  module108 #() modinst122 (.clk(clk), .y(wire121), .wire112(reg106), .wire111(wire0), .wire109(reg91), .wire113(reg103), .wire110(reg96));
  assign wire123 = $signed(wire93[(3'h7):(2'h3)]);
  assign wire124 = {($unsigned(((reg94 - reg107) ?
                           (wire121 ?
                               wire0 : wire3) : (reg103 | reg100))) | $signed(((~reg92) ?
                           $unsigned((8'hbe)) : reg91))),
                       reg105};
  always
    @(posedge clk) begin
      if ((&{$signed((reg101 == (wire2 ? wire4 : reg99))),
          $unsigned(reg97[(3'h5):(2'h3)])}))
        begin
          reg125 <= $signed(((~&(~&{reg95, (8'ha3)})) ?
              (((|reg107) | (reg101 ? reg96 : reg95)) * (reg92[(3'h7):(1'h1)] ?
                  (reg99 ? wire123 : (7'h41)) : ((8'ha3) ?
                      (8'h9f) : (8'hbd)))) : {$unsigned(wire88),
                  ($signed((8'hb2)) ? (~&reg98) : $signed(reg104))}));
          reg126 <= reg95[(5'h10):(1'h0)];
          reg127 <= ((+$signed(wire90)) ?
              reg91[(1'h0):(1'h0)] : reg106[(2'h3):(2'h2)]);
          reg128 <= wire90;
        end
      else
        begin
          if ($signed(wire90))
            begin
              reg125 <= {wire124};
              reg126 <= (+$unsigned(reg103[(4'hc):(4'ha)]));
              reg127 <= reg98;
              reg128 <= wire121[(4'h9):(4'h9)];
              reg129 <= ((~^$unsigned({(wire90 ? reg106 : wire93)})) ?
                  ((reg125 ? reg97 : $unsigned($unsigned((8'hb3)))) ?
                      {$signed(wire3)} : (~|(reg127[(4'ha):(4'ha)] ?
                          (reg127 >>> (8'ha1)) : reg94[(4'h9):(3'h6)]))) : (^~reg105[(4'ha):(3'h6)]));
            end
          else
            begin
              reg125 <= (&$unsigned(reg96[(2'h2):(1'h1)]));
              reg126 <= (reg105[(5'h11):(4'hf)] ?
                  (!$signed(reg128)) : (+{({reg96} <<< ((8'ha2) ~^ wire90))}));
              reg127 <= $signed((reg99[(3'h5):(1'h0)] ?
                  (!$signed(reg106)) : (8'ha7)));
            end
          reg130 <= reg127;
        end
      reg131 <= reg96[(4'hb):(3'h7)];
    end
  assign wire132 = $signed((8'hbd));
  assign wire133 = ((!reg129[(2'h3):(2'h3)]) ?
                       ($unsigned($unsigned({reg130})) ?
                           reg104[(2'h2):(1'h0)] : (!$unsigned((8'hb7)))) : $unsigned((~&$signed((reg104 | reg105)))));
  always
    @(posedge clk) begin
      reg134 <= $unsigned((reg130 >= reg127[(3'h5):(2'h2)]));
      reg135 <= $unsigned({(reg104 ?
              ($unsigned(wire4) ?
                  reg127[(4'ha):(2'h3)] : (wire3 ~^ wire88)) : $unsigned($unsigned(reg127)))});
      reg136 <= $unsigned({(8'hba)});
    end
  assign wire137 = reg106[(4'hd):(3'h6)];
endmodule

module module108
#(parameter param119 = {(!((((8'hbc) ? (8'ha7) : (7'h43)) | (8'ha8)) ? ((~&(8'haf)) <= ((8'hac) >> (8'hb7))) : ((!(8'hbc)) ? ((8'ha1) ^ (8'ha1)) : ((8'had) <<< (8'hab)))))}, 
parameter param120 = (~&param119))
(y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire113;
  input wire [(4'h8):(1'h0)] wire112;
  input wire [(5'h11):(1'h0)] wire111;
  input wire signed [(4'h9):(1'h0)] wire110;
  input wire signed [(2'h2):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire116;
  wire [(3'h4):(1'h0)] wire115;
  wire signed [(3'h6):(1'h0)] wire114;
  assign y = {wire118, wire117, wire116, wire115, wire114, (1'h0)};
  assign wire114 = wire111;
  assign wire115 = $unsigned(((~&$signed(wire114)) ?
                       (&$unsigned($unsigned(wire112))) : wire112[(2'h2):(1'h0)]));
  assign wire116 = $unsigned({{($signed(wire109) | $unsigned(wire115)),
                           (~$unsigned(wire114))}});
  assign wire117 = wire116;
  assign wire118 = $unsigned($unsigned($unsigned((&wire110[(1'h1):(1'h1)]))));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire26,
                 wire13,
                 wire12,
                 reg47,
                 reg46,
                 reg45,
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
                 (1'h0)};
  assign wire12 = wire7[(4'he):(1'h0)];
  assign wire13 = {wire11[(4'hc):(4'hb)]};
  module14 #() modinst27 (.wire18(wire7), .y(wire26), .wire15(wire10), .wire16(wire11), .wire17(wire12), .clk(clk));
  always
    @(posedge clk) begin
      if ($signed(wire7))
        begin
          reg28 <= (wire8[(4'h8):(3'h6)] << (!$unsigned($signed($signed(wire13)))));
          reg29 <= ((~^(($signed(wire11) ^ (wire7 + wire13)) ?
              (wire11[(3'h5):(3'h5)] ?
                  wire12 : (reg28 ?
                      wire8 : wire26)) : $unsigned($signed((8'hb2))))) >> (((|wire12[(4'hb):(4'hb)]) ?
                  (&$signed(wire7)) : $signed((~&wire11))) ?
              wire11[(4'he):(4'hc)] : ($unsigned({wire12}) ?
                  $signed((wire8 ?
                      wire7 : wire11)) : $signed(wire7[(4'ha):(1'h1)]))));
        end
      else
        begin
          reg28 <= (wire11 ?
              ({{$signed(wire7),
                      (wire8 >= wire10)}} & (wire8[(4'h9):(3'h6)] || ((wire8 ?
                  wire13 : (7'h40)) - wire26[(2'h3):(1'h0)]))) : wire26[(2'h2):(1'h1)]);
          if ({(wire10 ?
                  reg29 : (($unsigned(reg29) >= reg29[(3'h7):(2'h3)]) >>> $unsigned(wire9)))})
            begin
              reg29 <= wire12[(4'h8):(2'h2)];
              reg30 <= wire7;
              reg31 <= $signed($unsigned(reg28[(1'h0):(1'h0)]));
              reg32 <= $unsigned(wire11);
            end
          else
            begin
              reg29 <= ((($unsigned($unsigned(wire11)) ?
                      (wire13 ?
                          $signed(reg28) : $unsigned((8'hb7))) : $unsigned(wire8)) ?
                  wire13[(5'h10):(4'he)] : wire13) | $signed($unsigned((-$signed(reg30)))));
              reg30 <= ((~|$signed(($unsigned(wire7) || (reg30 || reg29)))) * $signed((&(reg29[(3'h5):(3'h4)] ?
                  (^reg28) : $signed((8'hbd))))));
              reg31 <= (((|{(wire10 | wire9),
                      (wire7 ?
                          wire11 : reg31)}) <= $unsigned({(wire11 <= wire13)})) ?
                  reg30[(1'h1):(1'h1)] : wire8);
            end
          reg33 <= (|($unsigned({(7'h42)}) ?
              ((~^wire7) ?
                  $signed(wire8[(4'hb):(3'h5)]) : {(reg30 < reg29)}) : {$signed($signed(reg32))}));
          reg34 <= $unsigned(reg28);
          reg35 <= {reg33};
        end
      reg36 <= (((wire7[(4'h9):(1'h0)] < (+$signed(reg32))) ?
              wire9 : ($unsigned({wire12}) >= (~$signed(wire10)))) ?
          wire12[(4'hb):(2'h2)] : reg30);
      reg37 <= reg36;
      if ($signed(reg28[(1'h1):(1'h1)]))
        begin
          reg38 <= $signed((reg30 < (~$signed($unsigned(reg37)))));
          reg39 <= reg30;
          if ($unsigned((^~$signed(wire11[(4'ha):(1'h1)]))))
            begin
              reg40 <= reg28;
              reg41 <= $signed({(~^{reg40}), reg29[(4'hb):(3'h4)]});
            end
          else
            begin
              reg40 <= (8'hac);
            end
          reg42 <= {(~&$unsigned(($unsigned(wire10) ?
                  reg34[(2'h2):(1'h1)] : reg35)))};
        end
      else
        begin
          if ((({reg37} || $unsigned($unsigned(reg42[(3'h6):(2'h3)]))) <<< $signed((|$unsigned(reg39[(1'h1):(1'h0)])))))
            begin
              reg38 <= $unsigned($unsigned((~^(reg41[(1'h1):(1'h1)] ?
                  (~wire13) : $signed(wire9)))));
              reg39 <= reg32;
              reg40 <= ((!(wire12[(4'hf):(4'hb)] ?
                      $signed(reg40) : ((reg36 ? reg30 : reg42) >>> (reg30 ?
                          wire8 : reg29)))) ?
                  {(($unsigned(reg32) <<< $unsigned(reg31)) - $signed($signed(reg33))),
                      reg41[(2'h3):(1'h0)]} : (reg31 ^ reg34));
            end
          else
            begin
              reg38 <= (7'h40);
              reg39 <= wire26[(2'h3):(2'h3)];
              reg40 <= $signed($unsigned($unsigned(((!reg30) ?
                  wire26[(2'h2):(1'h0)] : $signed((7'h40))))));
              reg41 <= $signed($unsigned($unsigned(wire9)));
            end
          reg42 <= reg33[(1'h0):(1'h0)];
          reg43 <= ((~&reg35[(2'h3):(1'h1)]) ?
              (8'h9c) : $signed(reg38[(3'h5):(2'h2)]));
          if (($unsigned($unsigned(($signed(reg42) != wire10))) << (reg42[(3'h5):(3'h5)] ?
              wire7 : ($unsigned((wire7 ^~ reg40)) - (8'hb7)))))
            begin
              reg44 <= reg43;
              reg45 <= reg33;
            end
          else
            begin
              reg44 <= reg30;
              reg45 <= wire26[(2'h2):(2'h2)];
              reg46 <= reg32;
            end
        end
      reg47 <= $unsigned({{($unsigned((8'hb6)) ?
                  (wire11 ? (8'ha7) : reg36) : reg40),
              {(reg36 ? wire26 : reg40)}}});
    end
  assign wire48 = $unsigned(reg45[(3'h4):(3'h4)]);
  assign wire49 = $unsigned(((^~(~|((8'h9e) + (8'ha8)))) ?
                      ($signed(reg41) && $signed(reg30[(2'h3):(2'h2)])) : (($unsigned(reg44) ?
                              {reg28} : reg37[(1'h1):(1'h0)]) ?
                          (reg46[(4'h8):(2'h3)] ?
                              $signed(wire13) : reg43) : (wire9[(1'h1):(1'h1)] ?
                              (reg28 ? reg30 : wire7) : reg39))));
  assign wire50 = ($signed((wire49 ^~ reg40[(1'h1):(1'h1)])) ?
                      {$signed(reg29),
                          ((reg46[(4'h8):(3'h5)] == $unsigned(wire12)) ?
                              $unsigned(reg39[(1'h0):(1'h0)]) : {reg36})} : $signed((reg42[(4'hb):(4'h9)] ?
                          wire11 : (^~reg35[(1'h1):(1'h1)]))));
  assign wire51 = (reg43 ?
                      $signed((reg37 >= $signed({wire26}))) : $signed($unsigned((|{reg44}))));
  assign wire52 = (!{(reg32 * {reg36[(4'h9):(3'h6)]})});
  assign wire53 = reg47;
  assign wire54 = $unsigned(((wire48 ?
                      $signed((-reg29)) : $signed(wire11)) < $unsigned({$unsigned(reg47)})));
  assign wire55 = ($unsigned(wire13[(3'h5):(2'h3)]) ?
                      {reg28[(3'h6):(3'h4)]} : (~&{$unsigned((^~reg31))}));
  assign wire56 = (^~($signed(reg44) ?
                      (reg40 ?
                          $signed($signed(wire48)) : wire54[(1'h1):(1'h1)]) : wire51));
  module57 #() modinst84 (wire83, clk, reg30, reg42, wire49, wire10);
  assign wire85 = $signed($unsigned((wire83[(3'h5):(1'h0)] ?
                      reg42 : {reg40[(1'h1):(1'h1)]})));
  assign wire86 = wire55;
  assign wire87 = ((reg32[(3'h5):(2'h3)] | ((~^(8'hb8)) || reg28)) ?
                      ($unsigned((reg45[(2'h3):(1'h1)] + (~&wire48))) ?
                          $unsigned((^{reg42})) : reg29[(3'h4):(3'h4)]) : ((+{(+reg33)}) ~^ $unsigned(reg41[(1'h0):(1'h0)])));
endmodule

module module57
#(parameter param81 = (8'ha1), 
parameter param82 = ((~&(^((param81 ? param81 : param81) ? param81 : param81))) ? (^(|((param81 > (8'hbb)) || param81))) : param81))
(y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire61;
  input wire [(4'hd):(1'h0)] wire60;
  input wire [(3'h5):(1'h0)] wire59;
  input wire [(4'h9):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire62;
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire62,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire62 = (~|$unsigned(({$unsigned(wire59), (wire61 > (8'haa))} ?
                      $signed($signed(wire60)) : wire60[(4'h8):(3'h7)])));
  always
    @(posedge clk) begin
      if ((|$signed(wire59)))
        begin
          if (({wire58} ?
              $unsigned(wire62[(3'h4):(2'h2)]) : (~((-$signed((8'hb5))) ?
                  $signed($unsigned((8'ha0))) : (~&wire60[(4'h8):(1'h1)])))))
            begin
              reg63 <= (~|{($unsigned((wire60 + wire60)) | (wire62[(3'h4):(3'h4)] ?
                      wire62[(1'h0):(1'h0)] : wire62[(1'h1):(1'h0)]))});
              reg64 <= $signed(($signed($unsigned((-(8'h9e)))) >>> (((8'hb7) || (^wire60)) ?
                  $signed((~wire61)) : wire59[(2'h3):(1'h1)])));
              reg65 <= (+((-$unsigned({wire60, wire62})) | wire58));
              reg66 <= $signed({$signed($signed(reg63))});
            end
          else
            begin
              reg63 <= ((wire59[(2'h3):(2'h2)] ?
                      $signed(reg64[(2'h2):(1'h1)]) : {{(^~reg63), (&reg64)},
                          ((reg64 ? reg65 : (8'hba)) & (wire58 ^ (8'hbe)))}) ?
                  ((wire60[(4'h9):(2'h2)] ?
                          ($unsigned((8'ha7)) ?
                              $unsigned(wire58) : wire59) : $signed($unsigned(wire58))) ?
                      $signed($signed($unsigned(wire58))) : (~&reg66[(3'h7):(1'h1)])) : (wire58[(2'h3):(1'h0)] ?
                      (reg65[(4'h9):(2'h2)] ^ ({(8'ha5), wire62} ?
                          $signed(reg65) : $unsigned((7'h40)))) : (reg64 == (^{reg65,
                          reg64}))));
              reg64 <= ($unsigned($unsigned({((8'hbd) < wire60)})) > (((wire60 ?
                  $unsigned(reg64) : reg63) & reg63[(1'h1):(1'h1)]) >> (|(wire62 - reg63[(2'h2):(1'h1)]))));
              reg65 <= ($unsigned((($unsigned(wire62) - wire61[(2'h2):(2'h2)]) ?
                  (~|(wire61 == wire60)) : $signed(((7'h44) ?
                      reg66 : reg66)))) < wire61[(2'h3):(2'h3)]);
              reg66 <= reg64[(4'hf):(3'h4)];
              reg67 <= ({((reg64[(4'hc):(3'h7)] ?
                      (^wire58) : (wire61 >>> reg66)) << wire61[(3'h4):(3'h4)])} ^ (wire59[(3'h4):(2'h3)] || reg64[(4'hb):(3'h6)]));
            end
        end
      else
        begin
          reg63 <= (~&wire60);
          reg64 <= $unsigned((^~(^(wire62[(1'h0):(1'h0)] > $unsigned(wire61)))));
          reg65 <= wire59;
        end
      reg68 <= wire61;
    end
  always
    @(posedge clk) begin
      reg69 <= {$unsigned(reg67[(4'h9):(1'h1)]),
          {$signed(reg63), reg65[(4'hd):(4'h9)]}};
      reg70 <= (&(~|($unsigned(wire61[(3'h4):(2'h2)]) ?
          $unsigned((reg63 >= reg64)) : {reg68})));
      reg71 <= wire59;
      reg72 <= reg64[(5'h10):(3'h7)];
      if (reg63[(2'h2):(2'h2)])
        begin
          reg73 <= (((~|$signed((!(8'ha1)))) ^ $unsigned($unsigned($signed(wire58)))) ?
              (wire61 == reg71) : wire60[(4'h9):(3'h6)]);
          reg74 <= wire61[(2'h3):(1'h1)];
        end
      else
        begin
          reg73 <= $unsigned(($signed((8'haf)) ?
              (($unsigned(reg72) ?
                  (8'hae) : (8'hab)) >>> $unsigned($unsigned((8'ha1)))) : wire60[(4'h8):(3'h4)]));
          reg74 <= (^~($unsigned((reg65[(3'h4):(1'h1)] | $unsigned(reg64))) >= (8'hbc)));
          reg75 <= wire62[(2'h3):(2'h2)];
          reg76 <= {(~^reg64),
              (reg70[(1'h0):(1'h0)] ?
                  (((reg63 ? reg63 : reg69) > $unsigned((8'h9c))) ?
                      reg71 : ({reg73, wire58} ?
                          reg69[(3'h5):(1'h0)] : (wire61 || reg72))) : ({{reg72,
                          (8'ha3)},
                      $signed((8'ha9))} >>> ((reg65 + wire61) < (wire59 ?
                      wire59 : reg65))))};
          reg77 <= (reg69[(4'h8):(3'h6)] | ({wire59[(2'h3):(1'h1)]} ~^ reg64[(5'h11):(5'h11)]));
        end
    end
  assign wire78 = $unsigned({(~&reg67[(4'hf):(2'h2)])});
  assign wire79 = $unsigned($unsigned(reg68));
  assign wire80 = {(reg63[(2'h2):(1'h0)] ?
                          {reg70} : $signed(({(7'h42), reg71} < (^(8'hbf))))),
                      ({reg73} ^~ $signed((^$unsigned((7'h42)))))};
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  assign y = {wire25, wire21, wire20, wire19, reg24, reg23, reg22, (1'h0)};
  assign wire19 = wire18[(5'h14):(5'h12)];
  assign wire20 = (-$signed(((!wire16[(2'h2):(2'h2)]) * {(wire18 << wire15)})));
  assign wire21 = (wire17 ?
                      wire19 : (wire16 > {$unsigned((wire17 ? wire15 : wire20)),
                          $signed((wire17 & (8'hb0)))}));
  always
    @(posedge clk) begin
      reg22 <= wire21;
      reg23 <= $unsigned(wire21[(2'h2):(1'h1)]);
      reg24 <= wire17;
    end
  assign wire25 = reg22[(4'hb):(2'h3)];
endmodule
