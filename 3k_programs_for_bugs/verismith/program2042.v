module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire205;
  wire [(3'h7):(1'h0)] wire204;
  wire [(2'h3):(1'h0)] wire203;
  wire [(5'h11):(1'h0)] wire202;
  wire [(5'h13):(1'h0)] wire201;
  wire [(4'hb):(1'h0)] wire199;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire125;
  reg [(5'h14):(1'h0)] reg4 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire199,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire125,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned((!((^~wire3) << $unsigned(wire0)))));
      reg5 <= wire1;
      if (({$unsigned($unsigned($signed(wire0)))} >> wire1))
        begin
          reg6 <= {reg5};
          if (wire1[(4'h9):(2'h3)])
            begin
              reg7 <= (wire3 * reg5);
            end
          else
            begin
              reg7 <= reg4;
              reg8 <= $unsigned($unsigned(reg6));
            end
        end
      else
        begin
          reg6 <= ({wire1, reg8[(4'hf):(4'h8)]} <<< reg6[(3'h4):(1'h0)]);
        end
    end
  assign wire9 = $signed({$signed($signed({reg6, wire3})),
                     (($unsigned(reg7) ?
                             $signed(reg8) : (wire2 ? reg7 : reg4)) ?
                         $unsigned((reg8 + reg6)) : $signed(reg8[(4'ha):(2'h3)]))});
  assign wire10 = ($signed({reg8, (!$unsigned(reg5))}) > wire3[(4'hd):(4'hb)]);
  assign wire11 = {(8'ha7)};
  assign wire12 = (&wire3);
  always
    @(posedge clk) begin
      reg13 <= ((8'hb6) ?
          ($unsigned((reg5 >>> wire1[(3'h5):(3'h5)])) ?
              (~|$unsigned((&wire9))) : (~&reg5)) : $unsigned(reg5));
    end
  module14 #() modinst126 (wire125, clk, reg7, wire1, wire11, reg6, wire3);
  module127 #() modinst200 (.wire130(reg6), .wire131(wire12), .wire132(wire11), .clk(clk), .y(wire199), .wire128(reg4), .wire129(reg13));
  assign wire201 = $unsigned(($unsigned({$unsigned(wire12)}) ?
                       $signed((wire10 & (wire3 - reg5))) : $unsigned(((wire1 ?
                           (8'ha1) : reg6) >>> (-reg7)))));
  assign wire202 = (wire2 ? $signed($signed($signed($signed(reg13)))) : wire9);
  assign wire203 = {$unsigned($signed(reg8))};
  assign wire204 = $signed($unsigned((!(+wire11))));
  assign wire205 = wire201[(5'h10):(2'h2)];
endmodule

module module127
#(parameter param197 = ({(8'hb2), ((((8'hbf) ? (8'hbe) : (7'h43)) ? ((8'h9c) <<< (8'hb2)) : ((7'h42) ? (8'haf) : (8'hb1))) ? {{(8'hac)}, {(8'ha5), (8'ha9)}} : (&((8'h9f) || (8'h9e))))} && (((8'hb8) > {((8'hac) || (8'hab))}) ? {(^((8'ha0) ^ (8'ha8))), ({(8'ha0), (8'ha8)} ? ((8'hae) | (8'hb3)) : {(7'h40)})} : ((8'ha0) ? (8'hbf) : (((8'hbf) ? (8'hae) : (8'ha3)) >>> ((8'hbd) ? (8'ha4) : (8'ha6)))))), 
parameter param198 = {(param197 > (^(|param197))), (^~param197)})
(y, clk, wire128, wire129, wire130, wire131, wire132);
  output wire [(32'h210):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire128;
  input wire [(4'h8):(1'h0)] wire129;
  input wire signed [(4'h8):(1'h0)] wire130;
  input wire [(5'h12):(1'h0)] wire131;
  input wire [(4'h9):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire184;
  wire [(4'h9):(1'h0)] wire179;
  wire [(5'h10):(1'h0)] wire178;
  wire signed [(5'h12):(1'h0)] wire177;
  wire signed [(4'h8):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire151;
  wire [(3'h6):(1'h0)] wire156;
  wire signed [(3'h4):(1'h0)] wire175;
  reg [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(4'he):(1'h0)] reg195 = (1'h0);
  reg signed [(4'he):(1'h0)] reg194 = (1'h0);
  reg [(4'hb):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg188 = (1'h0);
  reg [(4'hc):(1'h0)] reg187 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg183 = (1'h0);
  reg [(4'he):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(3'h6):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  assign y = {wire184,
                 wire179,
                 wire178,
                 wire177,
                 wire133,
                 wire134,
                 wire150,
                 wire151,
                 wire156,
                 wire175,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire133 = ($signed((~$unsigned((8'haf)))) + $unsigned(wire132));
  assign wire134 = (($signed((^~wire129)) ?
                           (wire128 ?
                               (|(!wire132)) : (~&(wire132 ?
                                   (7'h40) : wire133))) : (((wire131 && (8'hab)) ?
                               (+wire130) : wire133[(3'h5):(2'h3)]) ~^ $unsigned((wire131 << wire130)))) ?
                       wire133 : {(~$unsigned((wire131 ~^ wire128)))});
  always
    @(posedge clk) begin
      if ($unsigned(wire132[(4'h8):(4'h8)]))
        begin
          if ($signed(wire133))
            begin
              reg135 <= wire129[(3'h4):(1'h1)];
              reg136 <= (wire129[(3'h6):(2'h3)] * wire134);
              reg137 <= (!{$signed(($unsigned((8'ha0)) ^~ (reg136 <<< wire132)))});
            end
          else
            begin
              reg135 <= reg135[(4'h8):(1'h1)];
              reg136 <= {$signed(((reg135 ?
                          {wire131, (8'ha3)} : wire133[(3'h7):(3'h5)]) ?
                      $unsigned(wire131) : ((reg137 ?
                          wire131 : reg136) == (wire129 <<< wire132))))};
              reg137 <= (($signed(((~wire131) ? $signed(wire129) : reg137)) ?
                      ((|(~|reg136)) ?
                          $unsigned($signed(wire128)) : $unsigned((reg137 ?
                              wire134 : (8'hb6)))) : (wire128[(5'h10):(1'h1)] ?
                          (((8'ha0) ^ wire129) ?
                              (^~reg135) : reg136) : (~|wire132[(3'h7):(3'h7)]))) ?
                  {{$signed($unsigned(wire129)), $unsigned(reg135)},
                      $signed($unsigned({wire128, wire129}))} : wire130);
            end
          reg138 <= (!wire129);
          reg139 <= ((!((reg137 && (-wire131)) >>> reg138)) ?
              $signed((^(reg137[(3'h6):(2'h3)] ?
                  (&wire133) : wire134))) : {wire130,
                  $unsigned(((^wire129) ? $signed(reg138) : wire132))});
        end
      else
        begin
          reg135 <= (~^$signed($signed(($unsigned(reg137) <<< (~|wire134)))));
          if ((!reg137[(2'h2):(2'h2)]))
            begin
              reg136 <= ($unsigned((^~$signed($signed((8'ha7))))) <<< ((~&(7'h42)) > $unsigned(((^wire128) ?
                  $signed(reg135) : $unsigned(reg137)))));
              reg137 <= (^~$signed(wire130[(4'h8):(4'h8)]));
              reg138 <= wire128;
              reg139 <= reg135;
              reg140 <= $signed({(({wire128} ?
                      (wire132 ^ wire130) : reg137[(4'h9):(3'h6)]) ^~ (~|((8'ha2) ?
                      wire133 : wire134))),
                  (8'hba)});
            end
          else
            begin
              reg136 <= ((^~reg140[(4'hd):(4'ha)]) <<< $signed(reg140));
              reg137 <= (wire130[(2'h3):(2'h2)] ~^ (((wire129[(2'h2):(1'h1)] ?
                      (^reg135) : (wire129 ? wire130 : reg140)) ?
                  $signed(wire130[(3'h7):(2'h3)]) : {(~|reg140),
                      $signed((8'hb6))}) > $signed(wire132[(4'h8):(1'h0)])));
              reg138 <= ((({wire129[(3'h5):(3'h5)]} ?
                          wire134[(4'hd):(4'hc)] : $unsigned(wire132[(3'h5):(1'h0)])) ?
                      wire133[(2'h3):(1'h1)] : (($signed((8'hb5)) <= (reg138 | reg137)) & (!wire134))) ?
                  ((&($signed(reg135) ^ reg135[(3'h5):(2'h2)])) - {($unsigned(wire134) ?
                          wire133 : (~|reg136))}) : ((((reg135 ?
                              wire129 : reg135) > $unsigned((7'h43))) ?
                          $unsigned((wire132 ?
                              (8'ha3) : (8'hae))) : reg137[(3'h7):(2'h3)]) ?
                      ((|(wire134 ? (8'hb7) : reg137)) ?
                          $signed((&reg140)) : (~|reg137)) : $signed($signed((-reg139)))));
              reg139 <= (({((reg137 && reg136) ?
                      (~wire129) : $signed(reg137))} >> wire129[(1'h0):(1'h0)]) <= $unsigned(reg140[(4'h9):(2'h3)]));
              reg140 <= $signed((!($unsigned($signed(reg140)) ?
                  (|(+reg139)) : (~^(reg135 || reg137)))));
            end
          reg141 <= (-wire134);
          if ((~|($signed(((8'hb5) ^ $signed((7'h42)))) ?
              (|{$unsigned(reg135)}) : $signed($unsigned(reg138[(2'h2):(2'h2)])))))
            begin
              reg142 <= $signed(wire128[(4'he):(4'ha)]);
              reg143 <= reg137[(4'h9):(2'h3)];
              reg144 <= $signed($signed((+wire134[(3'h7):(3'h7)])));
              reg145 <= $unsigned((-{(~|reg135)}));
            end
          else
            begin
              reg142 <= {wire134};
              reg143 <= {$signed(((reg137[(1'h1):(1'h0)] ? reg139 : {wire128}) ?
                      ($signed(wire128) ?
                          wire131 : $unsigned(reg145)) : (!(reg136 ?
                          reg140 : reg138))))};
              reg144 <= $signed(((~^(wire134[(3'h6):(2'h2)] - $unsigned(wire128))) ?
                  (~(7'h42)) : (~^reg141[(2'h3):(2'h3)])));
            end
        end
      reg146 <= (wire129[(1'h0):(1'h0)] < $unsigned(reg144));
      reg147 <= reg142[(2'h3):(2'h2)];
      reg148 <= ((reg141[(2'h2):(2'h2)] ?
          {($unsigned(reg142) >> wire133[(1'h0):(1'h0)])} : reg143[(3'h4):(2'h2)]) || ((wire132[(4'h9):(3'h4)] > $unsigned({wire131})) + (+reg147[(4'hc):(3'h6)])));
      reg149 <= {({($signed((8'hb9)) ?
                  $unsigned(reg148) : {(8'h9d)})} < (reg143 ?
              reg144 : ((reg145 ? reg137 : wire129) ?
                  $unsigned(wire128) : (reg145 ? reg148 : reg139))))};
    end
  assign wire150 = ((({(~&reg145), reg145[(1'h1):(1'h1)]} ?
                       ((reg149 ? wire128 : wire129) ?
                           wire132 : $unsigned(reg148)) : {(wire128 ?
                               wire134 : wire129)}) ~^ {reg144[(2'h2):(2'h2)],
                       ((&(7'h41)) ?
                           (~&wire129) : (&reg149))}) ~^ wire130[(3'h4):(3'h4)]);
  assign wire151 = ((^~wire133) & (~{wire130}));
  always
    @(posedge clk) begin
      reg152 <= reg144[(4'h8):(3'h7)];
      if ($unsigned({(reg144 <<< ((reg149 >= reg144) ?
              (reg139 << reg152) : (reg149 >>> reg139))),
          ((7'h40) ? reg139[(3'h5):(3'h4)] : {$signed(reg136)})}))
        begin
          reg153 <= $unsigned(reg141);
          reg154 <= wire133[(1'h1):(1'h0)];
          reg155 <= $signed(wire134);
        end
      else
        begin
          reg153 <= wire151[(4'hd):(3'h6)];
          if ($signed((&reg152)))
            begin
              reg154 <= $unsigned(reg148);
            end
          else
            begin
              reg154 <= reg141;
            end
        end
    end
  assign wire156 = wire130[(3'h5):(2'h2)];
  module157 #() modinst176 (wire175, clk, wire133, wire134, wire150, reg144, reg148);
  assign wire177 = reg152;
  assign wire178 = $signed({$unsigned((((8'ha2) < wire150) ?
                           (reg146 && reg141) : (wire151 >>> (8'ha3))))});
  assign wire179 = $signed((^~$unsigned(((wire178 ?
                       wire178 : reg153) != $signed((8'hb4))))));
  always
    @(posedge clk) begin
      if ((reg141 ~^ ((wire128 > ((wire134 <<< reg139) ?
          reg141 : $signed(reg142))) <<< reg145)))
        begin
          reg180 <= $signed((~$unsigned((~$unsigned(reg143)))));
          if (wire132)
            begin
              reg181 <= reg144[(4'ha):(3'h7)];
              reg182 <= (wire150 <<< $signed($unsigned((~&$unsigned(wire131)))));
            end
          else
            begin
              reg181 <= wire178[(4'hf):(4'ha)];
            end
          reg183 <= ($unsigned($unsigned(((wire133 == reg137) ?
                  wire178[(5'h10):(1'h0)] : (-(8'hbe))))) ?
              (reg143[(4'hc):(4'h9)] * (~&(reg147[(4'hd):(1'h0)] ?
                  ((8'hb7) ?
                      reg147 : wire156) : (+wire129)))) : $unsigned($unsigned(((~&wire150) << (~&reg142)))));
        end
      else
        begin
          reg180 <= {$unsigned(wire179[(4'h8):(1'h0)])};
          reg181 <= $signed(((~^(&(reg147 ? wire177 : wire131))) ?
              {reg154} : (((reg155 ~^ reg182) ?
                  reg139[(2'h2):(1'h1)] : (+wire175)) + (~|wire150))));
          reg182 <= (~|(~&reg143[(1'h1):(1'h0)]));
          reg183 <= {((reg142[(3'h7):(1'h0)] ?
                      (wire128[(5'h11):(1'h0)] > (wire156 <<< reg181)) : reg145) ?
                  (^reg140) : reg147),
              wire129[(3'h7):(1'h1)]};
        end
    end
  assign wire184 = {reg183[(1'h1):(1'h0)], (8'ha8)};
  always
    @(posedge clk) begin
      if ($unsigned(((((~&reg139) <= $signed((8'hba))) ~^ $unsigned($unsigned(reg136))) ?
          $unsigned(reg136) : (~&($unsigned(wire179) - wire134)))))
        begin
          reg185 <= {(|(wire156 ?
                  {(8'h9d)} : ((wire134 == wire128) ^~ (wire131 ~^ reg148)))),
              {(7'h42), (~&wire150)}};
          reg186 <= $unsigned($signed($unsigned($unsigned((+reg147)))));
          reg187 <= (reg153 || (8'had));
          reg188 <= $unsigned(wire151);
          reg189 <= wire129;
        end
      else
        begin
          reg185 <= $signed((($signed((&wire175)) & {(~&(8'haf)), wire151}) ?
              wire184 : $unsigned((wire133 ?
                  ((7'h40) ? reg186 : reg147) : reg155))));
          if ($unsigned((8'ha6)))
            begin
              reg186 <= reg138;
              reg187 <= ($unsigned($signed({(wire179 ? reg145 : reg189),
                  $unsigned((7'h41))})) > reg147[(4'ha):(3'h7)]);
            end
          else
            begin
              reg186 <= reg143[(4'hc):(1'h1)];
              reg187 <= reg135;
              reg188 <= reg136;
              reg189 <= reg188;
              reg190 <= ($unsigned($signed((reg149 << reg147[(4'hc):(2'h3)]))) ?
                  {reg135,
                      reg183[(2'h3):(1'h0)]} : (reg139[(2'h3):(1'h0)] > wire130));
            end
          reg191 <= (|(!(!$unsigned($unsigned(reg140)))));
          reg192 <= (^~reg148[(3'h7):(2'h2)]);
          reg193 <= (+(8'ha0));
        end
      if ($unsigned((reg140 != (((-reg149) + $unsigned(reg135)) < (reg181[(5'h10):(4'hc)] ?
          $unsigned(reg153) : wire130[(3'h6):(3'h4)])))))
        begin
          reg194 <= reg140[(5'h11):(4'ha)];
          reg195 <= ($unsigned(reg149) >= $unsigned(wire134));
          reg196 <= reg190[(4'hc):(2'h3)];
        end
      else
        begin
          reg194 <= ({{wire150,
                  ($signed(reg190) ?
                      (reg196 ? reg190 : reg140) : (reg148 != reg186))},
              ({(reg185 > reg147), wire128} ~^ {$unsigned(reg185),
                  reg192})} != wire177[(4'hc):(3'h7)]);
          reg195 <= (^{(($unsigned((8'ha7)) ? reg189 : reg180[(4'ha):(3'h7)]) ?
                  $unsigned({reg195}) : reg194)});
        end
    end
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire123;
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  assign y = {wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire45,
                 wire47,
                 wire48,
                 wire49,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire93,
                 wire123,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire20 = (8'ha0);
  assign wire21 = wire20[(1'h1):(1'h0)];
  assign wire22 = wire19;
  assign wire23 = $unsigned(wire21);
  assign wire24 = wire18;
  module25 #() modinst46 (wire45, clk, wire23, wire17, wire24, wire18);
  assign wire47 = $signed(($signed($unsigned(wire24)) ?
                      $unsigned((wire16 ?
                          $unsigned((8'hbd)) : wire19[(3'h5):(2'h2)])) : wire24[(3'h4):(1'h0)]));
  assign wire48 = wire20[(1'h0):(1'h0)];
  assign wire49 = {{wire17}, (^~$signed(wire15))};
  always
    @(posedge clk) begin
      reg50 <= $unsigned({wire15,
          (^(wire49[(1'h1):(1'h1)] ?
              (wire49 ? wire17 : wire16) : $unsigned(wire17)))});
      reg51 <= wire23[(4'h8):(3'h5)];
      if (reg50)
        begin
          reg52 <= $unsigned((&$unsigned(wire21)));
        end
      else
        begin
          if ($unsigned($unsigned($signed($unsigned((&wire49))))))
            begin
              reg52 <= ($unsigned(wire22[(3'h4):(1'h1)]) ? wire45 : wire20);
              reg53 <= wire47[(3'h5):(2'h3)];
              reg54 <= $signed(($signed(wire49[(3'h7):(2'h3)]) ?
                  wire19[(4'h9):(4'h8)] : $unsigned(wire16)));
              reg55 <= ($signed($unsigned(wire15)) ?
                  wire24 : (reg51 ?
                      ($signed((wire21 ^~ wire23)) ?
                          (wire16 ?
                              $unsigned((7'h42)) : {(8'hb5)}) : $unsigned((^~wire19))) : {{$signed((7'h41)),
                              wire16}}));
            end
          else
            begin
              reg52 <= (~^$unsigned($unsigned((&{wire19}))));
              reg53 <= (($signed((reg54 ?
                  ((7'h42) ?
                      wire23 : reg54) : $unsigned(wire48))) < $signed($signed($unsigned((8'hb2))))) & $unsigned($signed(($signed(wire19) ~^ (reg50 ?
                  wire45 : wire49)))));
            end
          if (wire19[(5'h10):(3'h6)])
            begin
              reg56 <= ($unsigned($signed($unsigned(reg55))) ?
                  (-($unsigned((wire19 ?
                      wire22 : wire47)) <<< (((8'h9e) < wire48) ?
                      wire18[(1'h0):(1'h0)] : wire15))) : $unsigned((wire23 ?
                      (~&((8'hb7) ? reg52 : reg53)) : wire19[(3'h4):(2'h2)])));
              reg57 <= $unsigned((~|(-$signed((wire18 <<< wire15)))));
              reg58 <= wire48;
              reg59 <= (reg55 > {reg55,
                  ($signed(wire17) <<< $unsigned((^~wire47)))});
            end
          else
            begin
              reg56 <= wire20;
            end
          reg60 <= $signed(reg59[(4'h9):(1'h1)]);
        end
      reg61 <= ((+reg53) & $signed((reg54[(3'h6):(3'h6)] ?
          (reg51 ^~ {reg54, wire19}) : {wire48[(3'h4):(3'h4)], (^wire48)})));
    end
  assign wire62 = (8'ha5);
  assign wire63 = reg60;
  assign wire64 = reg50[(1'h1):(1'h0)];
  assign wire65 = (({((reg50 ? wire16 : wire62) ?
                              (7'h41) : reg57[(4'hd):(3'h5)]),
                          $signed((wire15 >>> wire63))} + $unsigned({(wire45 ?
                              wire20 : wire19)})) ?
                      wire64[(4'h8):(3'h4)] : ({((wire45 && wire63) ^ $signed((8'ha1)))} && {$unsigned(wire15)}));
  assign wire66 = {{wire15[(4'he):(2'h2)]},
                      ((~wire49) ?
                          (({wire15, (8'hb8)} ?
                              wire63[(4'hb):(3'h6)] : (+wire20)) ^~ (^wire16[(3'h4):(1'h1)])) : {((|(8'hae)) > reg54)})};
  module67 #() modinst94 (.wire71(wire65), .wire69(wire23), .wire70(wire18), .clk(clk), .wire68(wire24), .y(wire93));
  module95 #() modinst124 (wire123, clk, wire65, wire17, wire20, reg60, reg57);
endmodule

module module95
#(parameter param122 = (8'h9e))
(y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire100;
  input wire signed [(5'h12):(1'h0)] wire99;
  input wire [(2'h3):(1'h0)] wire98;
  input wire [(5'h15):(1'h0)] wire97;
  input wire [(5'h15):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire101;
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
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
                 reg105,
                 (1'h0)};
  assign wire101 = (((wire99[(4'hf):(4'hd)] ?
                               (~&{wire97, wire98}) : $signed(((8'ha0) ?
                                   wire96 : wire96))) ?
                           (^{(wire99 == wire96), (^~wire96)}) : wire98) ?
                       {wire100} : (wire96[(4'ha):(1'h1)] <<< wire98));
  assign wire102 = $signed((~wire101[(1'h1):(1'h0)]));
  assign wire103 = wire96[(4'h8):(1'h0)];
  assign wire104 = ((~^$unsigned($signed((wire99 >= wire99)))) ?
                       $unsigned($unsigned(wire99[(5'h11):(4'hc)])) : (+wire98));
  always
    @(posedge clk) begin
      reg105 <= {{{(~&$signed(wire101)), wire96[(2'h3):(1'h1)]}}};
    end
  always
    @(posedge clk) begin
      if (((~|wire102[(4'ha):(2'h3)]) ?
          (-(((wire103 == wire99) ?
              ((8'ha8) >= wire104) : (wire103 ?
                  reg105 : reg105)) <= $unsigned({wire103,
              wire101}))) : (-(+{wire104[(2'h3):(1'h0)],
              wire104[(3'h5):(3'h5)]}))))
        begin
          reg106 <= reg105;
          reg107 <= $signed((($unsigned((^~wire101)) ^~ reg105[(2'h3):(1'h1)]) != {$signed((wire97 ?
                  wire96 : wire103)),
              (!$signed(reg106))}));
          reg108 <= wire98[(1'h1):(1'h0)];
          reg109 <= $unsigned({{(~&wire96[(4'ha):(1'h0)])}});
          reg110 <= wire98;
        end
      else
        begin
          reg106 <= (wire101[(1'h0):(1'h0)] << (((-(wire103 ?
                      reg109 : wire98)) ?
                  ($signed(wire100) ?
                      (~^(8'hae)) : (|reg106)) : reg105[(1'h1):(1'h1)]) ?
              {$signed(reg107)} : ({(~&(7'h40)),
                  (reg107 | reg105)} == (8'hab))));
          if ((wire101[(2'h2):(1'h1)] <= reg106))
            begin
              reg107 <= ({$unsigned(reg109[(1'h1):(1'h0)])} ^~ (|($signed($unsigned(wire102)) ?
                  (~$signed(wire98)) : $unsigned(wire104[(2'h3):(1'h0)]))));
              reg108 <= {$unsigned(($signed(wire98[(2'h3):(1'h0)]) <<< {(~&(8'hb7)),
                      reg109})),
                  wire102};
              reg109 <= $unsigned(($signed(reg107) ?
                  wire100 : ((reg105[(1'h0):(1'h0)] && $signed(reg108)) >>> ({wire99} ?
                      reg109 : ((8'hab) ? reg107 : wire99)))));
            end
          else
            begin
              reg107 <= {reg108};
              reg108 <= ((~|reg106[(1'h0):(1'h0)]) ?
                  $signed(reg110) : reg109[(3'h6):(1'h1)]);
              reg109 <= reg108;
              reg110 <= {wire104[(3'h5):(1'h0)],
                  $unsigned({$unsigned((wire101 < (8'haa)))})};
              reg111 <= (((reg105 ?
                      $unsigned(wire99) : $unsigned((wire96 | reg107))) != reg106) ?
                  wire104[(2'h3):(2'h2)] : (($unsigned({wire97}) || ((wire103 ?
                      reg108 : reg109) >> $signed(reg110))) <<< $signed(reg108)));
            end
          if ({(($unsigned({wire101, wire104}) + {$signed(wire99)}) ?
                  ((8'h9e) | {wire104,
                      (wire101 ~^ reg110)}) : ($signed(wire97) ?
                      reg111[(2'h3):(1'h1)] : reg109)),
              $unsigned({$unsigned(((8'hbc) ? wire101 : (8'hb5)))})})
            begin
              reg112 <= wire96[(3'h4):(2'h3)];
              reg113 <= (+$unsigned((wire102[(4'ha):(1'h1)] >> {(^(8'ha1)),
                  $signed((8'ha2))})));
            end
          else
            begin
              reg112 <= (+((~|((~|wire102) >> reg111[(1'h0):(1'h0)])) ~^ (wire101[(1'h0):(1'h0)] ^ reg110)));
              reg113 <= wire96[(4'hc):(2'h3)];
              reg114 <= (wire98 ?
                  (wire97 ?
                      ((~&(wire96 ?
                          wire102 : reg112)) + wire103[(3'h6):(3'h4)]) : {reg106,
                          {$unsigned(wire99)}}) : ({(+wire101[(1'h1):(1'h0)])} ?
                      $unsigned(reg106[(2'h2):(1'h0)]) : $signed(wire96)));
              reg115 <= $signed($unsigned((8'hb5)));
            end
          reg116 <= wire103[(4'hc):(2'h3)];
          reg117 <= $signed($unsigned(((7'h42) ?
              $signed($unsigned((8'hae))) : wire99[(3'h6):(1'h1)])));
        end
    end
  assign wire118 = ((($signed((reg114 ?
                           wire96 : (8'h9e))) - $unsigned($unsigned((8'hb0)))) ?
                       ($unsigned(reg115) ?
                           {reg115[(4'ha):(4'ha)]} : reg107) : $signed({{wire98},
                           $unsigned(reg114)})) >>> wire100[(4'h9):(3'h6)]);
  assign wire119 = ({wire100[(3'h7):(3'h7)],
                           (($unsigned(reg117) >> (reg112 >> reg113)) ?
                               (reg116 >= (reg110 || (8'hb7))) : $unsigned((reg117 ?
                                   reg116 : reg109)))} ?
                       $signed(({(reg117 == reg115),
                           wire98[(1'h1):(1'h0)]} & $signed(reg106[(3'h4):(1'h1)]))) : $signed(((^(~(8'hbd))) || $signed($unsigned(reg106)))));
  assign wire120 = $signed((($unsigned($unsigned((8'ha0))) > (+(8'hb3))) >= (|{(reg117 || reg114)})));
  assign wire121 = $unsigned(wire98[(1'h0):(1'h0)]);
endmodule

module module67  (y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire71;
  input wire signed [(5'h12):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  input wire [(4'h8):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg90,
                 reg89,
                 reg83,
                 (1'h0)};
  assign wire72 = ({(-$signed((&wire70))), (^~$signed($unsigned(wire69)))} ?
                      wire70[(3'h7):(3'h7)] : wire68);
  assign wire73 = ({(8'hb6)} ? wire72 : (~wire71));
  assign wire74 = {$signed(wire73), wire70[(4'ha):(3'h5)]};
  assign wire75 = ($signed(wire68[(3'h6):(1'h0)]) ?
                      $unsigned((($unsigned(wire69) ?
                          (~&(8'hae)) : (wire72 != wire73)) || $signed((wire74 ?
                          wire69 : (8'hb4))))) : $unsigned((wire72[(4'h8):(1'h1)] && wire71[(1'h0):(1'h0)])));
  assign wire76 = $unsigned((wire73 | (^$signed((wire72 ? (8'ha5) : wire72)))));
  assign wire77 = wire74;
  assign wire78 = (8'hb1);
  assign wire79 = $unsigned($signed((~wire71)));
  assign wire80 = (~wire69[(4'hf):(2'h2)]);
  assign wire81 = (^wire71[(2'h2):(1'h0)]);
  assign wire82 = (wire80[(4'hf):(4'he)] != (~|(+wire78[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg83 <= ($unsigned(((8'hb8) ?
          wire69 : ((wire79 && wire72) + $signed(wire80)))) >> wire77);
    end
  assign wire84 = (8'hb5);
  assign wire85 = ({$unsigned(reg83),
                      $signed($signed((wire74 && wire82)))} & ($unsigned(wire76[(1'h1):(1'h1)]) || (~^$signed(wire76[(4'h9):(1'h0)]))));
  assign wire86 = ($signed(($signed((wire85 >= (8'hb3))) ?
                      {$signed(wire70), (~|wire74)} : {(wire73 <= (8'hb5)),
                          $signed(wire76)})) << wire76[(4'hc):(4'ha)]);
  assign wire87 = ((wire85[(1'h0):(1'h0)] ?
                      $signed(($signed((7'h44)) >> $signed((8'hb3)))) : $signed({$unsigned(wire76)})) < wire78);
  assign wire88 = $signed(((8'haa) <<< {(8'hab)}));
  always
    @(posedge clk) begin
      reg89 <= ($signed((~^wire72[(4'hb):(1'h0)])) ?
          ((+(~wire73)) ?
              $unsigned((wire68 ?
                  (wire73 ?
                      wire74 : wire72) : (-(7'h42)))) : ((wire80[(4'h9):(3'h7)] ?
                      (wire74 ? wire79 : wire82) : $unsigned(reg83)) ?
                  $unsigned($signed(wire79)) : $unsigned((~wire72)))) : {$signed($signed((wire70 ?
                  wire70 : wire79))),
              wire74});
      reg90 <= wire68[(3'h4):(2'h3)];
    end
  assign wire91 = wire77[(1'h0):(1'h0)];
  assign wire92 = (!$signed($unsigned(($unsigned(wire69) ?
                      reg90[(4'he):(3'h4)] : (+wire69)))));
endmodule

module module25
#(parameter param43 = ((({((8'ha6) ? (8'had) : (7'h44))} ? ((&(8'haf)) ? ((8'hb0) ? (8'hab) : (8'ha1)) : ((8'hba) ? (8'hb9) : (8'ha5))) : (7'h42)) ? (+({(8'hb5), (8'hb0)} ? ((8'ha3) ? (8'hb5) : (8'hb4)) : ((8'hbe) ? (8'h9e) : (8'h9d)))) : (!(+(+(8'ha3))))) ? {{(&((8'hac) ? (8'ha5) : (8'h9e)))}} : ({(((8'h9c) ? (8'ha1) : (8'hbc)) ? {(8'hae)} : ((8'ha8) << (8'haf)))} ? ((((8'ha7) + (8'ha0)) | {(8'had)}) ? ((-(8'hbf)) & {(8'h9e), (8'hbc)}) : (8'hb8)) : (((|(8'hb7)) ? ((7'h43) & (8'ha3)) : (!(8'ha3))) ? ({(8'hb4)} ? ((8'ha4) == (8'had)) : (~&(8'hb2))) : {(~&(8'hb0))}))), 
parameter param44 = ((((param43 ? {param43, param43} : param43) <<< {param43}) ? (-({(8'hb5), param43} > param43)) : (param43 <= {(param43 > param43), (param43 || param43)})) > (((param43 ? param43 : (8'ha3)) >> ((8'h9f) ? (param43 + param43) : (param43 ? param43 : param43))) - {((param43 ? param43 : param43) + {(8'hb1)}), ((~^param43) ^ {param43, (8'hb7)})})))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire30;
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire30,
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
                 (1'h0)};
  assign wire30 = (!$unsigned((^~(wire29 > (wire29 != wire27)))));
  always
    @(posedge clk) begin
      reg31 <= ({$signed(wire27),
              {(wire26[(3'h4):(2'h3)] & $signed(wire30)),
                  $signed((|(8'hbf)))}} ?
          wire29[(2'h2):(2'h2)] : (~^$signed($signed((wire30 ?
              wire27 : wire28)))));
      if ({(wire26[(3'h6):(2'h2)] ?
              (wire28[(1'h1):(1'h0)] > $unsigned((wire29 ?
                  wire28 : (8'h9d)))) : (+((^~wire26) ?
                  (~wire26) : (~|wire30))))})
        begin
          reg32 <= $unsigned(wire26[(1'h1):(1'h1)]);
          reg33 <= $unsigned(wire28);
          reg34 <= (~|({(wire29[(1'h1):(1'h0)] ?
                  $signed((7'h43)) : $unsigned(reg32))} + {((~&wire30) << $signed(wire29))}));
          reg35 <= ((wire28[(1'h1):(1'h0)] || (wire28[(3'h6):(3'h6)] > (~^(reg31 != (8'ha3))))) ?
              (($signed((wire26 ? wire30 : wire30)) ?
                      $unsigned($signed(reg31)) : (!(reg34 > wire30))) ?
                  {(+(wire26 ~^ (8'hb5)))} : (8'hba)) : wire29[(1'h1):(1'h1)]);
        end
      else
        begin
          if (reg32)
            begin
              reg32 <= (^~{(!(wire29 || (wire29 && wire26)))});
              reg33 <= reg33[(3'h6):(3'h6)];
              reg34 <= ($unsigned(reg35) >>> $signed((-((^~wire26) ?
                  $unsigned(reg34) : $signed(reg34)))));
              reg35 <= $signed((~&$unsigned($signed(wire29))));
              reg36 <= {reg34[(1'h0):(1'h0)]};
            end
          else
            begin
              reg32 <= ((wire28 == ({(reg34 | reg33)} - wire27[(2'h2):(1'h0)])) ?
                  (+$unsigned($unsigned({wire29,
                      reg33}))) : $signed($signed((~|reg32[(1'h1):(1'h1)]))));
            end
        end
      if ($signed($signed((^reg32))))
        begin
          reg37 <= $signed($signed(reg34[(1'h1):(1'h0)]));
        end
      else
        begin
          reg37 <= reg35[(2'h2):(2'h2)];
          reg38 <= reg37[(3'h6):(1'h0)];
          reg39 <= {reg36};
          reg40 <= reg33;
        end
    end
  assign wire41 = $signed(reg33[(1'h1):(1'h0)]);
  assign wire42 = ($unsigned(wire41[(1'h0):(1'h0)]) >> wire41[(1'h1):(1'h0)]);
endmodule

module module157  (y, clk, wire162, wire161, wire160, wire159, wire158);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire162;
  input wire signed [(4'ha):(1'h0)] wire161;
  input wire signed [(2'h2):(1'h0)] wire160;
  input wire signed [(4'hc):(1'h0)] wire159;
  input wire [(3'h6):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire174;
  wire [(3'h7):(1'h0)] wire173;
  wire [(5'h11):(1'h0)] wire172;
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg [(4'hf):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg166 = (1'h0);
  reg [(5'h14):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg163 <= ((wire162 ?
              $unsigned($signed($signed(wire160))) : (~&$unsigned((wire161 ?
                  wire162 : wire161)))) ?
          $signed(((wire161 ?
              (~wire158) : $unsigned(wire158)) == wire162[(3'h7):(3'h7)])) : ($signed((-(~^wire161))) ?
              wire158[(3'h6):(3'h5)] : ($unsigned((~(8'hbb))) | (8'ha7))));
      if (wire160)
        begin
          reg164 <= wire160;
          if (((reg163[(1'h1):(1'h1)] ?
              {(((8'ha8) ^ wire161) ?
                      $unsigned(reg164) : wire159)} : $signed((((7'h40) <= reg163) ?
                  wire161[(4'ha):(3'h4)] : wire160))) <<< (|$unsigned({wire159}))))
            begin
              reg165 <= $unsigned(wire158);
              reg166 <= (^{($signed(reg163[(3'h6):(3'h5)]) ?
                      $unsigned((wire159 ?
                          (8'haf) : reg165)) : $unsigned(reg163)),
                  wire159});
            end
          else
            begin
              reg165 <= ($signed((wire159[(1'h0):(1'h0)] << ((&wire161) ?
                  $unsigned(reg165) : {wire158, wire160}))) & {reg163,
                  (|wire158[(3'h4):(1'h0)])});
              reg166 <= $signed((reg163 ?
                  (reg163 ?
                      $unsigned((reg166 ?
                          (8'ha2) : reg164)) : $unsigned($signed(reg164))) : wire161[(1'h1):(1'h0)]));
              reg167 <= (-$signed((reg164 ?
                  ($signed(reg164) - wire162) : $unsigned(wire159[(4'ha):(4'ha)]))));
            end
          reg168 <= wire161[(4'ha):(4'ha)];
          if ($signed($signed((reg164 ?
              (reg168 ?
                  (reg168 * reg166) : {wire158, (8'hb5)}) : $signed(((8'hbb) ?
                  reg163 : (8'hb9)))))))
            begin
              reg169 <= (wire160 ?
                  (reg164[(3'h4):(2'h2)] == {(|reg165)}) : $signed(wire160[(2'h2):(2'h2)]));
              reg170 <= reg168;
              reg171 <= $signed($signed({$signed($signed(reg167))}));
            end
          else
            begin
              reg169 <= reg164[(2'h2):(2'h2)];
              reg170 <= $signed($unsigned(($signed((reg166 ?
                      reg165 : wire160)) ?
                  ((reg171 && reg164) ?
                      $unsigned(wire160) : $unsigned((8'hb9))) : ((reg170 ^~ (8'hb3)) ?
                      (wire160 ? reg167 : wire159) : reg165[(5'h10):(4'he)]))));
            end
        end
      else
        begin
          reg164 <= {(^~$unsigned(reg164)), (~|reg163)};
          reg165 <= $signed((-$signed($signed($unsigned(wire161)))));
          if ((+((~&(reg170[(1'h0):(1'h0)] > reg165[(3'h6):(3'h6)])) ?
              $unsigned({wire162}) : $signed({reg169, (reg164 <= wire159)}))))
            begin
              reg166 <= (|reg163);
              reg167 <= reg167[(3'h4):(2'h2)];
              reg168 <= reg165;
            end
          else
            begin
              reg166 <= (!(~&$unsigned((^(reg170 ? reg170 : wire158)))));
              reg167 <= wire160;
              reg168 <= {(^(~&(8'hb1))), wire160};
            end
        end
    end
  assign wire172 = $signed(wire160[(1'h0):(1'h0)]);
  assign wire173 = wire161[(2'h3):(2'h3)];
  assign wire174 = ($unsigned($unsigned(reg168[(4'h9):(3'h7)])) || reg163);
endmodule
