module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h233):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire147;
  wire [(3'h5):(1'h0)] wire146;
  wire [(4'h8):(1'h0)] wire145;
  wire [(4'ha):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire112;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(4'hd):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(3'h4):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire143,
                 wire142,
                 wire141,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire4,
                 reg163,
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
                 reg144,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
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
                 (1'h0)};
  assign wire4 = $unsigned((7'h41));
  module5 #() modinst113 (.wire9(wire4), .wire6(wire1), .wire8(wire3), .wire7(wire2), .clk(clk), .y(wire112));
  assign wire114 = $signed({{(!wire3)}, wire1});
  assign wire115 = {$unsigned($signed($unsigned(((8'hba) ? wire2 : wire1))))};
  assign wire116 = $unsigned(wire4);
  assign wire117 = $signed($signed((^wire112[(1'h0):(1'h0)])));
  assign wire118 = wire0;
  assign wire119 = $signed({{$signed((wire112 - (8'hbe)))}, wire2});
  always
    @(posedge clk) begin
      reg120 <= {wire112, $unsigned($signed($signed({wire118})))};
      if (wire119)
        begin
          reg121 <= wire114;
          reg122 <= (-(!({(~(8'ha5))} ?
              {(wire115 ? wire4 : (7'h42))} : $signed(wire118))));
          reg123 <= (^~wire3);
          reg124 <= {wire1};
          reg125 <= $signed($unsigned(wire0[(3'h4):(1'h0)]));
        end
      else
        begin
          reg121 <= $signed((-(wire0 + {reg125})));
          reg122 <= wire118[(3'h4):(1'h0)];
        end
      reg126 <= (reg124 ? $signed((~^(^(~^(8'hb3))))) : wire118[(3'h6):(3'h5)]);
      reg127 <= ($signed(((reg125[(2'h2):(1'h1)] + $signed(reg124)) ?
          reg121 : ((&wire119) ?
              (wire118 - wire1) : (~&wire119)))) | (&$unsigned((^wire119))));
    end
  always
    @(posedge clk) begin
      reg128 <= ($signed(reg122) ?
          ({$signed((~(8'ha7)))} ~^ (^~wire3[(2'h3):(2'h2)])) : wire1[(5'h13):(5'h12)]);
      if ($signed($unsigned((((wire112 >= reg123) ?
              (^wire112) : (reg125 ? wire116 : reg123)) ?
          ($unsigned(reg128) ?
              wire112 : $signed(reg123)) : (wire112[(1'h0):(1'h0)] - (^reg120))))))
        begin
          reg129 <= ($unsigned({wire114[(2'h2):(1'h1)]}) - ($unsigned(wire4[(4'hc):(4'h8)]) ?
              reg127 : (~&((^~(8'ha4)) ? (~^wire118) : (~|wire1)))));
          reg130 <= wire112[(2'h2):(1'h0)];
          if ($signed($unsigned(wire112[(2'h2):(2'h2)])))
            begin
              reg131 <= $signed((8'hbc));
              reg132 <= $signed((|(^$signed({reg124}))));
              reg133 <= $signed(($unsigned($unsigned({(8'h9f)})) <<< {{$signed((8'hb9)),
                      (wire117 ? reg131 : reg126)}}));
              reg134 <= (+{reg132[(3'h6):(1'h0)],
                  ($unsigned((~reg121)) ?
                      $unsigned((reg131 ?
                          reg128 : wire116)) : ((wire3 >> wire116) ~^ (wire118 ?
                          reg121 : reg120)))});
            end
          else
            begin
              reg131 <= $unsigned(reg134[(2'h3):(2'h2)]);
              reg132 <= (reg127 ?
                  (~(wire118 << reg126[(2'h3):(2'h3)])) : (reg122[(1'h1):(1'h1)] ?
                      $signed(((^wire2) << wire4)) : (~^(&(reg126 ?
                          wire112 : reg120)))));
              reg133 <= $signed((8'hbc));
            end
          if ({$signed(((8'hb8) != (~&reg122[(4'h8):(1'h1)])))})
            begin
              reg135 <= reg131;
              reg136 <= $signed(reg135);
              reg137 <= {$unsigned((+wire118))};
            end
          else
            begin
              reg135 <= (~^reg122);
              reg136 <= $signed(reg123);
              reg137 <= $unsigned({(($unsigned(wire3) > (~&(7'h42))) * (wire116 >>> reg124[(3'h4):(2'h2)]))});
            end
          reg138 <= {$unsigned($unsigned(((wire114 <<< wire112) >>> (-reg136)))),
              wire116[(1'h0):(1'h0)]};
        end
      else
        begin
          if ({$unsigned({($signed(wire112) <<< (~|wire119)), (~|{reg122})}),
              wire117})
            begin
              reg129 <= (($unsigned((wire115 ? (^~reg138) : reg121)) ?
                      $unsigned(($unsigned(reg122) >>> {reg137,
                          reg121})) : (wire3[(1'h0):(1'h0)] && ($signed(reg129) == $signed(wire118)))) ?
                  ($signed($unsigned({wire116})) & wire112) : wire115);
              reg130 <= (8'hbf);
              reg131 <= reg132;
              reg132 <= (($signed(((^~reg123) ?
                          $unsigned((8'hbb)) : (reg121 != wire115))) ?
                      wire0[(1'h1):(1'h1)] : wire115[(1'h1):(1'h1)]) ?
                  {(~(wire3[(4'h8):(1'h0)] ?
                          reg125 : wire115))} : ($signed(($signed(wire3) <= $unsigned(wire3))) ?
                      $unsigned((((8'hb0) ? reg120 : reg121) ?
                          (~&wire114) : $signed(reg138))) : reg138[(2'h3):(1'h1)]));
            end
          else
            begin
              reg129 <= ((wire116[(1'h0):(1'h0)] ~^ ((!$signed(wire115)) ?
                      $unsigned(reg128[(1'h1):(1'h1)]) : ($signed(reg124) || wire2[(4'ha):(1'h1)]))) ?
                  reg129[(3'h7):(3'h6)] : $unsigned(wire115[(5'h10):(2'h2)]));
              reg130 <= $unsigned((wire3 ?
                  wire115[(3'h7):(3'h4)] : ($signed((wire1 ? reg123 : reg129)) ?
                      wire119[(3'h4):(2'h2)] : wire117[(3'h7):(1'h1)])));
              reg131 <= $signed(wire3[(2'h2):(2'h2)]);
              reg132 <= $unsigned(reg136);
            end
        end
      reg139 <= reg122[(3'h7):(3'h5)];
      reg140 <= reg139;
    end
  assign wire141 = $unsigned(($signed((8'hb6)) ?
                       reg127[(4'ha):(4'ha)] : wire118));
  assign wire142 = reg137[(1'h0):(1'h0)];
  assign wire143 = $signed((^~{$unsigned($unsigned(wire2))}));
  always
    @(posedge clk) begin
      reg144 <= (~|reg126[(2'h3):(1'h0)]);
    end
  assign wire145 = reg120[(4'h9):(3'h7)];
  assign wire146 = (-$signed((8'h9e)));
  assign wire147 = wire145;
  always
    @(posedge clk) begin
      reg148 <= $unsigned(((((wire116 ?
              wire112 : reg134) != ((8'ha4) <<< wire141)) ?
          reg140 : $unsigned(reg128[(5'h10):(2'h2)])) >>> ((7'h40) ?
          $unsigned(reg138[(3'h4):(1'h1)]) : ((reg121 ^ reg125) ?
              (wire117 && reg124) : (wire119 ? reg121 : wire146)))));
      if ($signed((8'ha4)))
        begin
          reg149 <= $unsigned(reg136[(1'h0):(1'h0)]);
          if ($unsigned({((wire147[(3'h6):(3'h6)] >>> reg134) ?
                  $unsigned($unsigned(wire119)) : $signed((wire145 && reg121)))}))
            begin
              reg150 <= (8'ha9);
            end
          else
            begin
              reg150 <= $unsigned(wire141[(2'h2):(1'h0)]);
              reg151 <= $signed(($unsigned((&(reg140 ?
                  wire114 : wire141))) <= ($unsigned(reg138[(3'h4):(3'h4)]) >>> {wire145,
                  (8'ha4)})));
              reg152 <= {(!($unsigned($unsigned(reg128)) ?
                      {((7'h43) ^~ wire0)} : $unsigned({reg125})))};
            end
          reg153 <= ($signed($unsigned($signed($signed((8'hb7))))) ?
              ($signed(($unsigned(wire115) ?
                  ((8'hac) ?
                      wire114 : reg121) : $signed(reg137))) >= $signed($unsigned(reg132))) : wire2);
          reg154 <= reg152[(1'h1):(1'h1)];
          reg155 <= {$signed($signed(reg121))};
        end
      else
        begin
          reg149 <= (((|($signed(reg135) >> wire118[(1'h0):(1'h0)])) != (^~$signed((wire119 ?
                  reg134 : wire2)))) ?
              ($unsigned((&(&reg148))) ?
                  $signed($signed({wire142,
                      wire115})) : $signed(reg126)) : reg151[(4'ha):(3'h7)]);
          reg150 <= (((^~$signed((^wire116))) ?
              ($signed((wire141 ? wire114 : (8'ha6))) ?
                  ((reg120 ? wire117 : reg154) ?
                      {reg139} : wire3) : ($signed(reg132) ?
                      (^~wire112) : (wire2 ?
                          wire147 : reg125))) : reg153[(2'h2):(1'h1)]) | ((8'hb4) ?
              $signed(((reg152 ? (7'h43) : reg129) ^~ {reg121,
                  wire112})) : ((~^$signed(reg134)) | (wire115 ~^ {reg155}))));
          reg151 <= wire116;
        end
      reg156 <= $signed((reg126[(1'h0):(1'h0)] ?
          (~^((8'hb4) ?
              $unsigned((8'ha6)) : (wire4 * wire117))) : $signed((|wire117))));
      if ((&((reg125 ?
          reg152 : (reg151 ?
              $unsigned(reg152) : (reg156 ?
                  reg133 : (8'ha1)))) | (|$signed((reg151 * wire3))))))
        begin
          if ({wire116,
              $unsigned((((wire143 >= wire147) ?
                  $signed((8'hb5)) : wire117) | {(wire119 * reg120),
                  $signed(reg134)}))})
            begin
              reg157 <= $unsigned((($unsigned({wire0}) <= (8'h9f)) ?
                  ($unsigned({wire146, (8'hbc)}) ?
                      wire3 : {(&reg128)}) : ($unsigned(reg151) * reg124)));
              reg158 <= {(reg149 ? reg121[(4'h9):(2'h3)] : (reg132 ^~ reg122))};
              reg159 <= $unsigned((~&wire112));
            end
          else
            begin
              reg157 <= (~&reg151);
              reg158 <= (wire145 ? wire2[(4'ha):(3'h4)] : wire147);
            end
          reg160 <= $signed({({$unsigned(reg124)} <= wire118)});
        end
      else
        begin
          reg157 <= ((wire141[(3'h7):(3'h7)] > reg134[(3'h5):(3'h5)]) ?
              wire3 : (-(wire112 || ($signed((8'hb4)) ?
                  $signed(reg137) : $unsigned(reg121)))));
          reg158 <= (({(wire4[(2'h2):(1'h1)] < ((8'ha4) - reg154)),
                      (|{reg121})} ?
                  {(^~$unsigned(wire3)),
                      $unsigned($unsigned(wire116))} : reg128[(3'h4):(3'h4)]) ?
              reg126[(2'h3):(2'h3)] : (~^((wire147 ^~ wire0[(3'h4):(3'h4)]) || $unsigned($signed(reg125)))));
          if ($unsigned($signed($unsigned(reg137[(1'h1):(1'h1)]))))
            begin
              reg159 <= wire143;
              reg160 <= ({($unsigned(wire1[(4'hc):(4'hc)]) ?
                          $unsigned((wire114 ? reg130 : reg156)) : reg139)} ?
                  $unsigned($unsigned(wire118)) : {{{$signed(wire141),
                              (wire2 >= reg154)}}});
              reg161 <= (+wire141[(5'h10):(3'h6)]);
              reg162 <= (wire117 ? reg121 : wire3);
              reg163 <= reg157[(3'h5):(3'h5)];
            end
          else
            begin
              reg159 <= (^reg138[(3'h5):(1'h0)]);
              reg160 <= $signed((+reg163[(2'h2):(1'h0)]));
              reg161 <= $unsigned(($unsigned(((wire116 ? reg121 : reg126) ?
                      (wire2 & reg154) : wire116)) ?
                  wire147 : (({wire116} ^~ $signed((8'hb2))) ?
                      $signed(((8'hb4) >>> (8'ha0))) : ($signed(reg139) >> reg132[(4'h8):(1'h0)]))));
            end
        end
    end
endmodule

module module5
#(parameter param110 = ((((|(7'h40)) | {(8'hbc)}) >> ((((8'h9c) << (8'h9d)) ? ((7'h40) <<< (8'ha9)) : (8'hb1)) == (8'hba))) ? (~^(~(~(~^(8'hbf))))) : (+(((+(8'ha8)) ? ((8'h9d) <= (8'h9f)) : ((8'hb9) ? (8'ha4) : (8'ha6))) ? {((8'hba) ? (8'ha0) : (8'hb0))} : ({(8'hb8)} ? (~&(8'ha1)) : {(8'hbd), (8'h9f)})))), 
parameter param111 = (!(!(param110 * (param110 || (param110 + (7'h41)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire103,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire10 = ((&(+wire7[(2'h3):(1'h1)])) ?
                      wire6 : ($signed($signed(((7'h40) > wire9))) ?
                          wire6[(1'h1):(1'h1)] : $unsigned(wire7)));
  assign wire11 = $unsigned(($signed($unsigned(wire10[(5'h13):(3'h5)])) + {(!$signed(wire7))}));
  always
    @(posedge clk) begin
      reg12 <= (+wire10[(3'h7):(3'h7)]);
      reg13 <= $unsigned(reg12);
      reg14 <= ($signed(wire10[(4'h9):(2'h2)]) ?
          (wire9 >= ($unsigned((reg13 << reg12)) + ((wire10 || reg13) <<< (reg12 ?
              wire7 : reg13)))) : $unsigned((reg12 || (reg13 ?
              (wire11 || wire8) : {wire8}))));
    end
  assign wire15 = $signed(wire10[(2'h2):(2'h2)]);
  assign wire16 = ($signed(wire9) ?
                      (8'ha1) : (wire11[(3'h5):(3'h4)] ?
                          $signed(wire7) : {reg12[(4'hd):(4'hc)], wire7}));
  module17 #() modinst82 (wire81, clk, wire7, wire16, wire6, wire10);
  assign wire83 = {($signed(wire11[(2'h3):(2'h2)]) ~^ ($unsigned($signed(wire8)) ?
                          ((wire8 ^~ wire8) >> (~wire16)) : (wire11[(3'h6):(3'h4)] == $signed(wire10)))),
                      (^wire15)};
  assign wire84 = ($signed((+((+wire7) + $signed((8'hb6))))) << (-(reg13[(4'hd):(3'h6)] <= (~^(wire6 + wire10)))));
  assign wire85 = $unsigned($unsigned((8'ha1)));
  assign wire86 = (($signed(reg14[(2'h2):(1'h1)]) ^~ ({((8'hbc) ?
                              wire10 : wire10)} ?
                      $signed(wire81[(3'h5):(2'h2)]) : ($unsigned(wire10) <= $unsigned(reg14)))) ^ (((~wire16[(1'h1):(1'h0)]) ?
                          (~wire16) : $unsigned(wire15[(1'h0):(1'h0)])) ?
                      (^$signed(wire85[(3'h6):(3'h5)])) : $signed($unsigned($unsigned(wire16)))));
  module87 #() modinst104 (.y(wire103), .clk(clk), .wire89(wire8), .wire90(wire85), .wire88(wire6), .wire91(reg13), .wire92(wire86));
  assign wire105 = wire83[(5'h11):(4'h8)];
  assign wire106 = $signed((wire81[(3'h5):(2'h2)] ?
                       wire81 : $unsigned($unsigned((wire10 <<< wire15)))));
  assign wire107 = (wire84[(1'h1):(1'h0)] != wire105[(1'h0):(1'h0)]);
  assign wire108 = wire7[(2'h3):(1'h0)];
  assign wire109 = $unsigned((|wire106[(3'h6):(3'h5)]));
endmodule

module module87
#(parameter param101 = ({((((8'ha9) ~^ (8'h9d)) << (~(8'haa))) ? ((~|(7'h41)) << ((8'hab) ? (8'haa) : (7'h41))) : (^(8'ha6))), (({(8'ha9)} ~^ {(8'h9e)}) ~^ {((8'haa) != (8'ha7))})} & (({((8'ha8) << (7'h44))} ? ((+(8'hbe)) ? (~&(8'hac)) : ((8'hbc) | (8'hbe))) : ((&(7'h40)) ? ((8'ha7) ^ (8'ha8)) : ((8'had) ? (8'hb6) : (8'hba)))) && ((((8'hab) ? (8'hb2) : (8'hb3)) && {(7'h41), (8'hac)}) > (~&(~(8'haa)))))), 
parameter param102 = param101)
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire92;
  input wire [(4'hd):(1'h0)] wire91;
  input wire signed [(4'he):(1'h0)] wire90;
  input wire [(2'h3):(1'h0)] wire89;
  input wire [(5'h13):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire93;
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 reg97,
                 (1'h0)};
  assign wire93 = ((-$signed(wire92)) ^~ (!$signed($unsigned($signed(wire89)))));
  assign wire94 = (8'h9c);
  assign wire95 = wire89;
  assign wire96 = {(wire93[(1'h0):(1'h0)] ?
                          $signed((&wire89[(2'h3):(1'h0)])) : $signed(($signed(wire93) ?
                              (~^wire94) : $signed(wire92)))),
                      (8'hbd)};
  always
    @(posedge clk) begin
      reg97 <= (~|($signed($unsigned((~&wire96))) ?
          $unsigned(($signed((8'hbc)) ?
              $signed(wire94) : $unsigned(wire93))) : $unsigned($signed((wire92 ~^ wire92)))));
    end
  assign wire98 = $signed($unsigned($signed(wire89)));
  assign wire99 = $signed(wire91[(3'h7):(3'h6)]);
  assign wire100 = $unsigned(wire99[(3'h5):(1'h0)]);
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h2c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire22;
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire22,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg64,
                 reg63,
                 reg62,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
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
                 (1'h0)};
  assign wire22 = {wire20};
  always
    @(posedge clk) begin
      if (wire19)
        begin
          reg23 <= ((~&(wire19 >>> (~|wire20))) ?
              wire20 : $unsigned({{(wire20 >> wire20)},
                  (|(wire21 ? (8'hab) : wire22))}));
          reg24 <= ((~&$signed({(wire21 < wire21), (wire18 >> wire18)})) ?
              {(7'h42)} : $signed(wire19[(3'h6):(1'h0)]));
          reg25 <= ({($unsigned((~|reg23)) ?
                      reg23 : $unsigned($signed(wire21))),
                  $signed($unsigned(((8'h9d) <= wire19)))} ?
              wire22[(3'h5):(1'h0)] : {(~|$signed(wire22)),
                  (|{{reg24, wire18}})});
          reg26 <= $signed(((wire20 ?
              wire20[(3'h5):(1'h0)] : (!$unsigned((8'ha3)))) <= (($signed(wire19) >= {reg24}) >> ((wire18 && (8'haf)) ^~ $unsigned(wire18)))));
        end
      else
        begin
          reg23 <= $unsigned((($unsigned((reg23 ?
                  wire18 : wire22)) >> (~&(wire19 ? reg25 : reg24))) ?
              ((~^$unsigned(reg25)) || ((~|(8'ha4)) ?
                  (8'hb6) : reg24)) : $signed($signed($signed(wire21)))));
          if ((~|$signed({(-(wire18 ? wire21 : reg25))})))
            begin
              reg24 <= $signed(($signed(((wire18 || reg23) ~^ $unsigned(wire19))) & (&({wire20} ?
                  wire19 : wire19[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg24 <= wire20[(4'h9):(3'h5)];
              reg25 <= (reg26[(4'hd):(2'h3)] < wire22);
              reg26 <= {$signed($signed((-(8'had))))};
            end
          if (reg25[(4'hc):(3'h5)])
            begin
              reg27 <= (reg24[(4'hf):(3'h6)] - $unsigned((wire18[(2'h3):(2'h3)] ~^ $unsigned((wire22 & reg24)))));
              reg28 <= wire19;
            end
          else
            begin
              reg27 <= reg26;
              reg28 <= wire21[(4'hb):(3'h5)];
              reg29 <= wire19;
              reg30 <= ($unsigned(((((8'haa) ? reg27 : wire21) >> {reg23}) ?
                      (reg25 ^ (8'ha2)) : ((reg28 ?
                          reg27 : reg27) || wire22))) ?
                  wire18[(1'h1):(1'h0)] : {(+reg29[(1'h0):(1'h0)]),
                      (wire20 ?
                          $unsigned((reg23 ?
                              reg27 : reg25)) : (~$unsigned((8'ha5))))});
              reg31 <= (^(wire19 <= (reg29 << wire18[(2'h3):(2'h2)])));
            end
          if (({wire21[(3'h6):(2'h2)]} ?
              reg31[(1'h1):(1'h0)] : $signed((~wire20[(4'h8):(4'h8)]))))
            begin
              reg32 <= $signed($unsigned($unsigned((-(!reg31)))));
              reg33 <= (({(^(8'ha2))} <= (reg29[(2'h3):(1'h1)] == wire19[(3'h6):(2'h3)])) ?
                  $unsigned($unsigned((~|reg31))) : wire21[(1'h0):(1'h0)]);
              reg34 <= (reg33 ?
                  $unsigned(($unsigned(reg26) * $unsigned($unsigned(wire18)))) : $unsigned($signed(((~wire18) <<< reg23))));
              reg35 <= {($unsigned(reg27) ?
                      $signed(wire21[(4'hb):(3'h5)]) : wire18[(2'h2):(1'h1)]),
                  wire22};
              reg36 <= reg35[(3'h5):(3'h5)];
            end
          else
            begin
              reg32 <= $signed(reg31);
              reg33 <= $unsigned(({wire22, $signed($signed(reg30))} <= (wire18 ?
                  $unsigned(reg23[(4'ha):(1'h0)]) : $signed($unsigned(reg29)))));
              reg34 <= $unsigned(((~|((|reg36) * (^~wire18))) ~^ (reg35[(2'h2):(2'h2)] | reg25)));
              reg35 <= $unsigned(($signed(reg27) ?
                  wire21 : (^~(^~$unsigned(reg34)))));
            end
          if (reg26[(5'h11):(4'he)])
            begin
              reg37 <= (reg29 > {wire18[(3'h5):(3'h5)],
                  ((8'hb7) ?
                      {$unsigned((8'haf)), wire20} : {{wire20, reg27}})});
              reg38 <= ((~|$unsigned(reg25[(4'hd):(4'hb)])) ?
                  ($signed((^((8'hab) ?
                      reg28 : reg23))) <<< (~^$signed($signed(reg37)))) : reg28);
              reg39 <= ((~|(wire20 ?
                  (~|(reg28 ~^ (8'h9c))) : reg35[(2'h3):(2'h2)])) * {$unsigned((reg29[(4'hd):(4'hd)] ?
                      (reg26 ? reg23 : wire21) : (reg32 ? reg23 : reg26)))});
              reg40 <= ($signed((reg25 ? reg30 : reg38)) ?
                  reg34 : (($unsigned(reg24[(5'h10):(1'h0)]) ?
                      ($signed(reg39) != {wire22}) : (((8'haf) ?
                          (8'hb6) : reg38) >= $signed((8'hb7)))) && reg36[(2'h3):(1'h1)]));
            end
          else
            begin
              reg37 <= reg30[(3'h5):(2'h2)];
              reg38 <= reg30;
              reg39 <= (($signed($signed(wire21)) ?
                      (|(^(wire20 ?
                          reg26 : wire20))) : $signed($unsigned((8'hbf)))) ?
                  ($signed({{reg37}}) - $signed({(+(8'ha8))})) : (reg25 != $signed(({reg26,
                          reg38} ?
                      (reg38 ? reg39 : wire22) : $signed(reg32)))));
              reg40 <= reg35[(4'ha):(1'h0)];
              reg41 <= {{reg31[(2'h3):(2'h3)],
                      ($signed(reg37) ~^ (~^(reg39 ? reg31 : reg28)))},
                  ((reg37[(4'hb):(1'h1)] ?
                      (!reg35[(4'hd):(4'hd)]) : $signed((~^reg35))) & (~$unsigned(((8'ha4) ?
                      wire22 : reg26))))};
            end
        end
      if ((!$unsigned(reg37[(4'ha):(3'h7)])))
        begin
          reg42 <= ($signed(((reg23 ?
                  $unsigned(wire22) : $signed(reg36)) ^ (reg30 & (reg29 ?
                  wire21 : reg26)))) ?
              $signed(reg34) : (reg29[(1'h1):(1'h0)] < $unsigned(reg23[(1'h0):(1'h0)])));
          if ($signed($signed(reg34)))
            begin
              reg43 <= reg39;
              reg44 <= $signed(($unsigned($signed(((8'hb9) ? reg39 : reg40))) ?
                  (reg34[(1'h1):(1'h0)] ?
                      reg24 : {reg36[(2'h3):(2'h2)],
                          $signed(reg26)}) : $unsigned($unsigned((&wire19)))));
              reg45 <= (reg33[(4'hc):(2'h3)] ?
                  (reg35[(4'hc):(1'h0)] ?
                      {($signed(reg44) ?
                              reg36[(1'h1):(1'h1)] : ((8'hb7) ? reg25 : reg29)),
                          $unsigned(reg28[(3'h4):(1'h1)])} : $unsigned((^reg33))) : {(+$unsigned(reg40)),
                      $signed({$signed(wire20)})});
              reg46 <= wire20[(4'he):(3'h5)];
            end
          else
            begin
              reg43 <= reg37;
              reg44 <= $signed(reg39[(1'h0):(1'h0)]);
              reg45 <= $unsigned((reg26[(5'h14):(3'h5)] ?
                  reg34 : (((&reg29) ?
                      $signed(reg37) : $signed((7'h42))) - (8'hb9))));
            end
          reg47 <= {$unsigned((~&(+reg41))), $signed(reg25[(4'h9):(4'h9)])};
          if ($unsigned((reg27[(2'h3):(1'h1)] | reg47)))
            begin
              reg48 <= reg37;
              reg49 <= (~&(reg36[(3'h5):(2'h2)] ^~ (reg40[(4'h9):(3'h7)] << (!(reg38 ?
                  wire21 : reg39)))));
              reg50 <= $unsigned(($signed(reg23[(1'h1):(1'h1)]) <<< reg42[(3'h6):(2'h2)]));
              reg51 <= {(($signed($signed((7'h42))) ?
                          (reg42 ^ (-reg31)) : reg23) ?
                      (^~wire22[(4'hc):(4'hc)]) : {(-(~reg35)),
                          $signed($unsigned((8'h9f)))})};
              reg52 <= $unsigned(reg41[(2'h2):(2'h2)]);
            end
          else
            begin
              reg48 <= (reg40 ?
                  reg51[(1'h0):(1'h0)] : $signed(reg35[(4'h9):(2'h3)]));
              reg49 <= $signed((-reg32));
              reg50 <= (|{$unsigned((|$unsigned((8'hbf)))),
                  $signed((^~(|reg51)))});
              reg51 <= $signed({{((reg39 || (8'ha7)) ?
                          (reg43 || wire19) : reg51)}});
              reg52 <= reg25;
            end
          reg53 <= (reg33[(4'ha):(2'h2)] ?
              reg45[(4'hb):(2'h2)] : ($signed($unsigned(reg36[(1'h1):(1'h0)])) <= wire18[(2'h2):(2'h2)]));
        end
      else
        begin
          reg42 <= (((!reg43) << (($signed((8'hb7)) ?
                  (wire20 ^~ (8'haa)) : (~^reg53)) && (&$signed(reg31)))) ?
              {$signed($unsigned($unsigned(reg36)))} : $signed((-$signed((reg23 ?
                  (8'h9d) : reg39)))));
          if ({reg30})
            begin
              reg43 <= wire21;
              reg44 <= (|reg41);
              reg45 <= (reg33[(5'h13):(5'h11)] ?
                  reg43[(2'h2):(1'h1)] : reg34[(1'h1):(1'h1)]);
              reg46 <= reg42;
            end
          else
            begin
              reg43 <= ((~($unsigned($unsigned(reg47)) ?
                      ((reg51 ? (8'hb5) : (7'h40)) ?
                          $signed(reg39) : (reg31 > (7'h43))) : $signed((wire19 >> reg37)))) ?
                  (($signed($unsigned(reg43)) ^~ reg50[(3'h5):(2'h2)]) ?
                      reg39 : reg43) : $signed({(reg32[(3'h6):(3'h6)] ?
                          wire22 : (reg43 ? reg40 : reg49))}));
              reg44 <= (wire22[(1'h1):(1'h0)] ?
                  $signed(reg40[(5'h11):(2'h2)]) : (wire19 ?
                      reg40[(3'h4):(1'h1)] : (+$unsigned((reg39 >> reg25)))));
              reg45 <= (|$signed($signed($signed(reg49))));
              reg46 <= ((!((^reg39) ? reg46 : (|reg40))) + $unsigned(reg29));
            end
        end
      reg54 <= (-(8'ha6));
      reg55 <= $signed(($signed(((8'hbd) == reg25[(1'h0):(1'h0)])) ?
          reg36[(3'h4):(2'h3)] : reg23[(1'h1):(1'h0)]));
      reg56 <= (~(((!reg27) ?
              (wire20 ? reg24 : $signed(reg25)) : $signed($unsigned((8'ha9)))) ?
          reg27[(2'h2):(1'h0)] : $signed($unsigned(reg27))));
    end
  always
    @(posedge clk) begin
      reg57 <= $signed(((-{$signed(reg44), reg44}) ?
          ((^~(reg52 != wire20)) ?
              ((~|reg55) <= $signed(reg52)) : reg50[(1'h1):(1'h1)]) : reg35[(2'h2):(2'h2)]));
    end
  assign wire58 = reg57;
  assign wire59 = (reg40 << {{(wire20 ? reg28[(3'h6):(3'h4)] : {reg52})}});
  assign wire60 = $signed(reg35[(3'h7):(1'h0)]);
  assign wire61 = ((|$unsigned(reg36[(2'h2):(2'h2)])) > reg33[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg62 <= $signed(((reg38[(4'hf):(1'h0)] ? wire21 : (^$unsigned(reg37))) ?
          reg41[(1'h1):(1'h1)] : $signed((^~$signed(reg30)))));
      reg63 <= {$signed(reg52[(2'h3):(2'h2)]),
          $unsigned($unsigned({$signed(reg57)}))};
      reg64 <= $unsigned((+{(8'hb7), reg54}));
    end
  assign wire65 = $unsigned(reg29[(3'h7):(1'h0)]);
  assign wire66 = reg53[(3'h4):(1'h1)];
  assign wire67 = (-(~(~$unsigned($unsigned(reg36)))));
  assign wire68 = ((&$unsigned(reg31)) ^~ $signed(reg52[(2'h2):(2'h2)]));
  assign wire69 = ({(~|(~^$unsigned((7'h44))))} ?
                      ($signed(($unsigned(wire60) ^~ (^wire65))) ?
                          $unsigned(reg52) : ($unsigned(wire66[(5'h10):(4'hc)]) ?
                              wire61[(3'h6):(3'h6)] : (((7'h44) ?
                                  reg40 : reg25) * reg55))) : $signed(($signed({reg25}) >= (reg57 == wire65))));
  always
    @(posedge clk) begin
      reg70 <= reg55[(2'h3):(2'h2)];
      reg71 <= $signed($signed($signed(((~|(8'hb0)) > $signed(reg42)))));
      reg72 <= (wire61[(3'h5):(2'h3)] ?
          (~&$unsigned((|(-reg25)))) : ((-$signed({reg49, reg46})) ^~ {reg46,
              $unsigned((reg41 & reg36))}));
      reg73 <= $unsigned((^~$unsigned((((8'had) >> wire68) && reg45))));
    end
  assign wire74 = reg54[(1'h0):(1'h0)];
  assign wire75 = reg34;
  assign wire76 = {(+(&$unsigned(reg63[(1'h0):(1'h0)]))),
                      (~&((&$unsigned((8'haa))) ?
                          reg35 : ((^reg54) <= {wire74})))};
  assign wire77 = reg73;
  assign wire78 = wire59;
  assign wire79 = (~|$unsigned($unsigned((8'hb7))));
  assign wire80 = (reg50[(2'h3):(1'h0)] >= ($unsigned(((reg40 ?
                          reg71 : (8'haf)) * reg24)) ?
                      $unsigned(((reg27 ? reg56 : reg38) ?
                          (reg62 & wire19) : wire65[(4'ha):(2'h3)])) : ($signed($signed(wire20)) < (!(8'hb9)))));
endmodule
