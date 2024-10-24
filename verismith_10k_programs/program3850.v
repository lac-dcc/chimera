module top
#(parameter param232 = (((({(8'hb4), (7'h41)} ? (+(8'ha5)) : ((7'h41) ? (8'h9e) : (8'hb3))) ? (8'h9d) : {((7'h44) ? (8'hac) : (8'hae))}) ? {(((8'hb5) ? (8'hae) : (8'ha7)) >> (8'hbe)), ({(8'h9e), (8'h9e)} == ((8'hb4) - (7'h42)))} : {{((8'hb1) + (8'hb8))}, ({(8'h9c)} && (8'ha8))}) != (({{(8'hae)}} | {((8'ha8) << (8'hb9)), (8'hb2)}) || (((~(8'haf)) ? (!(8'ha3)) : ((8'hbe) == (8'hac))) >= (((8'hb7) ? (8'hbf) : (8'hbb)) ? ((8'hb6) ? (8'hb6) : (8'hae)) : ((8'hae) ? (8'ha4) : (8'hbb)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire231;
  wire signed [(3'h7):(1'h0)] wire230;
  wire [(3'h6):(1'h0)] wire229;
  wire [(3'h4):(1'h0)] wire227;
  wire signed [(5'h15):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire87;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire214;
  wire [(3'h5):(1'h0)] wire216;
  wire [(5'h13):(1'h0)] wire217;
  wire [(3'h7):(1'h0)] wire218;
  wire signed [(3'h5):(1'h0)] wire220;
  wire signed [(4'he):(1'h0)] wire221;
  wire [(3'h4):(1'h0)] wire222;
  wire signed [(4'hc):(1'h0)] wire224;
  wire [(4'hc):(1'h0)] wire225;
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  assign y = {wire231,
                 wire230,
                 wire229,
                 wire227,
                 wire82,
                 wire5,
                 wire19,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire214,
                 wire216,
                 wire217,
                 wire218,
                 wire220,
                 wire221,
                 wire222,
                 wire224,
                 wire225,
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
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire5 = (~((!$unsigned($signed((8'hbc)))) < ((8'ha8) >> wire1)));
  module6 #() modinst20 (.wire7(wire4), .wire8(wire1), .wire11(wire2), .wire9(wire5), .clk(clk), .y(wire19), .wire10(wire3));
  always
    @(posedge clk) begin
      reg21 <= ({(&(~&$unsigned((8'hb2))))} < (!wire3[(4'ha):(4'ha)]));
      if ((|wire5[(2'h3):(1'h1)]))
        begin
          if ((~((+(((8'hba) ? wire3 : wire0) ?
                  (wire4 ? wire2 : wire3) : wire4)) ?
              $signed($signed((wire1 * wire5))) : (-$unsigned(wire3)))))
            begin
              reg22 <= $unsigned((~^reg21));
            end
          else
            begin
              reg22 <= ($signed(wire3) << wire19);
            end
          if (wire19)
            begin
              reg23 <= $signed($unsigned(wire19[(4'h9):(3'h4)]));
              reg24 <= (^~$signed((^~$unsigned((wire19 ? (8'hb1) : (8'hb8))))));
              reg25 <= $unsigned(({(+(wire1 | (8'ha4))),
                  reg21[(4'hb):(2'h2)]} || $signed(wire4)));
              reg26 <= ((^$unsigned($unsigned((~^reg25)))) ?
                  wire0[(1'h1):(1'h0)] : wire5[(1'h1):(1'h1)]);
            end
          else
            begin
              reg23 <= (wire1[(1'h1):(1'h1)] ?
                  (((~^(wire5 >= wire0)) ?
                      reg22 : ((~&reg23) * {(8'hb5),
                          reg24})) * reg25) : ($signed({$unsigned(reg22)}) << {wire4[(3'h4):(2'h3)]}));
              reg24 <= wire2[(4'hc):(3'h6)];
            end
          if (wire3)
            begin
              reg27 <= reg24[(3'h6):(1'h0)];
              reg28 <= reg21;
              reg29 <= (~(&$signed(((~^reg24) > reg24))));
              reg30 <= {(~(&$unsigned({reg24}))),
                  ((($signed(wire1) ? reg28 : $unsigned(reg25)) ?
                          $unsigned(wire5[(2'h3):(1'h0)]) : (~$signed(wire1))) ?
                      (8'ha7) : {reg28})};
            end
          else
            begin
              reg27 <= {$unsigned((reg30[(3'h6):(3'h6)] << $unsigned({reg23,
                      wire2}))),
                  ($signed(reg29) & ($signed($unsigned(wire3)) <<< $signed(reg22)))};
            end
          if ($unsigned((^~{{(wire19 ? reg30 : reg26), (|reg26)}, wire2})))
            begin
              reg31 <= $unsigned($signed((~|$signed((|reg23)))));
              reg32 <= $unsigned(((reg27 ^~ $signed(((7'h40) & reg31))) ?
                  reg31[(1'h0):(1'h0)] : {{$unsigned((8'h9e)), {wire0}}}));
              reg33 <= reg22;
            end
          else
            begin
              reg31 <= $unsigned(($signed($signed(reg26[(1'h0):(1'h0)])) ?
                  (reg25 ?
                      (~&(-reg30)) : (&reg26)) : ($unsigned((wire2 <= reg23)) ~^ ((wire2 ?
                      reg28 : wire4) ^ (^~wire1)))));
              reg32 <= reg32[(2'h2):(1'h1)];
              reg33 <= reg25;
              reg34 <= wire2;
            end
          if ((($signed((~|(^~reg31))) ?
              {$unsigned((wire0 >> reg33))} : {$unsigned((reg34 && reg23))}) >> $signed((((&reg23) ?
                  (reg31 ~^ reg29) : $unsigned(reg26)) ?
              (&reg27) : (8'hbc)))))
            begin
              reg35 <= $unsigned(({wire19[(4'h8):(3'h7)]} >= ($unsigned((reg26 < reg26)) ?
                  $signed((&reg29)) : (wire5 ?
                      $signed(reg32) : reg31[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg35 <= wire3[(4'he):(2'h2)];
              reg36 <= (((8'hbd) ?
                  $signed((+(|reg33))) : (~|(reg32[(4'ha):(2'h2)] > $signed(reg23)))) <<< ($signed({(reg35 ?
                      reg28 : reg28)}) >= reg33[(2'h2):(2'h2)]));
              reg37 <= (reg22 ?
                  $signed($signed($unsigned(((8'h9c) ?
                      wire3 : (8'ha8))))) : (~^(~|$unsigned((reg21 ~^ reg29)))));
              reg38 <= wire2[(3'h7):(3'h4)];
            end
        end
      else
        begin
          reg22 <= wire5[(1'h0):(1'h0)];
          reg23 <= {(reg32 ? (-{wire1[(3'h4):(1'h1)]}) : (~$unsigned(wire2))),
              ((reg23[(2'h2):(1'h0)] ?
                      (~^$signed(reg35)) : wire3[(3'h4):(2'h2)]) ?
                  $signed((-((8'hb8) * reg22))) : ($unsigned(reg26[(3'h5):(2'h2)]) << (reg34[(2'h2):(2'h2)] + (reg38 | reg35))))};
          reg24 <= (~&((8'ha9) && $signed(reg36[(3'h7):(2'h2)])));
          reg25 <= wire0[(1'h0):(1'h0)];
        end
      if ((~^$unsigned((+((^reg33) ?
          $signed((8'hab)) : (reg21 ? reg30 : wire0))))))
        begin
          reg39 <= (reg29 ?
              $signed((|$signed(reg38))) : ((reg33 >> ($unsigned(reg21) ^ {wire4,
                  wire19})) >= (($signed(reg24) ?
                      (reg34 > wire3) : $unsigned(reg29)) ?
                  reg24 : reg23)));
        end
      else
        begin
          if (reg39)
            begin
              reg39 <= ($unsigned($signed($unsigned(reg26))) ?
                  ($unsigned(((reg37 >= reg21) << reg29[(1'h0):(1'h0)])) < (($signed(reg24) >= reg24) ?
                      reg39[(4'hb):(2'h3)] : wire0[(4'hf):(3'h5)])) : ((^($signed(wire2) == wire2)) ?
                      wire2[(2'h3):(2'h3)] : ((~(reg23 ~^ reg36)) || ((reg23 << reg27) >> (^~wire0)))));
              reg40 <= reg28;
              reg41 <= $signed($unsigned($unsigned(reg22)));
              reg42 <= (|($signed(((7'h41) ?
                      (wire2 ^~ reg30) : $unsigned(reg34))) ?
                  (^~$signed($unsigned(reg21))) : $unsigned(($signed(reg21) >= $unsigned(reg38)))));
            end
          else
            begin
              reg39 <= $signed(($unsigned(($signed(wire19) < $signed(reg33))) << ((|$unsigned(reg27)) >> $signed((8'ha3)))));
              reg40 <= {(+reg29[(3'h7):(1'h0)]),
                  (^~(((reg24 - reg39) ~^ $signed((8'hb5))) ?
                      $signed(reg37) : (^(reg41 ? reg28 : reg39))))};
            end
        end
    end
  module43 #() modinst83 (wire82, clk, wire19, reg21, reg27, reg35);
  assign wire84 = {$unsigned(((-(reg41 == reg22)) & $signed((reg35 ?
                          reg22 : wire0))))};
  assign wire85 = reg34[(4'hb):(3'h6)];
  assign wire86 = ((~(!((reg40 ?
                      wire1 : (8'hb3)) <<< wire19))) != $unsigned(((wire1 ?
                          reg23[(2'h2):(1'h1)] : (wire5 ? reg25 : wire82)) ?
                      reg38 : ($unsigned(reg29) ? $unsigned(reg33) : reg31))));
  assign wire87 = ((8'hbb) ? wire85 : reg25);
  assign wire88 = reg27[(3'h7):(3'h4)];
  assign wire89 = reg22;
  module90 #() modinst215 (wire214, clk, reg34, wire1, reg30, wire85);
  assign wire216 = $unsigned(reg26);
  assign wire217 = ({(7'h41)} ?
                       {(((wire3 * reg35) != (reg42 << (8'hbd))) ?
                               $signed($unsigned(wire19)) : reg37),
                           ({(8'ha8)} ^~ $signed(reg26[(2'h3):(1'h0)]))} : (~(reg26[(2'h2):(2'h2)] - (+{reg36}))));
  module43 #() modinst219 (.clk(clk), .wire46(wire0), .wire47(wire84), .wire45(reg25), .wire44(reg28), .y(wire218));
  assign wire220 = $signed($signed((~^($signed(reg21) ?
                       (reg33 ? reg31 : reg32) : $unsigned(wire218)))));
  assign wire221 = $signed($unsigned(((reg32[(1'h1):(1'h1)] ~^ (8'ha4)) ?
                       wire220[(2'h2):(1'h1)] : ((!(8'h9e)) & $unsigned(wire1)))));
  module90 #() modinst223 (.wire91(reg32), .clk(clk), .wire92(reg23), .wire94(reg38), .wire93(reg30), .y(wire222));
  assign wire224 = (((~&(8'hbb)) == $signed(($unsigned(wire88) ~^ (wire4 | reg33)))) ?
                       ($signed($signed($signed(wire216))) >>> $signed((~&((8'hbc) ~^ reg36)))) : (({((8'hb2) ?
                               reg42 : reg31)} != ({reg41,
                           reg40} == $signed(wire82))) >>> ($signed(wire5) ?
                           wire5[(1'h0):(1'h0)] : reg27)));
  module43 #() modinst226 (.clk(clk), .y(wire225), .wire44(reg42), .wire46(wire0), .wire45(reg25), .wire47(reg23));
  module130 #() modinst228 (wire227, clk, wire3, wire5, reg34, reg26);
  assign wire229 = $signed($signed(((^(wire216 << wire224)) ?
                       ({(8'hb5), reg26} ?
                           (-wire1) : {(8'hb1),
                               (8'hb0)}) : reg36[(2'h2):(2'h2)])));
  assign wire230 = $signed(reg36[(3'h5):(3'h4)]);
  assign wire231 = (reg41[(2'h3):(1'h0)] ?
                       $unsigned((~|wire220)) : (((~((8'hbf) + wire87)) != (|(reg36 == wire88))) ?
                           wire227 : reg36[(3'h4):(1'h1)]));
endmodule

module module90
#(parameter param213 = (&((((~&(8'hb3)) ? ((8'hab) ? (8'hac) : (8'hb0)) : {(8'hb3)}) || (+((8'hbd) << (8'hb1)))) & ((7'h44) ? (((8'h9c) == (8'hb4)) ? ((8'hb7) >>> (8'hb2)) : {(8'hae)}) : ((^~(8'ha5)) ? ((8'hbb) ? (8'ha4) : (8'hbf)) : (8'hb1))))))
(y, clk, wire91, wire92, wire93, wire94);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire91;
  input wire signed [(5'h12):(1'h0)] wire92;
  input wire [(4'hd):(1'h0)] wire93;
  input wire signed [(4'hd):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire212;
  wire signed [(4'hd):(1'h0)] wire211;
  wire [(2'h2):(1'h0)] wire210;
  wire signed [(3'h4):(1'h0)] wire209;
  wire signed [(2'h2):(1'h0)] wire208;
  wire [(5'h14):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire165;
  wire signed [(3'h5):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire168;
  wire [(5'h11):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire200;
  reg signed [(5'h11):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg206 = (1'h0);
  reg [(4'hb):(1'h0)] reg205 = (1'h0);
  reg [(4'hb):(1'h0)] reg204 = (1'h0);
  reg [(3'h4):(1'h0)] reg203 = (1'h0);
  reg [(5'h14):(1'h0)] reg202 = (1'h0);
  assign y = {wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire95,
                 wire128,
                 wire165,
                 wire167,
                 wire168,
                 wire169,
                 wire200,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 (1'h0)};
  assign wire95 = wire93;
  module96 #() modinst129 (wire128, clk, wire95, wire94, wire91, wire92);
  module130 #() modinst166 (.clk(clk), .wire134(wire95), .wire132(wire93), .wire133(wire92), .y(wire165), .wire131(wire91));
  assign wire167 = $signed((8'h9d));
  assign wire168 = $unsigned($unsigned($signed($signed($signed(wire94)))));
  assign wire169 = wire165;
  module170 #() modinst201 (wire200, clk, wire128, wire91, wire95, wire169, wire168);
  always
    @(posedge clk) begin
      if ($signed(wire169[(4'hb):(3'h5)]))
        begin
          reg202 <= $signed(((wire92 ?
              ((|(8'haf)) ?
                  wire94[(1'h1):(1'h1)] : $unsigned((8'ha9))) : wire169[(3'h4):(1'h0)]) - $signed((wire169 >> $signed(wire128)))));
          reg203 <= $unsigned(($signed($unsigned($signed(wire165))) ?
              wire165[(1'h1):(1'h0)] : (~^wire91[(1'h1):(1'h0)])));
        end
      else
        begin
          if ($unsigned($unsigned(wire165)))
            begin
              reg202 <= (({($signed(wire95) | {wire168, wire95})} ?
                      wire167 : ($signed($unsigned(wire128)) > $signed((wire91 + (8'hb9))))) ?
                  $unsigned($unsigned((8'hbd))) : {$signed((wire94[(3'h5):(2'h2)] ?
                          (wire167 ? reg202 : reg203) : $unsigned(wire95)))});
              reg203 <= wire95[(4'hd):(4'h8)];
            end
          else
            begin
              reg202 <= ({($unsigned(wire92) <<< wire95),
                      $unsigned($signed($signed(wire93)))} ?
                  reg202 : $signed(($unsigned(reg203[(3'h4):(1'h1)]) ^~ reg202)));
              reg203 <= wire128[(2'h2):(1'h0)];
            end
          reg204 <= $signed(wire94[(4'ha):(4'ha)]);
          reg205 <= ({{((-wire93) || wire92),
                  ((|reg203) << (wire95 && reg203))}} ^~ $signed(($unsigned($signed(wire200)) ?
              ($signed((8'hbd)) && (~|reg202)) : ({wire200} >> reg202))));
        end
      reg206 <= ({{$signed(wire165[(3'h5):(1'h0)])},
          {((reg204 <<< wire94) ?
                  $unsigned(reg204) : (reg204 ? reg205 : wire128)),
              wire91[(4'hd):(2'h3)]}} >>> $unsigned(wire200));
      reg207 <= {($unsigned($unsigned({wire168,
              wire167})) <<< wire93[(4'h8):(4'h8)])};
    end
  assign wire208 = $unsigned((|(wire95[(4'hd):(3'h4)] ?
                       wire92[(5'h11):(2'h3)] : {reg207[(4'hb):(4'h8)],
                           $unsigned(reg207)})));
  assign wire209 = reg202;
  assign wire210 = wire209;
  assign wire211 = $unsigned(wire209);
  assign wire212 = (+(~$unsigned(wire128)));
endmodule

module module43
#(parameter param80 = (8'hba), 
parameter param81 = (((((param80 ? param80 : param80) || param80) ? (+(~|param80)) : (-(-(8'hb7)))) ? (((^~param80) != param80) ? (param80 ? {param80} : (~param80)) : (param80 ^ param80)) : (8'ha6)) && (8'hb8)))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire47;
  input wire signed [(5'h10):(1'h0)] wire46;
  input wire signed [(3'h4):(1'h0)] wire45;
  input wire [(3'h5):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire55,
                 wire54,
                 wire53,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= wire44[(2'h3):(2'h2)];
      if (($signed($unsigned((&$signed(wire47)))) == (((~&(wire44 || wire47)) > ((wire44 ?
                  wire46 : (8'ha6)) ?
              $signed(reg48) : (wire45 ^~ wire44))) ?
          wire45 : $unsigned(wire47[(2'h3):(1'h0)]))))
        begin
          reg49 <= (reg48[(1'h0):(1'h0)] || wire46[(4'hc):(4'ha)]);
        end
      else
        begin
          if (reg48[(4'ha):(1'h1)])
            begin
              reg49 <= {{$unsigned((8'ha0)), (~|wire45[(1'h0):(1'h0)])},
                  (8'h9f)};
              reg50 <= $signed($signed((^~$signed($signed((8'hb0))))));
            end
          else
            begin
              reg49 <= reg50;
              reg50 <= $signed(((^((wire47 & wire47) ?
                      $unsigned(reg50) : ((8'haf) ^ (8'hb3)))) ?
                  {wire47, (^~reg49)} : (-$signed($signed(wire46)))));
            end
        end
      reg51 <= ((((~|(wire47 && wire45)) == ((~wire45) ?
              wire44 : reg49)) <<< wire46[(2'h3):(2'h3)]) ?
          wire45[(1'h1):(1'h1)] : (((~&$signed(wire47)) ?
              (8'hb1) : (&$unsigned(wire45))) ~^ $unsigned((!reg49))));
      reg52 <= wire45;
    end
  assign wire53 = (|wire47);
  assign wire54 = wire45[(1'h1):(1'h1)];
  assign wire55 = ($signed((|(|{reg52}))) | reg49[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      if ((!$signed(($unsigned($signed(reg50)) ?
          (!$unsigned(wire54)) : $unsigned({wire55})))))
        begin
          if (reg49[(3'h6):(3'h4)])
            begin
              reg56 <= reg48;
            end
          else
            begin
              reg56 <= {(($signed(((8'hac) && reg56)) && (~&$unsigned(reg49))) || reg50[(1'h1):(1'h0)])};
            end
        end
      else
        begin
          if (wire44)
            begin
              reg56 <= $signed((|{wire54[(3'h6):(3'h6)], reg52}));
              reg57 <= (^~((((reg49 && wire55) < {(8'hbb)}) ?
                      wire47[(3'h7):(2'h2)] : wire46[(4'h9):(1'h1)]) ?
                  wire45 : wire46[(1'h0):(1'h0)]));
              reg58 <= reg49;
            end
          else
            begin
              reg56 <= reg50[(1'h1):(1'h0)];
              reg57 <= wire47;
              reg58 <= $signed((wire45 || ($signed((|wire44)) > ({reg56} + wire46[(3'h5):(3'h5)]))));
            end
          reg59 <= (~^(($signed((wire55 ? wire53 : wire55)) ?
                  (reg48[(4'h8):(1'h0)] ?
                      ((8'ha5) ^~ reg48) : $signed(reg51)) : wire45[(3'h4):(3'h4)]) ?
              reg48[(3'h7):(1'h0)] : reg51[(3'h7):(3'h7)]));
          reg60 <= $signed((&$signed(((reg56 ? (8'h9d) : reg57) ?
              $signed(reg58) : (8'hb6)))));
          if (($signed((reg57[(1'h1):(1'h0)] ?
              (^reg59) : (~^wire53[(5'h12):(4'hb)]))) < {(8'hb3)}))
            begin
              reg61 <= $signed($unsigned({$unsigned((wire53 ?
                      (8'hb7) : wire45))}));
              reg62 <= wire55[(1'h0):(1'h0)];
            end
          else
            begin
              reg61 <= (8'ha3);
              reg62 <= $signed((reg58 ?
                  $signed($unsigned((wire47 ?
                      wire53 : wire54))) : {$unsigned({reg62, reg61}),
                      (|reg57)}));
            end
        end
      reg63 <= wire46[(4'hc):(3'h7)];
    end
  assign wire64 = ((($signed((wire44 ?
                          wire45 : reg59)) ^ $signed(reg56[(2'h2):(1'h1)])) <<< ($signed((reg52 <= reg51)) ?
                          $signed($unsigned(wire47)) : wire46)) ?
                      reg60 : (8'hb0));
  assign wire65 = (reg56 >>> wire53[(4'h9):(3'h4)]);
  assign wire66 = $unsigned(($signed(($signed(wire55) ?
                      reg49[(3'h7):(3'h5)] : (reg50 ?
                          reg57 : reg51))) != reg48));
  assign wire67 = (|(~|{$signed((wire47 >>> (8'hb2))),
                      $unsigned((reg61 ? reg49 : wire65))}));
  assign wire68 = {$signed((wire45 ~^ reg62))};
  always
    @(posedge clk) begin
      if (((reg56 ? $signed(reg59[(2'h3):(2'h2)]) : reg50[(5'h12):(3'h7)]) ?
          ($unsigned(reg48[(4'hb):(1'h1)]) ^~ (wire47 ?
              reg62[(2'h2):(2'h2)] : wire54)) : wire65))
        begin
          reg69 <= ($signed({{$unsigned(wire55), (+reg59)},
              wire55[(3'h6):(2'h2)]}) >>> $unsigned((($signed((8'ha9)) ?
              ((8'hb3) <= reg50) : ((8'hb9) & wire46)) ^ ((reg61 >= reg58) ?
              (reg49 ? reg49 : reg63) : reg60[(2'h3):(1'h0)]))));
          reg70 <= {$signed((((wire44 | wire45) <= wire45[(3'h4):(1'h0)]) ?
                  (-(reg56 + reg61)) : ({(7'h42), wire45} ?
                      reg49[(3'h7):(2'h2)] : reg59[(1'h0):(1'h0)])))};
        end
      else
        begin
          reg69 <= ($signed({wire44[(2'h2):(1'h1)],
                  (reg58 ? (&wire66) : (!reg51))}) ?
              (^~reg56) : $signed(reg63));
        end
      reg71 <= reg70;
      reg72 <= $signed(wire53);
      reg73 <= ((^~(|reg51[(2'h2):(1'h0)])) ?
          $unsigned((^~((wire55 ? wire44 : (8'hbb)) ?
              {(8'hb5), reg49} : ((8'hb7) << wire46)))) : reg49[(4'h8):(3'h7)]);
      if ((|$signed($signed(((wire67 ?
          reg56 : reg48) + wire45[(1'h0):(1'h0)])))))
        begin
          if (reg50)
            begin
              reg74 <= $unsigned(wire67);
              reg75 <= (((($signed(reg70) && (reg72 >> reg50)) ?
                          $unsigned({reg49, reg58}) : (~$unsigned((8'h9f)))) ?
                      ($unsigned($signed(reg70)) ?
                          $unsigned((~&wire67)) : ((reg71 ?
                              wire67 : (8'hb1)) < reg73)) : $signed({((8'hb6) ?
                              reg74 : (8'hb3)),
                          (reg48 ? reg62 : reg50)})) ?
                  wire53 : ((($unsigned(wire68) + $signed(wire66)) <= ((8'hbd) << $unsigned(reg72))) ?
                      ((~&(+reg50)) ?
                          {(reg51 ? wire64 : reg63),
                              (~|reg72)} : $unsigned(reg72[(4'hd):(3'h7)])) : $unsigned({$signed(reg61)})));
              reg76 <= (8'ha5);
            end
          else
            begin
              reg74 <= reg56;
              reg75 <= $signed(((~&$signed(wire55[(2'h3):(1'h1)])) ?
                  (&$signed(reg57[(2'h3):(1'h1)])) : $signed({{reg60},
                      (wire64 ? reg49 : reg69)})));
              reg76 <= {{((+reg71) == wire68)},
                  (((^~(+(8'hae))) ? $unsigned($unsigned(reg48)) : reg48) ?
                      (|wire64) : wire68)};
              reg77 <= (((^((~reg60) ? (^~reg60) : (reg60 ? (8'hb3) : reg73))) ?
                      (~reg70[(2'h2):(2'h2)]) : (+{(reg75 ?
                              reg59 : (8'hbb))})) ?
                  (~&({reg73[(2'h3):(1'h0)]} << $unsigned($signed(wire47)))) : $signed($unsigned({reg63[(3'h4):(3'h4)],
                      (wire64 != reg48)})));
            end
          reg78 <= reg59[(2'h3):(2'h3)];
          reg79 <= $signed($signed(reg60));
        end
      else
        begin
          reg74 <= (|((!$signed(wire67[(2'h2):(2'h2)])) - (~$unsigned((&reg79)))));
          reg75 <= wire45[(2'h3):(1'h1)];
          reg76 <= wire64;
          reg77 <= $signed(reg72);
          reg78 <= wire66;
        end
    end
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  assign y = {wire18, wire17, wire16, wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = ((((wire9 ? (wire11 != wire10) : (wire9 << wire8)) ?
                          ((~^wire10) ?
                              {wire10,
                                  wire10} : $signed(wire9)) : ($signed(wire9) ?
                              (&wire7) : (^wire9))) ?
                      (+{$unsigned(wire9), wire7[(1'h1):(1'h0)]}) : (wire7 ?
                          $unsigned($unsigned(wire9)) : $unsigned($signed(wire8)))) >>> (wire7 <<< wire9[(2'h2):(2'h2)]));
  assign wire13 = (~{$unsigned((~^wire10)),
                      ($unsigned(wire7[(1'h0):(1'h0)]) - $unsigned(wire11[(2'h2):(2'h2)]))});
  assign wire14 = wire9[(3'h6):(3'h4)];
  assign wire15 = wire13[(3'h5):(3'h4)];
  assign wire16 = (-({wire9,
                          (((8'hbd) ? wire7 : wire12) ?
                              {wire14} : (wire10 ? (8'ha0) : wire10))} ?
                      wire8[(1'h0):(1'h0)] : wire10));
  assign wire17 = ($signed(({(wire7 ~^ wire16), (8'hb0)} ?
                          (~^(7'h40)) : ({wire7, wire9} == ((7'h44) ?
                              wire15 : wire13)))) ?
                      ((8'hbf) >> (7'h44)) : (-(-((&wire14) ?
                          wire16 : (wire11 <<< wire15)))));
  assign wire18 = $unsigned(wire8[(2'h3):(2'h2)]);
endmodule

module module170
#(parameter param198 = (|(((((8'hb9) > (8'hbb)) ? ((8'hae) ? (8'hab) : (8'ha6)) : (^~(8'hb8))) != (~|((8'hb3) ? (8'hb4) : (8'hac)))) > ((&((8'hb0) ? (8'h9c) : (8'hb8))) ? ((~^(8'ha7)) - (8'haa)) : (((8'hb6) ^~ (8'hb6)) ? {(8'h9e), (8'hbd)} : ((8'hbe) <<< (8'h9e)))))), 
parameter param199 = ({((~|param198) ? (~&(param198 == param198)) : {{(8'hbb)}, (|(8'ha3))})} >> (((param198 ? (~^param198) : param198) <= param198) << ((^~(param198 ? param198 : param198)) << param198))))
(y, clk, wire175, wire174, wire173, wire172, wire171);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire175;
  input wire [(4'hb):(1'h0)] wire174;
  input wire signed [(4'hd):(1'h0)] wire173;
  input wire signed [(5'h11):(1'h0)] wire172;
  input wire [(3'h7):(1'h0)] wire171;
  wire signed [(4'hb):(1'h0)] wire197;
  wire [(4'hf):(1'h0)] wire196;
  wire signed [(4'h8):(1'h0)] wire195;
  wire signed [(4'h9):(1'h0)] wire194;
  wire signed [(3'h7):(1'h0)] wire193;
  wire [(4'h9):(1'h0)] wire189;
  wire [(3'h4):(1'h0)] wire188;
  wire [(2'h3):(1'h0)] wire187;
  wire signed [(3'h4):(1'h0)] wire186;
  wire [(4'he):(1'h0)] wire182;
  wire [(4'hb):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire180;
  wire [(5'h15):(1'h0)] wire179;
  wire [(2'h3):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire177;
  wire signed [(3'h6):(1'h0)] wire176;
  reg signed [(4'h9):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg191 = (1'h0);
  reg [(5'h14):(1'h0)] reg190 = (1'h0);
  reg [(5'h15):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg183 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 reg192,
                 reg191,
                 reg190,
                 reg185,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire176 = (wire174[(3'h5):(2'h3)] ?
                       ((|(8'ha0)) ?
                           $signed($signed($unsigned(wire173))) : wire172[(3'h4):(2'h3)]) : $unsigned($signed($signed(wire175))));
  assign wire177 = (^~($signed((8'ha3)) ~^ wire175));
  assign wire178 = $signed(wire177);
  assign wire179 = wire176;
  assign wire180 = (^$unsigned(($signed(wire177) ?
                       (+wire171) : $signed($signed(wire173)))));
  assign wire181 = $signed($unsigned($unsigned(wire171)));
  assign wire182 = {wire176[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      reg183 <= wire180[(4'hc):(3'h7)];
      reg184 <= (($signed(((^(8'ha2)) ?
          $signed(wire176) : (wire175 >>> wire172))) ~^ $signed($unsigned($unsigned((8'hbd))))) * wire179[(5'h11):(4'h9)]);
      reg185 <= ((wire182[(3'h4):(1'h1)] ?
          ({reg183[(1'h0):(1'h0)], $unsigned(wire178)} ?
              wire181 : {(~^wire180)}) : $signed(wire175[(2'h2):(1'h0)])) << $unsigned(wire178));
    end
  assign wire186 = (~{($unsigned((wire171 >>> reg183)) <= ({wire177, wire177} ?
                           (~|reg183) : (wire173 >= wire171)))});
  assign wire187 = (!wire174);
  assign wire188 = ((^{(~&$unsigned(wire187)), {wire186[(2'h2):(1'h0)]}}) ?
                       (|wire174) : ((8'hbe) ?
                           (reg183 <= ((wire172 ?
                               wire175 : reg183) >>> (!wire176))) : reg185));
  assign wire189 = $unsigned($signed(wire188));
  always
    @(posedge clk) begin
      if (wire177)
        begin
          reg190 <= ((!((wire175[(1'h1):(1'h1)] ?
                  (wire172 ?
                      wire173 : wire171) : (&reg183)) != $unsigned({wire173,
                  (8'hac)}))) ?
              (!wire186[(3'h4):(3'h4)]) : {((8'ha1) ?
                      $signed(wire173[(4'hb):(1'h1)]) : ($unsigned(wire178) ?
                          wire177 : $unsigned(wire187)))});
          reg191 <= (wire173 >>> wire178);
          reg192 <= $signed($unsigned((wire175 <<< $unsigned($signed(reg185)))));
        end
      else
        begin
          reg190 <= $signed((wire188[(1'h0):(1'h0)] ^~ ($unsigned(((8'hb7) ^ reg192)) ?
              (^(wire179 <<< wire175)) : (^(reg183 == reg184)))));
        end
    end
  assign wire193 = (wire172[(4'ha):(1'h1)] ?
                       $unsigned(((wire175[(3'h4):(2'h3)] <<< $signed((8'hb5))) | $unsigned((wire177 && reg190)))) : reg184);
  assign wire194 = $signed(($unsigned($unsigned(reg185)) ?
                       reg184 : (~&$signed((~&wire189)))));
  assign wire195 = wire186;
  assign wire196 = (($signed($signed((~wire174))) - (((wire176 ?
                           wire179 : (8'hb6)) <<< (+wire174)) ?
                       (&(wire176 != (8'hb0))) : reg192[(1'h1):(1'h0)])) << {(!(~(&wire182))),
                       {$unsigned($signed(wire175)), wire178}});
  assign wire197 = (!(8'haf));
endmodule

module module130
#(parameter param164 = (-{((!((8'hb8) ? (8'hb2) : (8'ha5))) ? (|((8'haa) ? (8'h9f) : (8'h9f))) : (((8'hae) == (8'hae)) ? ((8'ha9) ? (7'h44) : (8'hb7)) : (+(8'hb6)))), ((^~((8'ha2) ? (7'h43) : (8'ha2))) ? ((&(7'h42)) ~^ ((8'hbf) ? (8'h9d) : (8'hbb))) : ({(8'ha1)} | ((8'ha4) >= (8'ha7))))}))
(y, clk, wire134, wire133, wire132, wire131);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire134;
  input wire [(5'h12):(1'h0)] wire133;
  input wire signed [(4'hd):(1'h0)] wire132;
  input wire signed [(4'he):(1'h0)] wire131;
  wire [(4'hf):(1'h0)] wire150;
  wire signed [(4'he):(1'h0)] wire149;
  wire signed [(2'h2):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire signed [(5'h11):(1'h0)] wire141;
  wire [(2'h3):(1'h0)] wire140;
  wire [(3'h5):(1'h0)] wire139;
  wire [(5'h11):(1'h0)] wire138;
  wire signed [(4'h9):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire135;
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(4'hd):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
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
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire135 = $signed((^~wire134[(4'he):(2'h3)]));
  assign wire136 = $signed((&(({wire134} ? wire132 : $unsigned(wire134)) ?
                       wire131 : (wire133[(4'hd):(4'h9)] ?
                           {wire133} : (wire134 < wire133)))));
  assign wire137 = ($signed(($unsigned((^wire136)) ~^ wire135)) + (($signed(wire132) >>> wire135) > (~$signed((wire136 != wire131)))));
  assign wire138 = ({$signed((wire136[(1'h1):(1'h1)] ?
                           wire131[(3'h7):(3'h4)] : {wire132,
                               wire133}))} >> $signed((wire136 && {wire131,
                       $unsigned(wire132)})));
  assign wire139 = $unsigned((!$unsigned($signed($signed(wire136)))));
  assign wire140 = wire134[(2'h3):(2'h3)];
  assign wire141 = $unsigned(wire136);
  assign wire142 = {$signed(wire136[(4'hf):(1'h0)])};
  assign wire143 = $signed(wire137[(1'h1):(1'h1)]);
  assign wire144 = (wire135[(4'hc):(4'hc)] ?
                       ((|wire131) > wire136) : {wire133[(3'h7):(1'h1)]});
  always
    @(posedge clk) begin
      reg145 <= ($signed((({wire142} ? $unsigned(wire131) : wire140) ?
              $unsigned($unsigned(wire133)) : (wire137 ?
                  $signed((8'ha2)) : (wire140 ? wire143 : wire144)))) ?
          ((^$unsigned($signed((7'h42)))) ?
              wire135[(3'h4):(2'h2)] : $signed(($signed(wire138) + $signed(wire141)))) : $unsigned(wire136[(2'h2):(1'h0)]));
      reg146 <= ((wire136[(4'he):(1'h0)] ?
              $unsigned($signed($signed(wire139))) : ($unsigned($unsigned(wire132)) >> wire133[(4'he):(1'h0)])) ?
          wire134 : $unsigned(reg145));
      reg147 <= (($unsigned(((reg145 ? wire137 : wire141) ?
          (wire137 ?
              wire144 : wire138) : $signed((8'hb9)))) != $signed($signed($unsigned((8'had))))) << (~&(~&$unsigned((wire141 * wire142)))));
      reg148 <= $unsigned(($signed(((reg146 <<< reg147) ?
          {wire143, wire144} : wire139[(3'h5):(3'h4)])) <<< $signed(({wire131,
          wire142} || wire139[(3'h4):(2'h3)]))));
    end
  assign wire149 = $signed(wire136);
  assign wire150 = $signed(reg147[(5'h11):(5'h11)]);
  always
    @(posedge clk) begin
      if ({wire143,
          $signed((wire138 ?
              wire131[(2'h2):(1'h0)] : ($unsigned(wire131) ?
                  $signed(wire139) : wire133[(3'h6):(2'h3)])))})
        begin
          if (wire139[(1'h0):(1'h0)])
            begin
              reg151 <= $unsigned(wire150[(4'he):(2'h3)]);
              reg152 <= (^($signed($unsigned((wire142 ?
                  wire149 : wire150))) | $unsigned($unsigned($signed(wire138)))));
              reg153 <= (wire141 ?
                  ((|$signed((~^wire141))) && $unsigned(reg148[(4'h8):(2'h3)])) : reg146[(4'hb):(4'h8)]);
            end
          else
            begin
              reg151 <= $unsigned((-wire140[(1'h1):(1'h1)]));
            end
          reg154 <= ({$unsigned($signed(wire135[(2'h3):(2'h3)])), (8'h9d)} ?
              $unsigned($unsigned(reg146[(4'ha):(3'h4)])) : reg147);
          reg155 <= $unsigned((7'h42));
        end
      else
        begin
          reg151 <= $unsigned((reg145[(5'h14):(4'h9)] >= (~|(!$unsigned((8'hab))))));
          reg152 <= wire144[(2'h2):(1'h1)];
          if ((wire135 ? wire150 : {$signed($signed($signed((8'haa))))}))
            begin
              reg153 <= $unsigned(((reg147[(3'h7):(3'h7)] ?
                      $unsigned({wire149}) : wire136[(3'h4):(2'h2)]) ?
                  (8'hab) : ((wire133 > (reg147 <<< reg155)) + wire131)));
              reg154 <= ((~&((wire134 ?
                  (wire142 ^ wire141) : (+(7'h40))) << (((8'hb3) >>> (8'ha9)) ?
                  (&reg145) : (wire135 ?
                      reg154 : wire135)))) || $unsigned(reg153[(4'hc):(4'h8)]));
            end
          else
            begin
              reg153 <= (reg154 ? reg154 : reg155);
            end
          if (wire134[(2'h3):(2'h2)])
            begin
              reg155 <= (~|{(wire136 ^~ $unsigned((reg154 << reg154)))});
            end
          else
            begin
              reg155 <= $unsigned($unsigned(reg145));
              reg156 <= {{wire133[(3'h5):(2'h3)], (!{(reg145 - reg152)})}};
              reg157 <= wire137[(3'h4):(1'h1)];
            end
          reg158 <= ($signed((~&((8'ha5) - (~^wire141)))) && (((+$unsigned(reg157)) ?
                  ((reg157 ? wire143 : (8'ha9)) ^~ {wire137,
                      reg151}) : (&(wire134 ? reg146 : wire140))) ?
              ($unsigned($signed(reg145)) ?
                  ((reg157 ^ reg152) ^~ (wire141 | reg151)) : ((&wire150) >> (-wire134))) : reg148[(1'h0):(1'h0)]));
        end
      reg159 <= reg146[(4'hc):(4'hb)];
      if ({$unsigned(wire136)})
        begin
          reg160 <= reg152;
          reg161 <= wire135[(5'h13):(3'h5)];
          reg162 <= (^~(!reg158));
        end
      else
        begin
          reg160 <= $signed(((((&wire134) ?
                  reg156[(1'h0):(1'h0)] : reg152) && $signed(wire135[(1'h0):(1'h0)])) ?
              {$unsigned(reg152)} : reg154[(3'h5):(3'h5)]));
        end
      reg163 <= (wire140 ?
          $signed($signed(($signed((7'h42)) ?
              (reg162 ?
                  wire140 : wire143) : $unsigned((8'ha2))))) : $signed(reg147));
    end
endmodule

module module96  (y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire100;
  input wire signed [(4'hd):(1'h0)] wire99;
  input wire [(4'hb):(1'h0)] wire98;
  input wire signed [(4'h8):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire127;
  wire [(5'h15):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire123;
  wire [(4'he):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire101;
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire124,
                 wire123,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire107,
                 wire106,
                 wire105,
                 wire101,
                 reg125,
                 reg122,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire101 = wire97;
  always
    @(posedge clk) begin
      reg102 <= (((!wire99) >= $unsigned($signed($signed(wire100)))) * ($unsigned({$unsigned(wire100),
          $unsigned(wire98)}) < $signed(({(8'hba)} ?
          $signed(wire97) : $signed(wire98)))));
      reg103 <= wire97;
      reg104 <= reg102;
    end
  assign wire105 = reg103[(2'h2):(1'h1)];
  assign wire106 = $signed((($signed($signed(wire97)) ?
                           (|wire101[(4'h8):(1'h0)]) : (wire100[(5'h13):(5'h12)] ^~ wire100)) ?
                       wire101[(3'h7):(1'h0)] : ($signed(wire99) > {$signed((8'ha4))})));
  assign wire107 = ($signed((reg102[(3'h5):(1'h1)] ?
                           wire101[(1'h0):(1'h0)] : wire97[(1'h0):(1'h0)])) ?
                       $signed(reg102) : $unsigned(($unsigned($unsigned(reg103)) ?
                           (^~reg104[(3'h4):(2'h2)]) : ($signed(wire106) ?
                               (~^reg103) : ((8'ha3) ? wire100 : wire99)))));
  always
    @(posedge clk) begin
      reg108 <= (!$signed((-wire107[(4'ha):(1'h0)])));
      if (((~&$unsigned($signed(reg108[(4'hb):(4'h9)]))) ?
          (^{(&(wire100 >= wire105)), reg104}) : $signed((8'h9e))))
        begin
          reg109 <= {($unsigned((reg108 >> wire100)) < (^reg108))};
        end
      else
        begin
          reg109 <= (((!({wire100} ?
                      $unsigned(wire100) : (wire101 ? reg103 : wire106))) ?
                  $signed(((~wire97) >= ((8'hb3) ?
                      reg109 : wire106))) : $signed(wire105)) ?
              reg109 : ($signed({(!wire105)}) ?
                  (wire105[(2'h3):(2'h2)] ?
                      wire97[(3'h6):(2'h3)] : (!$unsigned(reg108))) : wire106));
          reg110 <= wire98[(4'h8):(2'h2)];
          if ($unsigned($signed(reg104)))
            begin
              reg111 <= ($signed($unsigned(reg110[(4'hd):(4'h8)])) ?
                  $unsigned(reg102) : wire97);
              reg112 <= (reg104[(4'hb):(3'h7)] ?
                  wire98 : (reg102[(4'h9):(2'h2)] ?
                      {$signed((reg103 ? reg102 : reg104)),
                          (wire100[(3'h5):(1'h1)] == (^~reg108))} : (reg108 > (~|(reg108 ?
                          wire99 : wire97)))));
              reg113 <= (reg109 <= $unsigned(reg103[(2'h2):(2'h2)]));
              reg114 <= wire107;
              reg115 <= ((~{$unsigned((wire101 ? reg111 : reg111)),
                      {wire100[(4'hb):(3'h4)]}}) ?
                  reg104 : (!wire100));
            end
          else
            begin
              reg111 <= {(~|{wire105, (~$unsigned((8'hae)))}),
                  (|reg104[(4'ha):(3'h5)])};
              reg112 <= wire99;
              reg113 <= wire97[(3'h5):(3'h5)];
              reg114 <= {$unsigned(($signed(wire107[(3'h6):(1'h0)]) != (reg102 ?
                      $unsigned(wire101) : (~|reg103)))),
                  {(($unsigned(reg112) ?
                          reg108[(5'h10):(2'h3)] : reg104[(1'h0):(1'h0)]) + $unsigned(reg115[(4'h8):(3'h4)])),
                      $signed($unsigned(((8'hbd) + reg104)))}};
              reg115 <= ({($unsigned((reg111 ? wire101 : reg104)) ?
                          (~wire107[(1'h1):(1'h1)]) : (^~(wire107 ?
                              reg111 : reg110))),
                      $unsigned(((wire97 <= wire98) | (~wire105)))} ?
                  ((reg110[(3'h4):(2'h3)] != $unsigned((reg110 - reg103))) ?
                      $unsigned(((|wire105) - reg111[(3'h6):(1'h0)])) : ({(8'ha7)} ?
                          (reg110[(4'h9):(3'h6)] ?
                              (+reg109) : $signed(reg103)) : reg104[(3'h4):(2'h3)])) : (~&{wire97[(1'h1):(1'h1)]}));
            end
        end
      reg116 <= $signed((7'h41));
    end
  assign wire117 = (~|(~^(~^reg113)));
  assign wire118 = reg102;
  assign wire119 = $signed($signed($signed(wire117)));
  assign wire120 = wire119;
  assign wire121 = $unsigned(reg102[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg122 <= (~^({wire120[(3'h7):(1'h1)], wire100} ?
          ($signed(reg109[(1'h1):(1'h1)]) != wire97[(1'h0):(1'h0)]) : (^~($signed(reg108) ?
              (wire99 << reg103) : $signed(reg108)))));
    end
  assign wire123 = wire99[(2'h3):(2'h3)];
  assign wire124 = ($unsigned(reg104) || {(reg113[(3'h6):(1'h1)] & reg113[(3'h5):(3'h4)]),
                       wire98[(3'h5):(3'h5)]});
  always
    @(posedge clk) begin
      reg125 <= (&(wire105 || {{(wire98 || wire123), $signed(wire98)}}));
    end
  assign wire126 = ((wire124[(3'h6):(2'h3)] ?
                       reg112[(3'h4):(1'h0)] : $signed({(-wire101),
                           $unsigned(wire120)})) || $unsigned(wire101[(1'h0):(1'h0)]));
  assign wire127 = ((+$unsigned(wire126)) ?
                       reg102 : $unsigned($signed(reg102)));
endmodule
