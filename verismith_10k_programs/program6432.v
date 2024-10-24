module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire122;
  wire [(5'h11):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire201;
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  assign y = {wire120,
                 wire122,
                 wire123,
                 wire124,
                 wire138,
                 wire201,
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
                 reg135,
                 reg136,
                 reg137,
                 (1'h0)};
  module5 #() modinst121 (wire120, clk, wire2, wire1, wire0, wire4, wire3);
  assign wire122 = ($unsigned((-$unsigned((wire0 & (8'haf))))) == $unsigned(wire2[(2'h3):(1'h0)]));
  assign wire123 = {(wire3 ?
                           $signed($unsigned((~^wire4))) : wire122[(4'h8):(4'h8)])};
  assign wire124 = wire120;
  always
    @(posedge clk) begin
      if (wire3[(4'hf):(4'h8)])
        begin
          if ((~^$unsigned($signed($signed((wire122 ? wire1 : wire4))))))
            begin
              reg125 <= $signed(($unsigned($signed($signed(wire123))) ^~ wire122[(4'ha):(1'h0)]));
              reg126 <= (!$unsigned($unsigned($signed((wire124 >>> wire3)))));
              reg127 <= ($signed(wire2) ?
                  wire124[(3'h4):(2'h2)] : $unsigned($signed($unsigned($unsigned((8'h9d))))));
              reg128 <= wire122;
            end
          else
            begin
              reg125 <= ($signed((wire0 <<< (!$signed(wire4)))) <= $signed(((wire120[(1'h1):(1'h0)] ^ {reg125,
                  (8'ha9)}) >> (reg126 >>> (wire4 ? reg126 : wire120)))));
              reg126 <= $unsigned($unsigned(wire120[(3'h4):(3'h4)]));
            end
          reg129 <= $unsigned(($signed(($signed(wire3) || {wire1})) ~^ $signed((^~$signed(wire1)))));
          if (wire2[(4'h9):(3'h4)])
            begin
              reg130 <= $unsigned((-wire0));
              reg131 <= (^~$signed(((wire123 ?
                      wire3[(5'h11):(3'h5)] : $signed(wire2)) ?
                  {wire4[(5'h10):(4'he)],
                      wire120[(4'h8):(2'h2)]} : ($signed(reg126) >= wire120))));
              reg132 <= ({(reg130 ?
                      wire120 : (wire4[(3'h4):(1'h0)] ?
                          reg125 : $signed((8'ha0)))),
                  $signed(wire0[(4'he):(2'h2)])} ^ (^~reg126));
              reg133 <= $signed($unsigned({reg125}));
              reg134 <= (~|$unsigned((!(~|reg125[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg130 <= ($unsigned(wire120) ?
                  (-{((~&reg130) * $unsigned((8'ha1))),
                      wire1[(5'h10):(4'h9)]}) : (|reg127[(5'h14):(5'h14)]));
              reg131 <= $signed((&$signed($signed(reg134))));
              reg132 <= (wire4 ?
                  reg129 : (^(wire122[(1'h0):(1'h0)] ?
                      reg134 : (&$unsigned(wire122)))));
            end
        end
      else
        begin
          if ((!$signed((wire123[(4'he):(3'h4)] ? (8'hac) : reg128))))
            begin
              reg125 <= {reg128};
              reg126 <= ($unsigned((wire122 - (reg127[(3'h4):(1'h1)] || reg128))) ?
                  (^~($signed($unsigned(reg132)) >> wire0[(4'h9):(3'h6)])) : wire122);
              reg127 <= $signed($unsigned($unsigned($signed(reg133))));
            end
          else
            begin
              reg125 <= reg132[(3'h5):(1'h1)];
              reg126 <= $signed(reg131);
              reg127 <= wire123[(4'hb):(4'h8)];
            end
          reg128 <= (8'haf);
          reg129 <= {$signed(wire122)};
          reg130 <= $signed($unsigned(reg129));
          if ((reg131[(2'h3):(2'h2)] ? (7'h40) : reg133[(4'he):(4'hb)]))
            begin
              reg131 <= (8'had);
              reg132 <= reg132;
              reg133 <= (&(($signed($signed(reg134)) * reg132) ?
                  reg132[(1'h0):(1'h0)] : (^~(!$signed(reg133)))));
              reg134 <= {(({$unsigned(wire2)} || (((8'hab) < reg130) ?
                          reg134 : wire0[(1'h1):(1'h1)])) ?
                      reg134 : wire124[(5'h12):(4'hc)]),
                  $unsigned($unsigned($signed(wire4[(5'h14):(4'hc)])))};
              reg135 <= (8'h9d);
            end
          else
            begin
              reg131 <= $unsigned({((~{wire124, reg129}) ~^ ((|wire122) ?
                      $signed((8'hac)) : reg126))});
              reg132 <= wire120;
              reg133 <= wire123[(4'hd):(3'h4)];
              reg134 <= $signed((^~reg132));
              reg135 <= ((^~$signed($unsigned(((8'hb6) & wire0)))) | $signed(reg129[(2'h3):(1'h1)]));
            end
        end
      reg136 <= $signed($unsigned((reg125 ? (~&$signed(wire4)) : wire1)));
      reg137 <= (^~reg129[(2'h3):(1'h0)]);
    end
  assign wire138 = $signed($signed($unsigned($unsigned($unsigned(wire4)))));
  module139 #() modinst202 (wire201, clk, wire1, reg126, reg134, reg135);
endmodule

module module139  (y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire143;
  input wire signed [(3'h5):(1'h0)] wire142;
  input wire signed [(5'h11):(1'h0)] wire141;
  input wire signed [(5'h14):(1'h0)] wire140;
  wire [(4'hd):(1'h0)] wire200;
  wire signed [(3'h5):(1'h0)] wire199;
  wire [(5'h10):(1'h0)] wire198;
  wire [(4'h9):(1'h0)] wire196;
  wire signed [(3'h6):(1'h0)] wire195;
  wire signed [(4'hb):(1'h0)] wire194;
  wire [(3'h7):(1'h0)] wire193;
  wire [(5'h13):(1'h0)] wire192;
  wire signed [(2'h3):(1'h0)] wire191;
  wire signed [(5'h12):(1'h0)] wire189;
  wire [(4'hc):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire144;
  reg signed [(3'h4):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire189,
                 wire155,
                 wire154,
                 wire153,
                 wire144,
                 reg197,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 (1'h0)};
  assign wire144 = $unsigned(((&$signed((wire142 ^ wire143))) == wire143));
  always
    @(posedge clk) begin
      reg145 <= $signed(wire141[(4'he):(3'h7)]);
      if (wire140[(4'he):(4'hb)])
        begin
          reg146 <= ((8'hb0) << (&wire141[(2'h2):(1'h1)]));
          reg147 <= (^$unsigned(wire141[(5'h11):(4'ha)]));
          reg148 <= wire142;
          reg149 <= wire144[(1'h0):(1'h0)];
          reg150 <= (~^(reg147 ? (7'h41) : reg148[(4'hd):(4'h8)]));
        end
      else
        begin
          reg146 <= (~|(reg147[(1'h0):(1'h0)] ?
              (((^~(8'haa)) ?
                  ((8'hb7) ?
                      (8'hb7) : reg148) : $signed(reg147)) >>> {$signed(reg149),
                  (+(8'ha1))}) : $unsigned(reg148)));
          reg147 <= reg150[(3'h7):(3'h6)];
          if ($unsigned({reg149}))
            begin
              reg148 <= reg149[(4'hb):(1'h0)];
              reg149 <= wire141;
              reg150 <= reg147[(3'h5):(2'h3)];
              reg151 <= (reg145[(1'h1):(1'h0)] < {$signed($unsigned({wire141,
                      (8'haa)}))});
            end
          else
            begin
              reg148 <= (~^reg147[(2'h2):(1'h1)]);
              reg149 <= (|(&(((-wire142) ?
                      reg145[(1'h0):(1'h0)] : (wire140 - wire140)) ?
                  $unsigned($signed(reg146)) : $signed((reg150 >> reg151)))));
              reg150 <= reg145;
              reg151 <= $signed(reg148[(3'h6):(2'h3)]);
            end
        end
      reg152 <= $signed($unsigned((+(^$signed(reg145)))));
    end
  assign wire153 = ((8'hb7) ^~ ($unsigned((+reg150)) ?
                       (reg145[(1'h0):(1'h0)] ?
                           reg146 : $unsigned((reg150 && reg151))) : $unsigned((((8'hb8) ?
                           reg148 : wire140) + $unsigned((8'hb1))))));
  assign wire154 = (8'hb3);
  assign wire155 = (+reg146[(2'h3):(1'h0)]);
  module156 #() modinst190 (wire189, clk, wire141, wire144, reg147, reg145, reg150);
  assign wire191 = {($signed((wire141 ? (reg149 ? reg149 : wire142) : reg146)) ?
                           (~^((|reg151) ?
                               reg152[(4'hc):(3'h6)] : (wire189 <<< reg151))) : $signed(((wire141 == reg151) ^~ (8'h9d))))};
  assign wire192 = ((~^wire144[(3'h5):(2'h3)]) ?
                       (8'hbd) : (+wire191[(2'h2):(2'h2)]));
  assign wire193 = $unsigned(($unsigned(((^~reg151) ^~ (wire142 <= reg147))) ?
                       $unsigned({(wire144 ?
                               wire191 : wire189)}) : ($signed(reg151) & reg150)));
  assign wire194 = {((~(wire153 <<< ((8'hb8) || (8'hab)))) ?
                           (($unsigned(reg149) ? wire142 : (|reg146)) ?
                               {(reg151 >>> wire144),
                                   (&wire154)} : $signed($unsigned(wire189))) : $unsigned($signed((reg151 ?
                               reg146 : reg148)))),
                       (!wire153)};
  assign wire195 = (^~$signed($unsigned(($unsigned(wire155) ?
                       reg149 : $signed(wire143)))));
  assign wire196 = $unsigned((8'ha5));
  always
    @(posedge clk) begin
      reg197 <= ((8'ha7) ^ $unsigned((^(|reg152))));
    end
  assign wire198 = wire143[(3'h5):(3'h4)];
  assign wire199 = {reg152};
  assign wire200 = (^~reg149);
endmodule

module module5
#(parameter param118 = {{(({(8'had)} ? {(8'ha3)} : (8'h9f)) ? (+(~(8'hb0))) : (7'h40)), (!(~|{(8'hb6), (8'hab)}))}}, 
parameter param119 = param118)
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire21;
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  assign y = {wire116,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire72,
                 wire21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((((wire9 >>> wire7[(3'h7):(2'h2)]) ?
          ((wire8 ? wire9 : (7'h41)) ?
              (wire7 << (8'ha8)) : wire10[(1'h0):(1'h0)]) : ($unsigned(wire9) - $signed(wire9))) - $signed(((wire7 ?
          wire7 : wire6) | (8'hbb))))))
        begin
          reg11 <= (|(wire6[(3'h4):(2'h3)] >>> ($signed((wire9 ?
                  wire6 : wire9)) ?
              $unsigned(wire7[(1'h0):(1'h0)]) : $signed((wire10 ?
                  wire9 : (7'h42))))));
          reg12 <= (((~&(8'had)) << $signed(((&wire10) >= {reg11, wire10}))) ?
              ($unsigned((wire6[(1'h0):(1'h0)] ^ reg11[(4'h9):(3'h4)])) <= ((wire8[(3'h4):(3'h4)] << (~&(8'hb3))) * {(~&wire6)})) : (8'hbe));
          reg13 <= (+$signed(wire6[(4'h8):(3'h4)]));
        end
      else
        begin
          reg11 <= (8'hb6);
          reg12 <= (wire10 ?
              wire8 : $unsigned($signed((wire10[(3'h7):(3'h6)] ^~ $signed(wire9)))));
        end
      if ((wire9[(5'h12):(4'hb)] ?
          (-(~&$signed((+(8'hb9))))) : $signed((~&reg11))))
        begin
          reg14 <= ((8'haf) <= (((^(wire9 ?
              (8'ha7) : reg12)) < reg12[(1'h0):(1'h0)]) >>> ({(&reg11)} ?
              $unsigned(reg12[(3'h5):(1'h0)]) : {$unsigned((8'hba))})));
          reg15 <= wire7;
          reg16 <= (^(((wire7[(1'h1):(1'h1)] ?
              (^reg13) : (wire7 <= wire6)) > (wire6 | (wire9 ~^ reg15))) * (~&reg15[(4'h9):(4'h9)])));
        end
      else
        begin
          if ($unsigned((+($signed((wire6 ? wire10 : reg12)) ?
              wire10[(4'hc):(4'ha)] : reg15))))
            begin
              reg14 <= (^{(reg15[(3'h5):(3'h5)] ?
                      {wire7[(2'h2):(1'h0)],
                          ((8'hba) ?
                              wire8 : reg12)} : $unsigned((wire7 != wire7))),
                  ($unsigned((reg14 ? reg13 : wire7)) ?
                      $signed((~reg12)) : (8'haf))});
              reg15 <= wire9;
            end
          else
            begin
              reg14 <= ((+reg13) * (^$signed({$unsigned(wire9), (|wire7)})));
              reg15 <= (~(($signed(wire7[(1'h0):(1'h0)]) <<< reg16[(4'he):(2'h3)]) | reg16));
              reg16 <= $signed((reg11[(1'h0):(1'h0)] & $unsigned({(8'hbe),
                  wire6[(1'h0):(1'h0)]})));
              reg17 <= reg14[(4'hd):(2'h2)];
              reg18 <= $signed(((($unsigned((8'hb8)) ? reg14 : $signed(reg11)) ?
                      $signed(wire6[(2'h2):(2'h2)]) : wire7) ?
                  $unsigned({wire8[(4'hc):(4'hb)],
                      ((8'hbc) ? reg15 : reg14)}) : wire7[(3'h5):(1'h1)]));
            end
        end
      reg19 <= wire10;
      reg20 <= reg16[(4'hd):(4'hd)];
    end
  assign wire21 = reg16[(4'hc):(3'h4)];
  module22 #() modinst73 (.y(wire72), .wire26(reg13), .wire23(wire9), .clk(clk), .wire27(wire8), .wire24(reg16), .wire25(reg18));
  always
    @(posedge clk) begin
      if (reg18)
        begin
          reg74 <= (~^reg20[(4'hb):(1'h0)]);
        end
      else
        begin
          reg74 <= (8'ha8);
          reg75 <= ((8'hb2) <<< (8'h9e));
          reg76 <= (~^$signed({(^~(wire9 <<< wire8))}));
        end
      reg77 <= $unsigned((&(reg74[(3'h4):(1'h0)] ?
          reg12[(3'h7):(3'h7)] : $signed((wire7 ? wire7 : reg76)))));
      reg78 <= (^{($signed(wire7) | reg14), wire7});
      reg79 <= wire7[(1'h0):(1'h0)];
      reg80 <= reg76[(1'h0):(1'h0)];
    end
  assign wire81 = (reg17 | ($unsigned($unsigned($signed(wire21))) < {$unsigned($unsigned(reg17)),
                      $signed((8'ha6))}));
  assign wire82 = ((!({(^reg20), reg77[(4'hc):(2'h2)]} ?
                          (!(wire6 ? reg76 : (8'hac))) : reg20)) ?
                      {wire81} : reg77[(5'h13):(5'h11)]);
  assign wire83 = (reg18[(1'h0):(1'h0)] ?
                      $unsigned($unsigned($signed((!wire7)))) : {(((reg80 ?
                                  reg18 : wire6) ?
                              $signed(wire6) : ((7'h42) ?
                                  wire82 : wire10)) <<< (reg14 ?
                              $signed(reg77) : $signed(reg14)))});
  assign wire84 = (-reg18[(1'h0):(1'h0)]);
  assign wire85 = wire8;
  module86 #() modinst117 (.wire87(reg17), .wire89(wire6), .wire91(reg20), .clk(clk), .y(wire116), .wire90(wire84), .wire88(reg12));
endmodule

module module86
#(parameter param115 = (!(+(((~|(8'ha5)) ? ((8'hac) == (8'hae)) : ((8'hb3) + (8'hb7))) - {((7'h44) ? (8'hbd) : (8'hb8)), ((8'ha7) >> (7'h44))}))))
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire91;
  input wire signed [(5'h13):(1'h0)] wire90;
  input wire [(5'h12):(1'h0)] wire89;
  input wire [(4'he):(1'h0)] wire88;
  input wire signed [(5'h14):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire112;
  wire signed [(4'hd):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire108,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg110,
                 reg109,
                 reg107,
                 reg106,
                 reg105,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed(wire88))))
        begin
          reg92 <= (($unsigned((~(~|wire91))) ?
                  $signed((8'hbb)) : wire90[(4'h9):(2'h2)]) ?
              (wire87[(1'h0):(1'h0)] ^~ wire87) : $signed($unsigned($signed((~|wire90)))));
          reg93 <= (~wire91[(2'h2):(2'h2)]);
          reg94 <= (~&$signed(wire87));
          reg95 <= $signed($unsigned(($unsigned((wire91 + wire87)) ?
              $unsigned({wire90, wire87}) : $signed($unsigned(reg92)))));
          reg96 <= (~^$signed($signed({(reg94 >> (8'hbf)), {reg93}})));
        end
      else
        begin
          reg92 <= {{reg94[(2'h2):(1'h1)]},
              $unsigned(($signed((~wire88)) ?
                  $signed($signed(wire87)) : (7'h41)))};
          reg93 <= reg95;
        end
    end
  assign wire97 = ($signed((reg92 & reg92)) ? {wire90} : reg95);
  assign wire98 = wire88;
  assign wire99 = wire98;
  assign wire100 = {$signed($signed($unsigned(wire88[(3'h5):(1'h0)]))),
                       (-$signed(((wire90 * reg95) & (8'h9f))))};
  assign wire101 = ($unsigned($signed($unsigned((reg96 ^~ wire97)))) ?
                       (8'hb3) : $unsigned($unsigned(($unsigned(wire91) - {wire89,
                           wire98}))));
  assign wire102 = $signed((&($unsigned((reg94 ?
                       wire90 : wire89)) | (+$signed(wire100)))));
  assign wire103 = reg93;
  assign wire104 = reg92;
  always
    @(posedge clk) begin
      reg105 <= reg93;
      reg106 <= (~^(&($signed($unsigned(reg105)) ?
          ($signed(wire98) ?
              (^wire99) : wire103[(3'h4):(3'h4)]) : (reg92[(3'h4):(1'h0)] ?
              reg92 : (reg92 ? wire100 : wire88)))));
      reg107 <= reg93;
    end
  assign wire108 = (~&($signed(((wire101 ? wire101 : reg106) ?
                       {wire104,
                           (8'hab)} : $unsigned(wire97))) >> $unsigned(($unsigned(wire88) * wire101[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      reg109 <= reg96;
      reg110 <= {(+$signed(wire101[(3'h6):(1'h1)])), reg92};
    end
  assign wire111 = (wire91 ^ (($unsigned(reg109[(3'h5):(1'h0)]) ?
                       ($signed(wire103) > (reg109 ?
                           reg105 : wire104)) : (~|(wire98 ?
                           wire99 : reg94))) ^ reg110[(1'h0):(1'h0)]));
  assign wire112 = (wire104 != $signed((((reg93 ?
                       wire87 : reg95) - $signed(wire100)) >>> (~^wire104))));
  assign wire113 = $unsigned((+($signed($unsigned((7'h41))) ?
                       (!wire104) : reg105[(4'hd):(3'h5)])));
  assign wire114 = wire111;
endmodule

module module22
#(parameter param70 = {(^(&(((8'hb2) ? (8'ha9) : (8'hb2)) >> ((7'h44) ? (7'h41) : (8'hbf))))), (((((8'ha6) >> (7'h43)) ^~ {(8'hb2), (8'ha9)}) || (~(-(8'hbf)))) ^ ((^(^~(7'h40))) ? {((8'hba) ~^ (8'ha2)), {(8'h9d), (8'hb9)}} : (((8'hb0) ? (8'h9c) : (8'hb0)) ? (~&(8'hbc)) : ((8'ha6) ~^ (8'ha0)))))}, 
parameter param71 = (({((param70 ? param70 : (8'h9f)) ? {param70, (8'hac)} : (^~param70))} ? {{{param70, param70}, (param70 == param70)}, ((param70 ? param70 : param70) ? (param70 ? param70 : param70) : (param70 ? param70 : (8'h9f)))} : (((|(7'h41)) + (^param70)) ? param70 : param70)) ? (7'h41) : (param70 ^ (^((param70 ? param70 : param70) ? {param70} : param70)))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire [(2'h2):(1'h0)] wire26;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire signed [(3'h6):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire62,
                 wire60,
                 wire59,
                 wire58,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg61,
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
  always
    @(posedge clk) begin
      if ($signed($unsigned((((|wire27) != (wire24 | wire25)) < (wire27 ?
          wire25[(3'h4):(2'h3)] : wire27)))))
        begin
          reg28 <= $signed($unsigned(wire23));
          reg29 <= wire23[(3'h5):(1'h0)];
          reg30 <= (~^wire26);
          reg31 <= (+{wire25[(1'h0):(1'h0)]});
        end
      else
        begin
          if (reg29)
            begin
              reg28 <= ((wire23 ?
                  {$unsigned($signed(reg29)),
                      ((wire27 ?
                          reg31 : (8'hba)) ^ $unsigned(wire24))} : $signed((reg29[(4'h8):(3'h5)] <= reg28[(3'h7):(1'h1)]))) <<< $unsigned({(8'h9c),
                  $unsigned((reg28 ? (8'ha8) : reg31))}));
              reg29 <= (8'hab);
              reg30 <= reg29[(4'hc):(3'h5)];
              reg31 <= {$signed((&reg28[(3'h5):(3'h5)]))};
            end
          else
            begin
              reg28 <= $unsigned(wire26);
            end
          if ($unsigned({reg30[(2'h2):(2'h2)]}))
            begin
              reg32 <= {(((~^(wire24 ? wire24 : (8'hae))) ?
                      wire27[(1'h0):(1'h0)] : wire25) < wire26),
                  $unsigned((~|(^{wire23})))};
            end
          else
            begin
              reg32 <= $signed((($unsigned((^~wire23)) ?
                      $signed((wire23 ?
                          reg29 : reg28)) : (~&$unsigned(wire23))) ?
                  ((^$signed(reg30)) & (8'hb1)) : ($signed(wire25) + $unsigned(reg31[(2'h3):(1'h0)]))));
              reg33 <= (((~|{wire23}) << wire23[(2'h3):(1'h1)]) ?
                  {(reg29 || $signed(wire23[(3'h4):(1'h0)]))} : (-reg29));
              reg34 <= ($unsigned(($signed(reg32[(1'h0):(1'h0)]) ?
                      {$signed(wire26),
                          reg29[(3'h7):(3'h5)]} : $unsigned($signed(wire24)))) ?
                  reg30 : reg32[(1'h1):(1'h0)]);
            end
          reg35 <= ($unsigned(wire23) ? wire24 : (~^reg33[(1'h0):(1'h0)]));
        end
      reg36 <= $signed(reg31);
    end
  assign wire37 = reg36[(4'hd):(4'hc)];
  assign wire38 = ($signed(((^~(&reg29)) ^~ wire27[(5'h13):(4'h8)])) ?
                      $unsigned(reg32) : $unsigned(reg34[(4'h9):(1'h1)]));
  assign wire39 = ((~^(wire38 >> ((reg30 ? wire23 : wire38) ?
                          (wire24 > wire23) : $unsigned(reg28)))) ?
                      $unsigned({$unsigned((reg36 - wire37))}) : {$unsigned($signed(wire26))});
  assign wire40 = {(reg32[(3'h6):(3'h5)] ?
                          {$signed((wire26 ?
                                  wire37 : reg36))} : ((-reg30[(2'h3):(2'h2)]) ?
                              ($signed(reg32) ?
                                  (!wire24) : {wire24,
                                      wire26}) : wire23[(3'h6):(3'h5)])),
                      ((($signed(wire24) < $unsigned(wire24)) & (~^$unsigned(wire26))) ?
                          (((reg34 >>> reg30) == $unsigned(wire26)) == $signed(reg36[(1'h1):(1'h0)])) : $unsigned(wire26))};
  assign wire41 = reg36[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg42 <= $signed(((~wire23[(2'h3):(2'h3)]) & (^~$signed((^(8'h9c))))));
      if (wire24)
        begin
          reg43 <= wire40;
          reg44 <= $signed($unsigned(reg35));
        end
      else
        begin
          if (($signed($signed((reg29[(3'h5):(3'h5)] ?
              reg28[(4'h8):(2'h3)] : $signed(wire25)))) >> $signed((reg29[(2'h3):(1'h0)] ?
              ({wire41, wire37} ?
                  {wire40} : (reg42 << (8'h9e))) : $unsigned((wire38 & reg36))))))
            begin
              reg43 <= $unsigned(((reg35[(1'h1):(1'h1)] << $signed((reg33 ?
                  reg44 : wire39))) << wire27));
              reg44 <= $unsigned(wire25[(2'h2):(1'h0)]);
              reg45 <= ($unsigned($signed(reg28[(3'h4):(1'h1)])) ^ (^~$signed($unsigned(((8'hbf) ~^ reg34)))));
              reg46 <= (((~$signed((|reg32))) >>> {((~&reg30) | $signed(reg36)),
                  $unsigned(wire40[(5'h14):(4'h9)])}) ~^ $signed(wire24));
            end
          else
            begin
              reg43 <= reg46[(1'h0):(1'h0)];
              reg44 <= $unsigned((^{($signed(reg45) ^~ reg35)}));
              reg45 <= (-(8'hb4));
              reg46 <= ({(((reg36 ? wire40 : reg30) ? {wire23} : (^wire38)) ?
                      (wire39[(4'hd):(2'h3)] ?
                          reg44[(5'h12):(2'h2)] : (!wire40)) : (~|(wire24 ?
                          wire38 : reg46)))} & reg43);
            end
          if (wire27)
            begin
              reg47 <= wire27;
              reg48 <= $unsigned(wire27[(2'h2):(1'h1)]);
              reg49 <= $unsigned((wire39[(3'h7):(3'h4)] ?
                  $unsigned(($unsigned(wire25) ?
                      wire39[(1'h0):(1'h0)] : (reg29 & (8'ha7)))) : (8'hb9)));
            end
          else
            begin
              reg47 <= reg32[(2'h3):(1'h0)];
            end
          reg50 <= $unsigned(($signed($unsigned((reg42 ?
              wire37 : wire25))) <= (reg45 ? (7'h43) : (^{wire40}))));
          reg51 <= ($signed(reg30) ?
              (^~$signed(($signed(wire24) || (reg34 >>> reg31)))) : reg34);
          if ((reg29 + $signed(((wire25 & $signed(reg44)) ?
              $signed((~&reg42)) : $signed((reg50 << reg43))))))
            begin
              reg52 <= ($unsigned((((wire37 << reg51) ?
                  reg50[(5'h11):(5'h11)] : ((8'hb6) ?
                      (8'hac) : reg49)) <<< wire40)) > $signed((-((wire38 ^~ reg32) ?
                  {reg49, reg47} : (&reg50)))));
              reg53 <= reg34[(3'h5):(2'h3)];
              reg54 <= wire38;
            end
          else
            begin
              reg52 <= reg33;
              reg53 <= (7'h41);
            end
        end
      reg55 <= $unsigned(reg43[(3'h5):(1'h0)]);
      reg56 <= $signed(reg43);
      reg57 <= $unsigned((($unsigned(((8'ha5) >= (7'h44))) - reg44) ?
          wire26 : ((^(~&(8'hb8))) <<< reg43)));
    end
  assign wire58 = $unsigned({reg53[(4'hd):(3'h7)]});
  assign wire59 = ($signed((^($signed((8'ha8)) >= (|reg49)))) ?
                      (((~^$unsigned((8'hb1))) ?
                          wire24[(1'h1):(1'h0)] : $signed($signed((7'h40)))) <= wire38[(4'he):(2'h2)]) : reg30[(2'h3):(2'h3)]);
  assign wire60 = $unsigned(($signed((~^((8'ha4) ? reg57 : (8'ha9)))) ?
                      ($signed((wire40 <<< reg29)) > reg35) : $unsigned(wire26[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg61 <= $unsigned(wire26);
    end
  assign wire62 = (($unsigned((~^reg54[(4'ha):(2'h3)])) | $signed((reg56 << (reg32 < reg30)))) ?
                      reg35 : reg46);
  always
    @(posedge clk) begin
      reg63 <= (&$signed(reg29));
      reg64 <= ((((reg49[(1'h1):(1'h0)] ?
                  (wire62 >= reg30) : $signed(reg30)) & reg57) ?
              ($unsigned({reg63, reg30}) ?
                  (+(wire60 <<< reg33)) : ($signed(reg42) <= wire60[(3'h5):(3'h5)])) : (((reg52 ?
                      (8'ha5) : reg32) ?
                  (reg56 == wire38) : (wire58 ? wire24 : wire25)) & (reg52 ?
                  wire26[(1'h0):(1'h0)] : $unsigned(reg43)))) ?
          reg31[(3'h5):(1'h1)] : (~&((~^(wire25 ? wire26 : wire25)) ?
              reg55[(4'hf):(2'h3)] : ((wire24 + reg47) <= (^~reg44)))));
      reg65 <= $unsigned($signed((8'h9e)));
      reg66 <= $signed($unsigned(((-(reg49 ? reg45 : (8'ha8))) + ((wire41 ?
          reg63 : reg33) > (|wire38)))));
    end
  assign wire67 = $unsigned(reg50[(5'h14):(3'h6)]);
  assign wire68 = $signed(((^~(~{reg57,
                      reg30})) >= $signed((reg43[(4'he):(3'h5)] && $signed(reg57)))));
  assign wire69 = ((+wire24) >= $unsigned($signed(((reg54 != wire23) ?
                      (|wire38) : (wire67 ? reg48 : reg29)))));
endmodule

module module156  (y, clk, wire161, wire160, wire159, wire158, wire157);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire161;
  input wire [(3'h4):(1'h0)] wire160;
  input wire [(4'ha):(1'h0)] wire159;
  input wire signed [(5'h10):(1'h0)] wire158;
  input wire signed [(5'h12):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire188;
  wire [(2'h3):(1'h0)] wire187;
  wire signed [(2'h3):(1'h0)] wire186;
  wire [(4'hd):(1'h0)] wire185;
  wire [(5'h10):(1'h0)] wire184;
  wire signed [(3'h6):(1'h0)] wire183;
  wire signed [(3'h7):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire180;
  wire [(4'he):(1'h0)] wire179;
  wire signed [(4'ha):(1'h0)] wire178;
  wire [(3'h6):(1'h0)] wire164;
  wire [(3'h5):(1'h0)] wire163;
  wire [(4'hf):(1'h0)] wire162;
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(3'h4):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg173 = (1'h0);
  reg [(4'ha):(1'h0)] reg172 = (1'h0);
  reg [(4'hb):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg170 = (1'h0);
  reg [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg [(4'hc):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire164,
                 wire163,
                 wire162,
                 reg182,
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
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire162 = (((({wire157,
                               (7'h40)} && $signed(wire161)) <<< wire157[(1'h0):(1'h0)]) ?
                           ((~|(wire160 ?
                               wire159 : wire159)) || ($signed(wire159) ?
                               (wire157 ? (8'ha2) : wire160) : {wire157,
                                   wire159})) : (+(8'hb3))) ?
                       wire161[(2'h2):(1'h1)] : (8'hbe));
  assign wire163 = $unsigned($unsigned((~&(8'ha3))));
  assign wire164 = ((~^$signed((+(^~wire159)))) ~^ $unsigned((wire162 == ($signed(wire157) != wire159[(3'h5):(3'h5)]))));
  always
    @(posedge clk) begin
      reg165 <= (8'hbb);
      reg166 <= (7'h40);
      reg167 <= $unsigned((&$unsigned(wire159[(2'h2):(1'h1)])));
      if ({{(^~{wire162[(3'h4):(2'h2)], (8'hb8)}),
              {((~^wire159) != wire161), $unsigned(reg165[(1'h0):(1'h0)])}},
          (wire159[(3'h7):(2'h3)] <= $unsigned(({reg166} ?
              reg165 : ((7'h40) ? reg167 : (8'ha9)))))})
        begin
          reg168 <= wire159[(3'h5):(2'h3)];
          if ($signed($signed(($signed($unsigned(reg167)) | (wire160[(2'h3):(1'h0)] <<< (wire163 ?
              wire160 : wire162))))))
            begin
              reg169 <= wire157[(4'hc):(4'hb)];
              reg170 <= $unsigned($unsigned((reg167 ?
                  $unsigned((reg166 ?
                      wire160 : (7'h42))) : $signed($signed(wire158)))));
            end
          else
            begin
              reg169 <= $unsigned(wire162);
              reg170 <= (|{($unsigned((^wire159)) ?
                      (^((8'hb4) == wire160)) : wire158),
                  wire164});
              reg171 <= reg168;
              reg172 <= ($unsigned($unsigned({wire158[(4'h8):(4'h8)]})) <= wire164);
              reg173 <= (wire160 <<< (~&(wire158 ?
                  (~(^~reg172)) : $unsigned((wire159 != (8'ha8))))));
            end
          reg174 <= ((~|(~&$signed((^~reg165)))) ?
              $signed(($signed($unsigned(wire163)) * $signed($unsigned(reg171)))) : $signed(reg170[(3'h6):(1'h0)]));
          reg175 <= reg169[(4'ha):(3'h5)];
          reg176 <= wire160[(2'h2):(2'h2)];
        end
      else
        begin
          if ((|reg171[(4'ha):(1'h1)]))
            begin
              reg168 <= reg173;
              reg169 <= $unsigned(reg165);
              reg170 <= ($unsigned($signed((-(reg169 ?
                  (8'hb4) : wire157)))) >> $unsigned((8'hbe)));
              reg171 <= (reg169 ?
                  (wire159[(3'h5):(2'h3)] || reg172) : $unsigned(((~|reg175) ?
                      $signed($unsigned(reg171)) : (+$signed(reg174)))));
              reg172 <= reg174[(4'h9):(2'h3)];
            end
          else
            begin
              reg168 <= reg165[(2'h3):(2'h3)];
              reg169 <= reg175[(3'h4):(2'h2)];
              reg170 <= wire161;
              reg171 <= {(~&wire161),
                  (!(reg175 ?
                      ($unsigned((8'hba)) & {(8'ha7),
                          wire161}) : $unsigned((+reg170))))};
              reg172 <= (~|(~^reg166[(4'hb):(4'h9)]));
            end
          if (($unsigned(reg175) ?
              $signed($signed({(wire162 ?
                      reg168 : reg171)})) : (-reg175[(3'h4):(1'h0)])))
            begin
              reg173 <= wire161;
            end
          else
            begin
              reg173 <= $unsigned(((~&wire162) ?
                  wire160[(2'h3):(2'h2)] : (+reg175[(2'h3):(2'h2)])));
              reg174 <= (~|{$unsigned(wire163), (~^reg170)});
              reg175 <= (~|(~^{{{reg166, reg167}, (wire157 >= reg166)}}));
              reg176 <= $unsigned(reg169[(2'h3):(1'h1)]);
              reg177 <= wire158[(2'h2):(1'h0)];
            end
        end
    end
  assign wire178 = ($unsigned((^$unsigned((wire161 ? wire163 : reg172)))) ?
                       $unsigned($unsigned((&((8'hb3) ?
                           reg177 : (8'ha4))))) : (((reg173 ?
                           (wire160 ?
                               wire164 : reg176) : $signed(reg176)) - ({wire159,
                           wire163} != (reg177 && reg172))) ^~ reg175[(2'h2):(1'h1)]));
  assign wire179 = reg165[(4'h9):(4'h9)];
  assign wire180 = (8'hb0);
  assign wire181 = (((~|($unsigned(wire160) ?
                               $signed(reg165) : ((8'hb4) ?
                                   wire164 : (8'hba)))) ?
                           ((reg166 >> wire158) * $unsigned((reg168 ?
                               (8'hb6) : reg169))) : (~|$unsigned(reg172))) ?
                       ((((~(8'hb1)) >>> (8'h9d)) < $signed($unsigned(wire162))) >> (~($unsigned(reg176) ?
                           ((8'ha4) || reg166) : ((7'h44) ?
                               wire160 : wire162)))) : (+(-(|$signed(wire159)))));
  always
    @(posedge clk) begin
      reg182 <= $signed({$unsigned($unsigned({wire178})),
          reg176[(4'hd):(3'h5)]});
    end
  assign wire183 = wire158[(4'hc):(4'hc)];
  assign wire184 = ((&(((reg182 << reg168) ?
                               (wire164 ? reg167 : reg174) : $signed(reg168)) ?
                           $unsigned(reg173[(5'h12):(4'hb)]) : (~^(^~reg169)))) ?
                       $signed((&$signed((wire159 & reg170)))) : $signed((7'h40)));
  assign wire185 = $signed(($signed(wire160[(1'h1):(1'h1)]) ?
                       ({(+wire158)} ?
                           $signed(wire157[(3'h6):(3'h6)]) : $signed($unsigned(wire157))) : reg166));
  assign wire186 = wire160;
  assign wire187 = (wire183[(3'h5):(1'h1)] ^ (^~$signed(($signed(reg172) & (~wire186)))));
  assign wire188 = $unsigned(wire181[(3'h4):(1'h0)]);
endmodule
