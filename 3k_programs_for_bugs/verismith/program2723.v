module top
#(parameter param158 = (({{{(7'h44)}}, (((8'hb5) ? (8'h9e) : (8'h9e)) ? ((8'h9e) ? (8'hac) : (8'hb0)) : (-(8'ha5)))} - ((7'h44) != (-(~(7'h41))))) ? (8'h9f) : {((8'hac) ? (((8'hbf) && (7'h44)) >= ((8'hb8) == (8'hb6))) : {{(8'h9d)}}), (~|{(+(8'ha2))})}), 
parameter param159 = {(~param158)})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire157;
  wire signed [(4'hd):(1'h0)] wire156;
  wire signed [(3'h5):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire154;
  wire signed [(2'h3):(1'h0)] wire153;
  wire signed [(3'h5):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire150;
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire54,
                 wire6,
                 wire5,
                 wire56,
                 wire57,
                 wire58,
                 wire63,
                 wire150,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire5 = (~^({wire4, (wire4[(1'h1):(1'h0)] * (^~wire2))} - (&((wire4 ?
                     wire0 : wire2) ^ (wire4 ? wire4 : wire2)))));
  assign wire6 = $unsigned((((wire4 ? {(8'hb9)} : (wire2 << wire1)) - wire0) ?
                     $signed($signed((wire4 <<< wire0))) : $unsigned({{(8'ha2),
                             wire1}})));
  module7 #() modinst55 (.wire10(wire2), .wire9(wire6), .wire11(wire1), .y(wire54), .clk(clk), .wire8(wire0), .wire12(wire5));
  assign wire56 = (~|(~^(wire2[(5'h10):(1'h1)] + wire3[(4'h8):(3'h6)])));
  assign wire57 = $signed($signed($unsigned({(wire54 ? wire54 : wire0),
                      (wire5 ? wire0 : wire54)})));
  assign wire58 = $unsigned((&(8'hab)));
  always
    @(posedge clk) begin
      reg59 <= wire4;
      reg60 <= $signed((wire1[(3'h6):(3'h6)] ~^ $unsigned({(|wire3),
          $signed((8'ha5))})));
      reg61 <= (8'ha3);
      reg62 <= reg59;
    end
  assign wire63 = wire56[(4'hf):(1'h1)];
  module64 #() modinst151 (.wire69(wire63), .wire68(reg60), .wire65(reg61), .wire66(wire54), .clk(clk), .wire67(wire6), .y(wire150));
  assign wire152 = ((wire54 * wire5) <= ((($signed(wire56) == $signed(wire57)) > ((^wire58) << wire6)) == $signed($signed($signed((8'h9f))))));
  assign wire153 = $signed($unsigned(wire0[(4'h8):(1'h1)]));
  assign wire154 = {(-{wire150})};
  assign wire155 = (wire57 ? (8'hba) : wire152[(1'h0):(1'h0)]);
  assign wire156 = wire5[(1'h1):(1'h1)];
  assign wire157 = (wire57 != (|wire5));
endmodule

module module64
#(parameter param148 = (((~&(((8'h9c) <<< (8'hb4)) ? (8'ha7) : ((8'ha7) ? (8'ha3) : (8'ha0)))) ? ((((7'h43) & (8'hab)) ? {(8'ha2)} : ((8'hb7) ? (8'hbc) : (8'h9e))) >= (&((8'hb1) >>> (8'haf)))) : (~^{(~(8'ha7)), (8'ha7)})) ? (~|((((8'ha7) ? (8'hbd) : (8'hb2)) ? {(7'h41)} : {(7'h43)}) ? (((8'hb8) > (8'hb4)) ? {(8'h9c)} : ((8'h9e) ? (8'hb3) : (8'ha0))) : (((8'ha3) < (7'h44)) >= (^(8'h9e))))) : ((|(^~(!(8'ha9)))) != (8'ha2))), 
parameter param149 = (param148 ^ (8'haa)))
(y, clk, wire65, wire66, wire67, wire68, wire69);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire66;
  input wire [(4'hf):(1'h0)] wire67;
  input wire signed [(5'h12):(1'h0)] wire68;
  input wire [(4'hd):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire146;
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  assign y = {wire70,
                 wire90,
                 wire92,
                 wire93,
                 wire146,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 (1'h0)};
  assign wire70 = (~&(^~(~&wire69)));
  module71 #() modinst91 (wire90, clk, wire67, wire65, wire68, wire70);
  assign wire92 = {wire66};
  assign wire93 = $unsigned($signed((wire69[(2'h3):(2'h3)] ?
                      ($signed(wire67) ?
                          (wire65 >>> wire65) : (!(8'h9c))) : $signed((8'hb1)))));
  always
    @(posedge clk) begin
      reg94 <= (({($unsigned(wire65) < {wire68, wire67})} ?
          {wire90,
              wire68[(5'h11):(3'h5)]} : (wire67[(3'h6):(2'h3)] && ((8'ha7) ^ $unsigned((8'hb8))))) | (wire68 ?
          (~^$unsigned(((7'h40) ~^ wire70))) : $unsigned(wire65)));
      reg95 <= {{(wire69[(4'hb):(4'h9)] ^ (8'hb1)),
              ((wire65 <<< $unsigned((8'ha6))) <<< wire65)}};
      reg96 <= ((!$signed((~$signed(wire92)))) * wire69[(2'h3):(1'h0)]);
      reg97 <= ({$unsigned({wire67[(3'h7):(1'h1)], (~&wire66)}),
              (({wire68} >= wire70) ?
                  wire70[(5'h11):(3'h5)] : (!(wire67 <= (8'hb1))))} ?
          {wire93[(3'h5):(3'h4)]} : (|$unsigned(reg96[(1'h1):(1'h0)])));
      reg98 <= (({wire66,
              (wire68[(4'hc):(4'ha)] ?
                  $unsigned((8'h9e)) : wire67[(3'h5):(2'h3)])} ?
          (~|(~^$unsigned(wire70))) : wire67) ~^ reg97);
    end
  module99 #() modinst147 (.wire101(wire65), .clk(clk), .wire100(wire67), .wire103(reg98), .wire102(wire90), .y(wire146));
endmodule

module module7
#(parameter param52 = {(~&((^~(^(8'ha5))) * (((8'ha7) <= (8'hab)) ? (!(8'hb1)) : ((8'had) ~^ (8'ha4)))))}, 
parameter param53 = (((|param52) * (^~((param52 * param52) ? param52 : (~^param52)))) ? ((|(-(param52 << param52))) || (^param52)) : (~(^param52))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  assign y = {wire18,
                 wire17,
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
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= (wire10 ?
          (~(($unsigned(wire8) ? (wire10 ? wire12 : (8'haf)) : {wire11}) ?
              ((wire9 || wire11) >>> (!wire11)) : wire9)) : ((~^((wire9 ?
                  wire11 : wire9) == ((7'h40) | wire9))) ?
              ($unsigned(((8'hb9) <<< wire12)) ?
                  (~|wire11[(2'h2):(1'h1)]) : wire10[(4'hd):(4'hc)]) : wire9[(4'h9):(2'h3)]));
      reg14 <= (-reg13[(2'h2):(1'h1)]);
      reg15 <= ((reg13[(2'h2):(1'h0)] ?
              $signed($signed((wire10 && wire10))) : $signed((((8'ha1) ?
                  wire10 : wire9) + (!(8'ha5))))) ?
          (+wire10[(4'ha):(3'h7)]) : wire8[(4'h8):(4'h8)]);
      reg16 <= (~|$unsigned($signed(wire11[(2'h2):(2'h2)])));
    end
  assign wire17 = (~^$unsigned(({(wire12 ? wire12 : wire10),
                      (&reg13)} <<< (-(reg15 <= wire9)))));
  assign wire18 = (~^(~|$signed(wire11)));
  always
    @(posedge clk) begin
      reg19 <= wire8[(4'hf):(4'he)];
      reg20 <= (reg13 ? (-{wire8[(4'h9):(3'h5)]}) : {wire9});
      if ((~^((((wire9 >> reg16) << wire18) ?
          $signed((~reg14)) : (~{wire18, (8'hbb)})) <<< (!wire8))))
        begin
          reg21 <= $signed(wire12);
        end
      else
        begin
          reg21 <= wire10[(3'h6):(1'h0)];
        end
      if (((($unsigned($signed(reg20)) ?
          (-$unsigned(wire17)) : (8'hab)) && $unsigned($signed(reg20))) & reg21[(3'h5):(2'h3)]))
        begin
          reg22 <= wire18;
          reg23 <= wire9[(3'h5):(1'h1)];
          reg24 <= (wire18[(3'h5):(2'h3)] >> $signed(wire12[(3'h5):(1'h1)]));
          if ((wire17[(1'h0):(1'h0)] | ((wire11 == $unsigned($signed((8'hb2)))) - $unsigned($signed((^~reg13))))))
            begin
              reg25 <= ((&wire12) <<< (+$signed((8'hb2))));
              reg26 <= (|wire11);
              reg27 <= ((wire12 ^~ reg25[(4'ha):(1'h1)]) && ($signed(($signed((8'h9c)) ?
                  ((8'haf) ^ reg26) : (8'hb1))) & reg26[(4'hb):(2'h3)]));
            end
          else
            begin
              reg25 <= ((^~(+$signed(wire10))) * reg13);
              reg26 <= (($signed((wire18 * (reg14 ? wire12 : reg15))) ?
                  $unsigned(wire18) : ({(reg26 ?
                          wire12 : wire10)} ^ $signed(reg26[(5'h12):(2'h2)]))) * (^wire10[(4'he):(2'h2)]));
            end
          reg28 <= (&reg22);
        end
      else
        begin
          reg22 <= $signed((reg19 || (8'ha4)));
        end
      if ($unsigned($unsigned($signed({(wire11 ^~ (8'h9f))}))))
        begin
          if (((($unsigned((wire8 & reg27)) ?
                  reg26 : ($unsigned(reg14) ~^ reg20[(4'he):(4'hc)])) | {reg19}) ?
              $unsigned($signed(($unsigned(wire18) ?
                  wire8 : (wire10 ^ wire10)))) : $unsigned((|(^~(wire9 < reg28))))))
            begin
              reg29 <= reg21;
            end
          else
            begin
              reg29 <= (&(reg23[(1'h1):(1'h0)] && $signed($unsigned((^~wire11)))));
              reg30 <= ($unsigned($signed($unsigned($unsigned(reg14)))) ?
                  $unsigned(reg27[(3'h5):(2'h2)]) : ((((wire12 ^ reg13) + wire18[(1'h1):(1'h0)]) && $unsigned(reg28[(2'h3):(2'h3)])) ^ ($unsigned(reg14[(4'h8):(2'h2)]) | (+(8'hbc)))));
              reg31 <= $signed($unsigned(reg20[(5'h11):(4'ha)]));
            end
        end
      else
        begin
          reg29 <= (((^({reg26} ? (reg22 ~^ wire8) : ((8'had) || reg19))) ?
                  (wire9[(4'hf):(1'h1)] > reg15) : (&$signed($unsigned(reg23)))) ?
              ((reg24[(2'h2):(1'h0)] == $signed(reg27[(3'h6):(2'h2)])) - (reg27[(3'h5):(1'h0)] * reg22)) : (+($unsigned($signed(wire12)) < {(wire17 >= reg27)})));
        end
    end
  always
    @(posedge clk) begin
      if (wire18[(4'hc):(1'h1)])
        begin
          reg32 <= ($unsigned($unsigned((+(reg25 - reg20)))) ?
              reg24[(1'h0):(1'h0)] : (~&(($unsigned(reg19) * (~|reg26)) ^ (~$unsigned(reg22)))));
        end
      else
        begin
          reg32 <= $unsigned($signed((~^($signed(wire11) ?
              $signed(reg25) : wire18[(4'h8):(3'h7)]))));
          reg33 <= wire9[(3'h4):(1'h1)];
          reg34 <= (~reg27[(2'h3):(1'h1)]);
          if (reg21)
            begin
              reg35 <= (+wire12[(2'h2):(1'h1)]);
              reg36 <= reg16[(3'h7):(3'h4)];
            end
          else
            begin
              reg35 <= reg26[(4'ha):(3'h6)];
              reg36 <= {$unsigned(reg33), {wire10}};
              reg37 <= $signed(reg24[(4'hb):(4'hb)]);
              reg38 <= ($unsigned($unsigned($signed(reg14[(4'h8):(4'h8)]))) | ((reg36[(3'h5):(3'h5)] ?
                      ((reg34 ? reg24 : (8'ha9)) == (~^reg15)) : reg33) ?
                  (~^($signed((8'haa)) || {reg21,
                      reg25})) : (wire12[(2'h2):(1'h1)] ?
                      $signed((reg35 ? reg20 : wire9)) : {$unsigned(wire11),
                          (^~(7'h41))})));
              reg39 <= wire11;
            end
        end
      if ({(reg27 ?
              ({(reg21 ? reg19 : reg24)} ?
                  reg34[(2'h2):(2'h2)] : ($unsigned(reg25) && $signed(reg33))) : $unsigned(({wire12} - $unsigned(reg28))))})
        begin
          reg40 <= (^~reg35[(4'hc):(4'h8)]);
          if ($unsigned((reg34 ?
              ((reg28 ? (8'hb8) : $unsigned(reg27)) ?
                  (!$signed(reg21)) : reg30) : (reg27 ?
                  (wire17[(1'h0):(1'h0)] & (reg38 ?
                      wire11 : reg21)) : (reg34[(3'h4):(1'h1)] < (~reg39))))))
            begin
              reg41 <= reg40;
              reg42 <= reg19;
              reg43 <= (8'hae);
              reg44 <= (^~{(~reg25), $signed(reg43[(3'h6):(3'h6)])});
            end
          else
            begin
              reg41 <= {$signed($unsigned(($signed(reg42) < reg30[(4'h8):(3'h4)])))};
              reg42 <= $unsigned((reg34 ?
                  $unsigned(reg43) : $signed($unsigned(wire12[(4'hb):(1'h0)]))));
            end
          reg45 <= {($signed($unsigned((^~reg37))) < wire10), wire8};
          reg46 <= (!{reg25[(4'he):(4'hb)]});
        end
      else
        begin
          reg40 <= $signed((((~|{reg34, reg42}) > (!{reg22,
              (8'hb6)})) | reg32));
          reg41 <= ($signed($unsigned((reg41 ?
              $signed(wire17) : reg37[(1'h0):(1'h0)]))) ^ (|{$unsigned($signed(reg19)),
              reg39}));
          reg42 <= {((reg31 == reg23) && $unsigned(((reg33 >>> reg44) << (~&reg29)))),
              reg13[(1'h0):(1'h0)]};
          if (((((reg35[(1'h0):(1'h0)] ^~ reg41) ?
              reg21 : $signed(((8'hb1) <= reg40))) >= ($signed(wire17[(4'hc):(1'h0)]) ?
              (reg31 ?
                  {(8'hbe)} : (reg14 ?
                      (8'hb1) : reg27)) : reg23)) && ({(~(reg42 - reg26)),
              reg22[(3'h7):(3'h6)]} ^ $signed($signed((reg37 ?
              (8'hbd) : reg16))))))
            begin
              reg43 <= ({(wire11[(2'h2):(1'h0)] - reg25[(4'ha):(2'h3)])} > (|(^((wire17 ?
                      reg24 : reg23) ?
                  ((8'hb9) < reg21) : $unsigned(reg32)))));
              reg44 <= reg22;
            end
          else
            begin
              reg43 <= wire17;
              reg44 <= reg44;
              reg45 <= $signed((~^$unsigned((+{wire12, reg43}))));
            end
          if (((|reg46[(4'ha):(3'h4)]) < $unsigned(wire12[(4'hb):(3'h5)])))
            begin
              reg46 <= reg39;
            end
          else
            begin
              reg46 <= $signed(((~|(reg37 <= {reg45, wire11})) ?
                  (reg22[(3'h5):(3'h5)] > $signed(wire17)) : $signed($unsigned(reg20[(4'ha):(2'h2)]))));
              reg47 <= $unsigned((reg32 ?
                  (reg25[(4'ha):(2'h3)] ?
                      {$signed(reg45)} : wire11) : (($signed(wire9) < (reg27 & reg45)) << reg19)));
              reg48 <= (8'hac);
              reg49 <= (&$unsigned(($signed(reg39) <= $signed((-reg31)))));
              reg50 <= wire11;
            end
        end
      reg51 <= ({wire18[(4'hb):(4'h8)], reg41[(2'h3):(2'h2)]} ?
          $signed((7'h40)) : reg30);
    end
endmodule

module module99
#(parameter param145 = ((~^(^(+((8'ha6) - (8'hac))))) | {{((~(8'ha2)) == ((8'ha7) ? (8'h9c) : (8'ha1)))}, {(8'ha7), {(^(8'had)), (8'haa)}}}))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire103;
  input wire signed [(3'h5):(1'h0)] wire102;
  input wire [(3'h4):(1'h0)] wire101;
  input wire signed [(4'hf):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire143;
  wire signed [(5'h15):(1'h0)] wire142;
  wire [(5'h15):(1'h0)] wire141;
  wire signed [(2'h2):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  wire signed [(3'h7):(1'h0)] wire137;
  wire [(5'h11):(1'h0)] wire136;
  wire signed [(2'h3):(1'h0)] wire135;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire131;
  wire signed [(5'h15):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire104;
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire131,
                 wire112,
                 wire111,
                 wire110,
                 wire104,
                 reg138,
                 reg133,
                 reg132,
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
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire104 = (((((!wire102) ?
                               ((8'hbd) ?
                                   (8'hab) : wire102) : (wire101 > wire100)) ?
                           wire101 : $signed($signed(wire100))) <<< ($unsigned($signed(wire103)) || $signed(((8'hac) ?
                           wire102 : (8'had))))) ?
                       wire103 : ((^~(wire102 < $unsigned((8'hbd)))) ?
                           wire100[(3'h4):(1'h1)] : wire103[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg105 <= $unsigned((wire102 ?
          wire103[(3'h6):(3'h4)] : wire102[(2'h3):(1'h1)]));
      reg106 <= ({($signed((wire104 ?
              (8'hb6) : wire103)) * wire101[(1'h0):(1'h0)]),
          (^((wire103 || wire103) >>> (wire100 + wire100)))} >= {{($signed(wire104) ?
                  ((8'ha2) ? wire101 : wire100) : wire102)}});
      reg107 <= ($signed((~$unsigned((reg106 ? reg106 : reg106)))) & (8'h9e));
      reg108 <= ((wire104[(4'hc):(1'h1)] >>> (^~reg106[(1'h1):(1'h1)])) ?
          reg106 : {{wire103[(1'h1):(1'h1)]}});
      reg109 <= {$signed($signed($signed(wire101))),
          (({(reg107 ?
                  reg105 : reg106)} >= {$signed(wire103)}) ^ wire104[(4'hf):(1'h0)])};
    end
  assign wire110 = reg106[(1'h0):(1'h0)];
  assign wire111 = {(~^{{reg106}})};
  assign wire112 = wire100;
  always
    @(posedge clk) begin
      if (wire110[(4'hd):(4'hc)])
        begin
          if ((~reg107))
            begin
              reg113 <= (((((reg108 * wire110) + wire104) ?
                      reg105 : {{wire102},
                          (&reg109)}) * reg105[(4'hd):(4'hb)]) ?
                  $signed(($unsigned((wire111 + reg109)) ?
                      (!$unsigned(wire100)) : (^(wire100 ?
                          reg109 : reg109)))) : ((^wire112[(2'h2):(2'h2)]) && (reg107 & wire111[(3'h5):(1'h0)])));
            end
          else
            begin
              reg113 <= ($unsigned(wire104[(4'ha):(2'h3)]) ^~ $unsigned(wire112[(5'h15):(4'h9)]));
              reg114 <= ((~$unsigned($signed((~wire112)))) | $unsigned($signed((8'haf))));
            end
          reg115 <= $signed((&(wire110[(5'h12):(3'h6)] ?
              reg106 : (~|(wire101 ^~ (8'ha1))))));
        end
      else
        begin
          if (wire111)
            begin
              reg113 <= $signed((wire104 ?
                  $signed(($signed((8'ha5)) ?
                      $unsigned(reg115) : (wire101 ?
                          wire104 : reg106))) : wire112[(3'h6):(2'h3)]));
            end
          else
            begin
              reg113 <= reg106;
              reg114 <= $unsigned(wire100[(2'h2):(1'h0)]);
              reg115 <= (8'ha4);
            end
          if (wire103[(1'h0):(1'h0)])
            begin
              reg116 <= wire100;
              reg117 <= $signed(wire103[(3'h7):(3'h7)]);
              reg118 <= (($signed((reg113 ? ((8'ha2) * reg113) : wire104)) ?
                      (~|((reg115 ?
                          (8'hbf) : wire110) && reg114)) : {(!$signed(wire104)),
                          (8'hbd)}) ?
                  {$signed((~|(^~reg105)))} : (8'hb7));
              reg119 <= $unsigned($signed({wire112[(4'hb):(3'h5)]}));
            end
          else
            begin
              reg116 <= {(($signed({reg117}) >>> ($unsigned(wire101) ?
                      $unsigned(wire112) : (~wire101))) != ((wire101[(3'h4):(2'h2)] ?
                          $unsigned(wire104) : $unsigned(wire101)) ?
                      reg106 : $unsigned((reg119 ? reg108 : reg113)))),
                  {$unsigned(wire104),
                      (reg116 ?
                          (wire110 ?
                              wire104[(2'h2):(1'h1)] : (~(7'h42))) : wire101[(2'h3):(1'h0)])}};
              reg117 <= reg113[(3'h6):(3'h4)];
              reg118 <= wire101[(1'h0):(1'h0)];
              reg119 <= (7'h40);
            end
          reg120 <= wire112;
          if ($signed($signed(wire100[(2'h2):(1'h0)])))
            begin
              reg121 <= $signed((wire102 ?
                  {(&reg106[(3'h6):(2'h2)]),
                      reg114} : (wire110 > $signed((reg109 - reg114)))));
            end
          else
            begin
              reg121 <= $unsigned($unsigned(wire112[(3'h4):(2'h3)]));
            end
        end
      reg122 <= (^~((((reg106 ? wire111 : wire100) ?
              wire103[(2'h2):(2'h2)] : wire100[(4'hf):(1'h1)]) >>> $unsigned((wire110 ?
              reg120 : reg109))) ?
          (reg116 ?
              ($unsigned((7'h41)) * $unsigned(wire112)) : ($signed(reg105) == reg113)) : reg117));
      if (wire102[(1'h0):(1'h0)])
        begin
          reg123 <= $signed($signed(reg117));
          reg124 <= ($unsigned(((^reg119) >>> wire101)) ?
              (reg107 - ($signed($unsigned(reg116)) >> wire110)) : $unsigned((!reg121[(3'h7):(3'h7)])));
          if ({$signed((^~reg118))})
            begin
              reg125 <= wire112[(4'hd):(2'h3)];
              reg126 <= $signed(({((reg121 ? reg118 : wire110) ?
                          (-wire102) : wire102[(2'h2):(1'h1)]),
                      wire112[(4'hf):(4'hb)]} ?
                  $unsigned(((-wire111) >> (reg122 ?
                      wire102 : wire102))) : $signed((+(-wire103)))));
              reg127 <= $signed(((reg120 << reg113) * ($unsigned($signed(wire103)) ?
                  $signed($unsigned(wire104)) : {((8'hb8) ?
                          reg116 : wire110)})));
              reg128 <= $unsigned({$unsigned($unsigned(reg117[(4'h8):(3'h5)])),
                  wire100[(4'hc):(1'h0)]});
              reg129 <= (^~$unsigned(wire100[(2'h2):(1'h0)]));
            end
          else
            begin
              reg125 <= $signed(wire103[(4'hc):(3'h5)]);
              reg126 <= (reg116[(1'h1):(1'h0)] > reg108[(4'hb):(1'h1)]);
              reg127 <= (({(-$unsigned(reg107))} > reg116) ?
                  $signed($signed(reg121)) : reg118[(4'he):(4'hb)]);
            end
        end
      else
        begin
          reg123 <= reg119;
          if ($unsigned(reg121[(3'h5):(2'h2)]))
            begin
              reg124 <= reg106[(3'h7):(2'h2)];
            end
          else
            begin
              reg124 <= (~&($unsigned((~&$signed(reg121))) ?
                  ((reg115 ?
                      $signed(reg121) : wire104[(3'h4):(1'h1)]) == $unsigned(reg117[(1'h0):(1'h0)])) : $unsigned(reg122)));
              reg125 <= reg126;
              reg126 <= (+$signed({(~(+reg107)),
                  $signed(reg115[(1'h0):(1'h0)])}));
            end
          reg127 <= (~|((reg117[(4'ha):(4'h8)] ?
              $signed((^wire101)) : ({reg123} ?
                  (~&reg128) : (-reg118))) - $signed((-reg115[(3'h7):(3'h6)]))));
        end
      reg130 <= wire102;
    end
  assign wire131 = $signed((&(($signed(reg130) ?
                           (^(8'hb5)) : {reg118, (8'hbe)}) ?
                       reg108 : $unsigned(reg115[(4'hb):(1'h0)]))));
  always
    @(posedge clk) begin
      reg132 <= (&(!(((^(8'ha6)) ^ (reg126 * wire104)) | (reg116 ?
          {reg122, (8'haa)} : (wire101 * (8'ha4))))));
      reg133 <= $signed(reg117);
    end
  assign wire134 = $unsigned({{($signed(wire103) ?
                               $signed(reg117) : (~&wire131)),
                           reg114}});
  assign wire135 = wire112[(5'h15):(3'h4)];
  assign wire136 = ($signed(reg106[(3'h6):(1'h1)]) < reg128[(3'h4):(1'h1)]);
  assign wire137 = $unsigned((~|reg132[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg138 <= reg105[(4'hb):(4'h8)];
    end
  assign wire139 = $signed($unsigned($unsigned(reg106)));
  assign wire140 = wire135;
  assign wire141 = {$unsigned($signed($signed($unsigned(wire103))))};
  assign wire142 = $signed(wire112);
  assign wire143 = (8'haf);
  assign wire144 = wire110[(4'he):(3'h5)];
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire75;
  input wire signed [(5'h12):(1'h0)] wire74;
  input wire signed [(5'h12):(1'h0)] wire73;
  input wire [(4'h8):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  assign y = {wire89,
                 wire87,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 reg88,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire76 = (&(wire74[(4'hd):(4'ha)] ?
                      wire75 : (^~(^~(wire74 ? wire75 : wire73)))));
  assign wire77 = ($signed(wire73[(4'h9):(3'h6)]) ?
                      $signed((&{wire72})) : (&$signed((^~(!wire74)))));
  assign wire78 = $signed(wire76);
  assign wire79 = $signed(((+$signed(wire76)) ?
                      $signed((8'hb6)) : ((!((7'h42) > (8'h9d))) * wire73)));
  assign wire80 = $signed(wire72[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      reg81 <= $unsigned(wire75[(2'h3):(2'h2)]);
      reg82 <= wire77[(2'h3):(1'h0)];
      reg83 <= wire74;
      reg84 <= wire76[(1'h0):(1'h0)];
      if ((~^reg83))
        begin
          reg85 <= ((&$signed((^$signed(reg82)))) - (reg84 <= {{wire77[(2'h2):(1'h1)]}}));
        end
      else
        begin
          reg85 <= reg82[(3'h7):(2'h2)];
          reg86 <= ($unsigned(wire73[(1'h1):(1'h0)]) < $signed((|$signed((-reg81)))));
        end
    end
  assign wire87 = (reg86[(3'h5):(1'h1)] > reg82[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg88 <= $unsigned((wire87 >>> $signed(reg82)));
    end
  assign wire89 = reg83[(1'h1):(1'h1)];
endmodule
