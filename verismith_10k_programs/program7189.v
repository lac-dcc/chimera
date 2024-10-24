module top
#(parameter param290 = ({(7'h41)} ? (((((7'h42) * (8'h9c)) | ((8'hbd) + (8'haf))) ? {(^~(8'ha5))} : (-((8'h9f) ? (8'h9f) : (8'hb1)))) <= {{((8'hb8) ? (8'had) : (8'ha9))}, (|(7'h43))}) : {(((~(8'ha2)) <<< (-(8'hac))) ? ((~|(8'h9d)) ~^ ((8'hb7) >> (8'hae))) : (((8'hbc) ? (8'h9d) : (8'ha5)) && (8'haf))), (({(8'ha5)} ^~ {(8'hac), (8'hb0)}) ? ((^~(8'hbf)) - ((8'hbb) | (8'ha9))) : (&((8'h9e) * (8'ha4))))}), 
parameter param291 = param290)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire289;
  wire [(4'ha):(1'h0)] wire288;
  wire signed [(4'hf):(1'h0)] wire287;
  wire [(4'hd):(1'h0)] wire286;
  wire signed [(5'h11):(1'h0)] wire285;
  wire signed [(4'he):(1'h0)] wire284;
  wire [(5'h13):(1'h0)] wire283;
  wire signed [(3'h5):(1'h0)] wire281;
  wire [(5'h14):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  assign y = {wire289,
                 wire288,
                 wire287,
                 wire286,
                 wire285,
                 wire284,
                 wire283,
                 wire281,
                 wire76,
                 wire33,
                 wire4,
                 reg35,
                 reg36,
                 reg37,
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
                 reg51,
                 reg52,
                 (1'h0)};
  assign wire4 = wire1;
  module5 #() modinst34 (.wire9(wire0), .wire7(wire1), .clk(clk), .y(wire33), .wire8(wire2), .wire6(wire4));
  always
    @(posedge clk) begin
      reg35 <= {(wire33 ? (^$unsigned((|(8'hba)))) : $unsigned(wire0))};
      reg36 <= $unsigned((!{wire0[(4'h9):(4'h9)]}));
      if (((((~^$signed(wire0)) ?
              (wire33 >>> {reg35}) : ((8'ha4) ?
                  (!wire33) : {wire3})) != reg35[(4'hd):(4'h8)]) ?
          $unsigned(wire3[(4'ha):(4'h8)]) : ({((wire33 ? wire33 : wire0) ?
                  (wire0 ^~ wire3) : $unsigned((8'hb8))),
              $unsigned((~^wire3))} < ({(!wire3)} ? (&wire3) : wire0))))
        begin
          reg37 <= ($signed(wire3) ^ {$signed(((&(8'hb7)) ^~ $signed(wire2)))});
          if ((!reg35))
            begin
              reg38 <= (^$signed((($unsigned(wire1) ?
                      (wire1 ? (8'hbc) : wire0) : $unsigned(wire2)) ?
                  reg35[(3'h6):(2'h3)] : reg37)));
              reg39 <= {(wire1 ?
                      ($signed((^wire4)) <= reg37[(3'h5):(2'h2)]) : $unsigned(wire33[(4'hd):(2'h3)]))};
              reg40 <= reg39;
              reg41 <= $unsigned($signed(reg39));
              reg42 <= ((reg40 + reg41[(1'h0):(1'h0)]) ?
                  $unsigned(reg41[(2'h3):(1'h1)]) : (^~wire1));
            end
          else
            begin
              reg38 <= ($signed($unsigned((^(wire1 ? reg42 : wire33)))) ?
                  ($unsigned((~&wire4)) ?
                      $signed(wire2[(4'hf):(3'h5)]) : $unsigned(((reg38 ?
                          reg38 : reg36) == $signed(reg35)))) : $signed($signed({reg36,
                      (reg40 > (8'hbb))})));
              reg39 <= $signed((8'hbd));
              reg40 <= ($unsigned((reg39[(2'h3):(2'h2)] >>> ($unsigned(reg41) ?
                      (wire2 ? (8'hb1) : wire1) : $unsigned(reg40)))) ?
                  ((-($unsigned((8'hb5)) ?
                      (+(8'had)) : (wire3 ?
                          (8'haa) : reg35))) == $signed((reg41[(3'h5):(2'h3)] ?
                      reg35 : reg40))) : (reg39 <= $signed(($signed(reg41) && $signed((8'hbc))))));
            end
          reg43 <= (^$signed({(!reg39), reg41[(2'h2):(1'h1)]}));
          if ($signed((($signed(reg37[(4'hd):(4'hd)]) ~^ reg40) ?
              {($signed(reg43) ? $unsigned(wire1) : reg35[(1'h0):(1'h0)]),
                  ($signed(wire4) ?
                      {reg36} : (wire33 ?
                          (8'hb6) : reg36))} : (^~$unsigned({reg38})))))
            begin
              reg44 <= reg42;
              reg45 <= (reg44[(4'hc):(1'h0)] > $unsigned($unsigned($signed($unsigned(reg41)))));
              reg46 <= $unsigned((wire4 ?
                  $signed(((&wire0) ?
                      $unsigned(reg38) : (&wire0))) : {((reg37 != reg45) ?
                          (8'hbe) : {reg42})}));
              reg47 <= (reg35 + wire1);
            end
          else
            begin
              reg44 <= $signed(wire2[(4'ha):(4'h9)]);
              reg45 <= (~(~|$unsigned((&(wire0 ? reg47 : reg39)))));
              reg46 <= reg42[(1'h0):(1'h0)];
              reg47 <= reg47[(2'h2):(1'h0)];
              reg48 <= reg47[(2'h2):(1'h0)];
            end
          if ($unsigned($signed((|(8'hae)))))
            begin
              reg49 <= ({$unsigned((reg44[(3'h4):(2'h2)] < wire3))} ^ (!$signed(reg41[(1'h0):(1'h0)])));
              reg50 <= $unsigned(((~(reg40 | (~|reg37))) & ((|(8'hb7)) ?
                  wire0[(4'h8):(3'h4)] : {(reg41 ^~ wire33), {reg46, wire1}})));
              reg51 <= $signed(wire2[(3'h7):(3'h4)]);
              reg52 <= reg42;
            end
          else
            begin
              reg49 <= (8'hae);
              reg50 <= $signed((!$signed((+(~wire0)))));
              reg51 <= (^~$unsigned(reg52));
              reg52 <= $signed($signed(((wire3 ?
                  $signed(reg41) : ((8'ha9) ?
                      (8'hac) : reg50)) && ($signed(reg41) ?
                  {reg42, reg44} : wire3))));
            end
        end
      else
        begin
          reg37 <= $unsigned($unsigned($signed(wire33[(1'h0):(1'h0)])));
        end
    end
  module53 #() modinst77 (wire76, clk, reg50, reg36, reg42, reg47);
  module78 #() modinst282 (wire281, clk, reg46, wire1, reg52, reg43, wire76);
  assign wire283 = $signed(reg50[(3'h5):(2'h2)]);
  assign wire284 = wire33[(3'h4):(2'h2)];
  assign wire285 = $unsigned($unsigned($signed($unsigned((!wire33)))));
  assign wire286 = (reg36[(3'h7):(3'h4)] ?
                       (reg40[(2'h2):(1'h0)] ?
                           ((^~wire284[(4'he):(1'h1)]) ?
                               (reg37 && (^~wire1)) : {$signed(reg42),
                                   $signed(reg35)}) : (-{(~|reg43),
                               reg49[(4'hb):(2'h3)]})) : reg48[(2'h2):(1'h0)]);
  assign wire287 = (!reg52[(1'h0):(1'h0)]);
  assign wire288 = (!(!wire2));
  assign wire289 = ($signed($signed((!$unsigned(wire283)))) <<< $unsigned(reg47[(2'h3):(2'h2)]));
endmodule

module module78  (y, clk, wire79, wire80, wire81, wire82, wire83);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire79;
  input wire [(2'h3):(1'h0)] wire80;
  input wire signed [(4'hb):(1'h0)] wire81;
  input wire [(5'h15):(1'h0)] wire82;
  input wire signed [(5'h14):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire280;
  wire signed [(5'h15):(1'h0)] wire279;
  wire signed [(3'h6):(1'h0)] wire278;
  wire signed [(5'h10):(1'h0)] wire274;
  wire [(4'he):(1'h0)] wire273;
  wire [(5'h12):(1'h0)] wire271;
  wire [(5'h10):(1'h0)] wire251;
  wire signed [(4'hb):(1'h0)] wire214;
  wire signed [(5'h11):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire135;
  wire [(4'hd):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire229;
  wire signed [(2'h2):(1'h0)] wire249;
  reg [(3'h6):(1'h0)] reg277 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg276 = (1'h0);
  reg [(2'h3):(1'h0)] reg275 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg228 = (1'h0);
  reg [(3'h5):(1'h0)] reg227 = (1'h0);
  reg [(5'h12):(1'h0)] reg226 = (1'h0);
  reg [(2'h2):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg224 = (1'h0);
  reg [(5'h12):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg222 = (1'h0);
  reg [(3'h7):(1'h0)] reg221 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg220 = (1'h0);
  reg [(2'h3):(1'h0)] reg219 = (1'h0);
  reg [(5'h13):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg217 = (1'h0);
  reg [(4'hc):(1'h0)] reg216 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  assign y = {wire280,
                 wire279,
                 wire278,
                 wire274,
                 wire273,
                 wire271,
                 wire251,
                 wire214,
                 wire136,
                 wire135,
                 wire133,
                 wire101,
                 wire99,
                 wire229,
                 wire249,
                 reg277,
                 reg276,
                 reg275,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 (1'h0)};
  module84 #() modinst100 (wire99, clk, wire83, wire81, wire80, wire82, wire79);
  assign wire101 = $unsigned((wire82[(1'h1):(1'h0)] ?
                       ((~&{wire80, wire99}) ?
                           ($unsigned(wire79) <= (wire82 ?
                               wire80 : (8'hbc))) : $unsigned(((8'hb9) || (8'hb0)))) : $signed($signed($signed(wire83)))));
  always
    @(posedge clk) begin
      reg102 <= ($unsigned(($signed(wire81) || $signed((wire81 != wire82)))) & $signed((~wire80)));
      if (wire83)
        begin
          if ($unsigned(reg102[(1'h1):(1'h1)]))
            begin
              reg103 <= ((reg102 + ($unsigned(reg102) << (~|$unsigned(reg102)))) ?
                  (wire99[(2'h3):(2'h2)] <<< wire81) : $signed(wire81));
              reg104 <= (~(&(($unsigned(wire81) ?
                  $signed(reg102) : (wire82 ?
                      (7'h44) : wire81)) ^ $unsigned((wire81 ?
                  wire99 : reg103)))));
              reg105 <= wire101;
            end
          else
            begin
              reg103 <= wire101[(4'hb):(3'h6)];
              reg104 <= ($unsigned(((reg103 || reg102[(1'h1):(1'h1)]) ^~ reg104[(2'h2):(1'h1)])) < ((|$signed(wire99[(1'h1):(1'h0)])) <<< reg105[(4'he):(4'hc)]));
            end
          reg106 <= $unsigned({reg102[(1'h0):(1'h0)]});
          reg107 <= (-$signed(wire82));
          if ((-((({reg107, reg103} ? wire99 : reg106) ? reg106 : wire99) ?
              $unsigned($unsigned((reg102 << reg103))) : ($unsigned($unsigned(wire79)) <= $unsigned((~|(8'hb9)))))))
            begin
              reg108 <= wire99;
              reg109 <= $signed((^(^~{$unsigned(reg108),
                  (wire83 ? wire83 : wire80)})));
              reg110 <= {(~|reg107)};
              reg111 <= $signed(reg103);
            end
          else
            begin
              reg108 <= $signed(wire81[(4'ha):(3'h5)]);
            end
        end
      else
        begin
          if (($signed({$unsigned($signed((8'hbb)))}) & ($unsigned(reg106[(4'h9):(1'h1)]) ?
              wire82[(4'h9):(3'h4)] : ((wire82[(5'h12):(2'h2)] ?
                      ((8'ha2) ? wire82 : reg107) : ((8'hb4) < reg103)) ?
                  (reg106 ?
                      ((8'hbb) ?
                          wire83 : reg109) : wire79[(1'h1):(1'h0)]) : {((8'hae) <<< wire80)}))))
            begin
              reg103 <= (($unsigned(($unsigned((8'h9c)) << (wire82 ?
                      reg109 : reg104))) & wire82[(3'h6):(1'h1)]) ?
                  (^wire82[(4'ha):(4'ha)]) : wire101);
              reg104 <= reg110;
              reg105 <= wire83;
              reg106 <= $unsigned($signed({((wire83 ^ reg108) ?
                      $signed(wire81) : ((8'ha3) ? reg105 : reg105))}));
              reg107 <= $unsigned((({(reg109 == reg108),
                          ((8'ha6) ? reg111 : reg106)} ?
                      wire81[(4'hb):(2'h2)] : (reg104 ?
                          ((8'haf) ? reg108 : reg109) : $signed(wire83))) ?
                  $unsigned((&wire101[(4'hf):(4'he)])) : $signed($unsigned($unsigned(reg109)))));
            end
          else
            begin
              reg103 <= reg102;
              reg104 <= reg105;
              reg105 <= {($signed(wire81) ?
                      {(~|(wire99 << reg105)),
                          ($unsigned((8'hb8)) > (wire101 <= wire83))} : (7'h42)),
                  (|(~^(&((8'hbc) ^~ reg103))))};
            end
          if (reg107)
            begin
              reg108 <= wire79[(2'h2):(2'h2)];
              reg109 <= $unsigned(reg104[(5'h11):(4'he)]);
            end
          else
            begin
              reg108 <= reg110[(2'h2):(2'h2)];
              reg109 <= (reg109[(1'h1):(1'h1)] ?
                  (8'hb1) : (~^(^(wire79 ?
                      (reg111 ^~ wire99) : wire81[(3'h4):(2'h3)]))));
              reg110 <= $unsigned(($signed(((8'ha3) * wire81[(4'h9):(1'h1)])) ?
                  reg105 : wire79));
              reg111 <= $signed((8'hb3));
              reg112 <= $signed({reg107[(4'ha):(2'h2)],
                  $signed($signed((wire81 ^~ reg111)))});
            end
          reg113 <= (($unsigned(wire99) ?
              $signed(wire83[(4'hf):(4'hb)]) : (~^$signed({reg106}))) * reg112[(3'h5):(3'h4)]);
        end
      if (({{(((8'h9e) | reg106) > reg108), $unsigned((reg110 < wire82))},
              (((reg104 ? reg105 : (8'ha2)) ?
                  reg108 : reg108) < $signed(reg104[(3'h6):(3'h5)]))} ?
          $signed({(^~(wire101 ? wire83 : wire82))}) : $unsigned(wire83)))
        begin
          reg114 <= reg105[(4'hb):(4'ha)];
        end
      else
        begin
          reg114 <= reg105[(5'h10):(4'h8)];
        end
    end
  module115 #() modinst134 (wire133, clk, reg106, reg103, reg104, reg111, reg107);
  assign wire135 = reg112;
  assign wire136 = reg104;
  module137 #() modinst215 (wire214, clk, wire136, reg102, wire82, reg104, wire83);
  always
    @(posedge clk) begin
      if ($unsigned($signed(($unsigned((reg110 ? wire101 : (7'h41))) ?
          (8'ha9) : wire83))))
        begin
          reg216 <= (wire99[(1'h1):(1'h1)] ?
              $signed($signed({(reg109 ? wire136 : reg110),
                  (!reg104)})) : $unsigned((&(+(8'ha3)))));
          reg217 <= $unsigned($signed(wire80));
          reg218 <= $unsigned(((reg107 ?
                  $unsigned((reg106 ?
                      reg111 : reg109)) : $unsigned($signed(reg105))) ?
              ({reg113, ((8'hbd) < reg108)} ?
                  {(&wire82), reg109} : $unsigned(((8'hab) ?
                      (8'hb8) : wire81))) : reg111));
          if (($unsigned(($unsigned($signed(wire136)) - $unsigned($signed(wire101)))) == (~reg103[(4'ha):(3'h6)])))
            begin
              reg219 <= ({$signed(wire79),
                  $unsigned((~&(|reg216)))} > ($unsigned(reg107[(4'hc):(3'h7)]) != wire81));
              reg220 <= reg107;
              reg221 <= (reg217[(3'h5):(2'h2)] ?
                  ((reg105 ?
                      reg217 : ((!reg114) >>> ((8'h9c) >> reg113))) && (^~($unsigned(wire135) > $signed(reg219)))) : (-(8'hb2)));
              reg222 <= wire214;
            end
          else
            begin
              reg219 <= wire82[(5'h13):(4'h9)];
            end
          reg223 <= ((^~$unsigned(reg222)) ?
              ((wire101 > ((+(8'hb7)) * (reg109 ? (8'ha1) : reg216))) ?
                  wire81[(2'h3):(2'h2)] : (reg220[(3'h7):(3'h4)] ?
                      ((~|reg102) == (&reg216)) : $unsigned((wire101 * reg217)))) : {($unsigned(wire214[(3'h6):(1'h1)]) ?
                      reg109 : (-(reg218 ? wire133 : reg218)))});
        end
      else
        begin
          reg216 <= $unsigned($signed(((~^(reg110 ? reg105 : reg218)) ?
              $unsigned({(8'ha0)}) : (wire133[(2'h3):(1'h0)] ~^ (+reg219)))));
          reg217 <= wire82;
          if ((~&(8'hb5)))
            begin
              reg218 <= (reg217[(1'h0):(1'h0)] != (((^reg114) == (reg106[(5'h10):(4'hb)] | $signed(reg108))) + (8'hb2)));
              reg219 <= reg220;
              reg220 <= $signed(wire136);
              reg221 <= $unsigned((^(reg219 ?
                  ((+(8'hb6)) ?
                      {wire135, reg221} : $unsigned(wire79)) : reg102)));
              reg222 <= (wire82[(4'hf):(2'h2)] ? $signed(wire82) : wire214);
            end
          else
            begin
              reg218 <= $unsigned($unsigned(($unsigned((^~reg110)) ?
                  $unsigned((wire214 ? reg104 : reg112)) : $signed({reg108,
                      wire99}))));
              reg219 <= (~$signed((&$signed(reg107[(4'hd):(4'ha)]))));
            end
          reg223 <= reg217;
          reg224 <= (wire214 < ((wire136[(4'hf):(1'h1)] ?
                  reg114 : (wire82 * $signed((8'hab)))) ?
              (^~((~^(7'h43)) + reg106)) : (wire135 > wire80)));
        end
      reg225 <= $signed($unsigned(reg107[(1'h0):(1'h0)]));
      if ($unsigned((!$signed($unsigned($signed(reg221))))))
        begin
          if ((reg109[(3'h6):(3'h6)] > $unsigned($signed((8'had)))))
            begin
              reg226 <= $signed($signed($signed($unsigned((wire99 <<< reg225)))));
            end
          else
            begin
              reg226 <= $unsigned(wire81[(3'h4):(2'h3)]);
              reg227 <= (reg113 <= (-(!(&$signed(reg217)))));
              reg228 <= ((^~($signed((|wire83)) ?
                      reg220[(3'h5):(2'h2)] : (reg217[(4'h9):(3'h4)] ^~ $signed(reg219)))) ?
                  wire101[(4'h8):(2'h2)] : {{{(reg218 <<< reg110),
                              (reg103 * (7'h44))}}});
            end
        end
      else
        begin
          reg226 <= reg226;
          reg227 <= $signed({$signed((wire79[(4'h8):(3'h4)] ?
                  (reg224 ~^ (7'h40)) : $unsigned(wire214))),
              $unsigned(reg109[(4'h8):(3'h7)])});
        end
    end
  assign wire229 = ((&{reg110[(1'h1):(1'h1)], reg224}) ?
                       {reg113[(1'h1):(1'h1)]} : reg216[(4'hc):(4'hc)]);
  module230 #() modinst250 (wire249, clk, wire79, reg223, reg226, reg103);
  assign wire251 = ((~$signed($unsigned((^wire101)))) > reg105[(4'ha):(4'h9)]);
  module252 #() modinst272 (wire271, clk, reg104, wire251, wire133, wire229, wire101);
  assign wire273 = (!$unsigned(($unsigned((wire80 ?
                       reg218 : reg106)) ^ reg217[(5'h10):(4'ha)])));
  assign wire274 = ((8'hb4) ?
                       $signed($unsigned({$signed(reg107),
                           $unsigned(wire81)})) : (reg113[(4'h8):(2'h3)] << $unsigned(reg114)));
  always
    @(posedge clk) begin
      reg275 <= $signed({wire79[(1'h1):(1'h0)], (|reg107[(2'h2):(1'h0)])});
      reg276 <= wire251;
      reg277 <= wire251[(4'he):(3'h4)];
    end
  assign wire278 = {{(reg226 ?
                               $signed((reg106 ^ reg105)) : $signed(wire133[(3'h5):(3'h5)])),
                           $signed($unsigned($signed(reg108)))}};
  assign wire279 = (&((~reg105[(4'ha):(1'h0)]) << $unsigned((((8'hab) ?
                       (8'hb1) : wire274) || $unsigned(wire229)))));
  assign wire280 = wire135[(2'h3):(1'h1)];
endmodule

module module53  (y, clk, wire54, wire55, wire56, wire57);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire54;
  input wire signed [(5'h13):(1'h0)] wire55;
  input wire signed [(4'h9):(1'h0)] wire56;
  input wire [(5'h13):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire72;
  assign y = {wire75, wire74, wire58, wire59, wire60, wire72, (1'h0)};
  assign wire58 = $unsigned((wire54[(3'h6):(2'h3)] << wire55[(1'h0):(1'h0)]));
  assign wire59 = {wire56, wire56};
  assign wire60 = $signed(($signed(((8'hb7) <= (7'h40))) ?
                      $unsigned($signed((wire57 ?
                          wire57 : wire57))) : wire58[(3'h6):(3'h4)]));
  module61 #() modinst73 (.wire62(wire56), .wire65(wire59), .y(wire72), .clk(clk), .wire66(wire55), .wire64(wire58), .wire63(wire57));
  assign wire74 = (($signed((^~wire56[(3'h7):(2'h3)])) * (wire59[(4'h9):(3'h7)] || $signed(wire60[(4'ha):(1'h1)]))) << wire55[(4'hd):(4'hd)]);
  assign wire75 = (((wire74[(2'h3):(2'h2)] ?
                          $signed((wire74 & wire55)) : wire57[(4'hf):(3'h5)]) ?
                      $unsigned($signed((&(8'hb8)))) : ($signed((wire60 && (8'hb7))) <<< $unsigned((8'ha3)))) == ((~(^~$unsigned(wire54))) ?
                      ($signed(((8'hb7) ? (8'hae) : wire58)) ?
                          (wire59 >> (8'ha6)) : ($signed((7'h41)) ?
                              $signed(wire60) : {wire58})) : wire74));
endmodule

module module5
#(parameter param32 = (~&({(!((8'hb4) ? (8'hbf) : (8'hbc)))} ? {((!(7'h44)) ? ((8'hb8) ? (8'ha2) : (7'h44)) : ((7'h42) == (8'hb6))), ((+(8'ha4)) & (&(7'h41)))} : {(((8'haa) != (8'hb6)) ? ((8'hbc) ? (8'hb7) : (8'haa)) : (+(7'h41)))})))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire10;
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire10,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = (wire7[(3'h7):(1'h0)] ? wire9[(4'h8):(1'h0)] : wire6);
  always
    @(posedge clk) begin
      reg11 <= ($signed(($unsigned({wire7}) - (wire6[(3'h5):(1'h1)] || (wire9 ^ wire6)))) ?
          wire7 : wire9[(3'h7):(2'h2)]);
      reg12 <= $unsigned((8'hab));
      reg13 <= $unsigned(($signed((~(~&wire10))) >> $unsigned(wire10)));
      if ($signed($signed(reg12[(2'h2):(2'h2)])))
        begin
          reg14 <= wire8;
          if (reg13)
            begin
              reg15 <= $unsigned(wire6);
              reg16 <= $signed(($signed($signed((^reg13))) != reg14));
              reg17 <= $unsigned({(+{reg14[(1'h1):(1'h0)], $signed(reg13)}),
                  {$unsigned(reg13[(4'hf):(2'h3)]),
                      (reg12[(3'h5):(1'h0)] ?
                          (reg16 >>> (8'hbd)) : $signed(reg15))}});
              reg18 <= ($signed((~&reg11)) << $signed(wire7[(4'ha):(2'h3)]));
              reg19 <= reg13[(3'h5):(1'h1)];
            end
          else
            begin
              reg15 <= $signed((reg14 ?
                  ({reg11} << reg17[(5'h11):(5'h11)]) : $signed(wire8)));
              reg16 <= (|wire9[(3'h5):(1'h1)]);
              reg17 <= $unsigned($unsigned($signed(reg19[(3'h5):(3'h5)])));
              reg18 <= {(^$unsigned(wire6[(2'h2):(1'h1)])),
                  (wire9[(3'h6):(2'h2)] ^~ $unsigned((reg15 ?
                      $unsigned(reg13) : $unsigned(reg18))))};
              reg19 <= ($unsigned((&($unsigned(reg16) ?
                  wire6[(1'h0):(1'h0)] : $signed(reg16)))) >>> $signed(reg18));
            end
          if (($signed(reg11[(4'hc):(3'h5)]) ?
              (((wire7 || (wire9 ? reg19 : reg19)) << ((reg17 <<< reg12) ?
                      wire9[(3'h7):(2'h2)] : reg13)) ?
                  wire9 : reg13) : $signed((&{reg16, reg14}))))
            begin
              reg20 <= wire10[(2'h2):(1'h0)];
              reg21 <= $signed(reg14[(1'h1):(1'h1)]);
            end
          else
            begin
              reg20 <= (~&((8'hb6) ?
                  $signed($unsigned((reg12 ?
                      (8'haa) : (8'hac)))) : $signed($signed((+reg18)))));
              reg21 <= reg21;
              reg22 <= (($signed(({(8'hbb)} ?
                          (reg17 <= reg12) : (wire9 >= reg21))) ?
                      $unsigned($signed((|wire7))) : reg11) ?
                  $signed($signed(($unsigned(wire6) ?
                      $unsigned(reg21) : (reg14 ?
                          reg13 : reg17)))) : (reg19[(4'hd):(2'h3)] ~^ reg20[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg14 <= (wire7 ^ $signed((wire6[(1'h1):(1'h1)] | (!reg15[(1'h0):(1'h0)]))));
          reg15 <= (reg21 ~^ (-wire7[(4'hd):(3'h4)]));
          reg16 <= (reg21 & wire9);
          reg17 <= (((|((reg17 ?
                  wire8 : (8'h9c)) - {wire6})) ~^ (wire6 & reg14)) ?
              ($signed({(!wire8), (reg12 ? reg13 : reg11)}) ?
                  $signed((reg22[(3'h5):(2'h3)] != $signed(wire9))) : $signed($unsigned($unsigned(reg15)))) : (~reg22));
        end
      if ((8'h9f))
        begin
          reg23 <= (8'hb4);
          if ({{wire8}, $signed(reg16[(4'hb):(3'h5)])})
            begin
              reg24 <= $unsigned(wire9);
              reg25 <= ((reg20[(1'h0):(1'h0)] >= $signed(reg24[(4'h9):(3'h5)])) ~^ reg24);
              reg26 <= $signed((+$signed(reg11[(2'h3):(1'h0)])));
              reg27 <= reg21;
            end
          else
            begin
              reg24 <= $unsigned($signed(reg25));
              reg25 <= $signed(reg15);
              reg26 <= {reg20,
                  $signed((((wire9 << reg27) || wire10[(3'h4):(1'h0)]) ?
                      ($signed(reg21) & (^~reg21)) : $signed(reg23)))};
            end
          reg28 <= reg25;
        end
      else
        begin
          reg23 <= reg24;
          reg24 <= reg18[(4'hb):(2'h3)];
          reg25 <= (reg26 > $unsigned({((~wire8) ?
                  $unsigned(reg23) : ((7'h43) ? reg19 : (7'h43))),
              ($unsigned(reg22) ? reg19[(2'h2):(2'h2)] : (~&reg24))}));
          if ($signed((~|wire10[(3'h7):(3'h6)])))
            begin
              reg26 <= (&reg18);
              reg27 <= (~|(-($signed(reg26[(1'h0):(1'h0)]) ?
                  $signed(reg16) : {(~|reg19)})));
              reg28 <= reg13[(1'h0):(1'h0)];
            end
          else
            begin
              reg26 <= (reg28 ?
                  ($signed((~^reg18[(3'h6):(2'h3)])) ?
                      {{(reg14 | reg25),
                              reg11}} : $unsigned($signed((!reg27)))) : reg13[(4'he):(3'h6)]);
            end
        end
    end
  assign wire29 = $unsigned(reg14[(2'h3):(1'h0)]);
  assign wire30 = $unsigned($unsigned(wire7));
  assign wire31 = (8'ha2);
endmodule

module module61  (y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire66;
  input wire signed [(5'h15):(1'h0)] wire65;
  input wire [(2'h3):(1'h0)] wire64;
  input wire signed [(5'h13):(1'h0)] wire63;
  input wire [(4'h9):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  assign y = {wire71, wire70, wire69, wire68, wire67, (1'h0)};
  assign wire67 = $signed($signed(((^~(wire65 && wire62)) ?
                      $unsigned(wire64) : wire66)));
  assign wire68 = wire62;
  assign wire69 = ({wire68} ?
                      $unsigned(({(~^wire63), $unsigned(wire65)} ^ (wire67 ?
                          wire66[(2'h3):(1'h1)] : $signed(wire62)))) : ((~|(8'hb9)) == (((wire62 + wire62) ?
                              wire65[(2'h2):(2'h2)] : ((8'h9c) << wire67)) ?
                          (~^(~|(8'hb8))) : (((8'ha0) != (8'ha9)) <= (wire63 == wire66)))));
  assign wire70 = $signed(($unsigned(((wire67 & wire67) ?
                      (~&(8'hac)) : {wire62})) ^ (~^(~&(wire67 | wire63)))));
  assign wire71 = {wire67};
endmodule

module module252  (y, clk, wire257, wire256, wire255, wire254, wire253);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire257;
  input wire [(5'h10):(1'h0)] wire256;
  input wire signed [(4'hd):(1'h0)] wire255;
  input wire signed [(3'h6):(1'h0)] wire254;
  input wire [(4'h8):(1'h0)] wire253;
  wire signed [(5'h10):(1'h0)] wire270;
  wire signed [(3'h7):(1'h0)] wire269;
  wire [(3'h6):(1'h0)] wire267;
  wire signed [(4'h8):(1'h0)] wire263;
  wire [(2'h2):(1'h0)] wire262;
  wire [(4'hf):(1'h0)] wire261;
  wire signed [(3'h5):(1'h0)] wire260;
  wire signed [(4'hd):(1'h0)] wire259;
  wire signed [(4'h8):(1'h0)] wire258;
  reg [(4'he):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg266 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg265 = (1'h0);
  reg [(5'h15):(1'h0)] reg264 = (1'h0);
  assign y = {wire270,
                 wire269,
                 wire267,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire259,
                 wire258,
                 reg268,
                 reg266,
                 reg265,
                 reg264,
                 (1'h0)};
  assign wire258 = (~&(|wire255[(1'h1):(1'h0)]));
  assign wire259 = $unsigned(($unsigned($signed((wire254 ?
                       wire256 : wire255))) - {$unsigned(wire258),
                       wire254[(1'h1):(1'h1)]}));
  assign wire260 = wire254;
  assign wire261 = wire260;
  assign wire262 = ((~|(($unsigned(wire254) << $unsigned(wire258)) != (^~wire255[(2'h2):(2'h2)]))) ?
                       ((|(+$signed(wire253))) + wire257) : wire260);
  assign wire263 = (wire257[(3'h6):(3'h5)] >>> ($unsigned($unsigned($unsigned((8'hac)))) ?
                       $signed(($unsigned(wire257) << {wire253})) : {wire260[(2'h2):(1'h1)]}));
  always
    @(posedge clk) begin
      reg264 <= (((-$signed($signed((8'h9f)))) * ($unsigned($signed(wire253)) == ((wire256 << wire254) ?
          (wire262 & wire257) : (wire256 <<< wire259)))) || $signed((-((~wire258) ?
          (wire258 < wire261) : $unsigned(wire253)))));
      reg265 <= $signed({$unsigned($unsigned((^wire255))),
          {wire255, wire255[(3'h4):(3'h4)]}});
      reg266 <= $signed(wire253);
    end
  assign wire267 = $signed($unsigned(wire261));
  always
    @(posedge clk) begin
      reg268 <= (wire258 >> $unsigned((~({wire261, wire260} ?
          $unsigned(reg265) : {wire253}))));
    end
  assign wire269 = $signed(wire262[(2'h2):(1'h0)]);
  assign wire270 = {$signed(reg268[(3'h6):(1'h0)])};
endmodule

module module230
#(parameter param247 = (-(+((((8'ha7) == (7'h42)) < ((8'h9f) ? (8'hbd) : (8'hbc))) ? (&{(8'ha7)}) : ({(8'h9c), (7'h43)} != ((7'h43) || (8'hb3)))))), 
parameter param248 = ({param247} ? {(((8'hbd) - (^~param247)) - {(param247 << param247)}), (((-param247) ? (param247 ? param247 : param247) : (~|param247)) != (-{param247, (8'h9e)}))} : (({param247, (param247 ? param247 : (8'had))} >>> (param247 <= {(8'h9e), param247})) ? (param247 ? (param247 | (param247 ? param247 : param247)) : param247) : {((&param247) ? (param247 + (8'hae)) : (param247 ? param247 : param247))})))
(y, clk, wire234, wire233, wire232, wire231);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire234;
  input wire signed [(5'h11):(1'h0)] wire233;
  input wire signed [(5'h12):(1'h0)] wire232;
  input wire [(5'h15):(1'h0)] wire231;
  wire [(4'ha):(1'h0)] wire246;
  wire signed [(4'hc):(1'h0)] wire245;
  wire [(3'h4):(1'h0)] wire244;
  wire signed [(5'h10):(1'h0)] wire243;
  reg signed [(2'h3):(1'h0)] reg242 = (1'h0);
  reg [(5'h11):(1'h0)] reg241 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg240 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg239 = (1'h0);
  reg [(5'h10):(1'h0)] reg238 = (1'h0);
  reg [(4'hd):(1'h0)] reg237 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg236 = (1'h0);
  reg [(4'hd):(1'h0)] reg235 = (1'h0);
  assign y = {wire246,
                 wire245,
                 wire244,
                 wire243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg235 <= {$signed($signed($unsigned((+wire234))))};
      reg236 <= $unsigned($unsigned(wire232));
      reg237 <= (wire231 ? wire232 : wire231);
      if (((8'ha0) ? wire234 : wire233))
        begin
          reg238 <= (&(reg235 ^~ (&((reg235 ? (8'hb5) : reg235) ?
              (8'h9e) : $unsigned(reg237)))));
          reg239 <= $signed(wire232);
          reg240 <= reg239;
          reg241 <= (wire232[(5'h11):(4'hf)] ?
              ((&wire234[(1'h1):(1'h1)]) <= (-((reg238 ?
                  wire233 : reg238) | $signed(wire234)))) : $signed($signed($unsigned(reg239[(1'h1):(1'h1)]))));
          reg242 <= (wire234[(2'h3):(2'h3)] ?
              ($signed({reg236}) & wire232) : reg238[(4'ha):(3'h4)]);
        end
      else
        begin
          reg238 <= ($signed($signed((^(wire234 ?
              reg242 : reg241)))) < (|(+wire234)));
          reg239 <= wire233;
          reg240 <= reg239[(2'h3):(1'h0)];
          reg241 <= wire234[(1'h1):(1'h0)];
          reg242 <= (8'hb9);
        end
    end
  assign wire243 = reg238[(4'ha):(3'h7)];
  assign wire244 = wire234;
  assign wire245 = (~|(wire231[(5'h15):(5'h11)] ?
                       wire231 : (^((wire234 ?
                           (7'h41) : reg236) ~^ $unsigned(wire233)))));
  assign wire246 = $unsigned(reg235);
endmodule

module module137  (y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h312):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire142;
  input wire signed [(3'h4):(1'h0)] wire141;
  input wire signed [(3'h6):(1'h0)] wire140;
  input wire signed [(5'h15):(1'h0)] wire139;
  input wire signed [(3'h5):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire213;
  wire signed [(5'h15):(1'h0)] wire212;
  wire signed [(5'h14):(1'h0)] wire211;
  wire [(4'hb):(1'h0)] wire205;
  wire signed [(4'hd):(1'h0)] wire204;
  wire [(5'h10):(1'h0)] wire203;
  wire signed [(4'hd):(1'h0)] wire187;
  wire [(4'ha):(1'h0)] wire186;
  wire signed [(4'h9):(1'h0)] wire185;
  wire signed [(3'h7):(1'h0)] wire184;
  wire signed [(4'h8):(1'h0)] wire183;
  wire [(3'h7):(1'h0)] wire182;
  wire [(4'hd):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire180;
  wire [(5'h13):(1'h0)] wire177;
  wire signed [(4'hf):(1'h0)] wire176;
  wire [(3'h4):(1'h0)] wire175;
  wire signed [(4'hc):(1'h0)] wire174;
  reg signed [(4'hb):(1'h0)] reg210 = (1'h0);
  reg [(4'hc):(1'h0)] reg209 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg207 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg199 = (1'h0);
  reg [(4'h8):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg195 = (1'h0);
  reg signed [(4'he):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg190 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg178 = (1'h0);
  reg [(2'h3):(1'h0)] reg173 = (1'h0);
  reg [(4'hf):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg170 = (1'h0);
  reg [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(3'h5):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg153 = (1'h0);
  reg [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire205,
                 wire204,
                 wire203,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg179,
                 reg178,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
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
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((((~|{$signed(wire141), {wire140, wire139}}) ?
              (($signed(wire138) >>> wire140[(1'h1):(1'h0)]) ?
                  wire142 : (8'ha6)) : {($signed(wire141) ^~ (~&wire142)),
                  $signed($unsigned((8'ha4)))}) ?
          (8'ha3) : $signed(wire142)))
        begin
          reg143 <= {(wire142 ?
                  (~|((wire141 ^ (7'h41)) << (wire138 < wire138))) : $unsigned($unsigned((wire140 ?
                      wire140 : wire141))))};
          reg144 <= $signed($signed(({$unsigned(wire138),
              wire140} >> ((wire141 <= wire140) ?
              $unsigned(wire138) : (^wire141)))));
          reg145 <= (^~wire142[(2'h3):(2'h2)]);
          if ((-wire138[(1'h1):(1'h0)]))
            begin
              reg146 <= (wire138[(3'h4):(3'h4)] || reg145[(1'h0):(1'h0)]);
              reg147 <= ((8'hba) ? wire139 : (wire138 ^~ $unsigned(wire142)));
            end
          else
            begin
              reg146 <= (wire142 << wire139[(4'ha):(2'h2)]);
            end
          reg148 <= ({$signed(reg146)} ?
              ((reg145 ?
                  ({reg146,
                      wire142} - (reg146 ^ reg144)) : (+$signed(wire139))) << $signed(reg146[(4'hc):(3'h7)])) : wire139[(4'h8):(3'h5)]);
        end
      else
        begin
          reg143 <= $signed(((reg145[(2'h3):(1'h1)] & {((7'h42) ?
                  (8'hbc) : (8'hac))}) || wire141[(2'h2):(1'h1)]));
          if (((reg146[(4'hc):(4'h9)] < {{{wire140, (8'hb4)},
                  $unsigned((8'haf))}}) - $unsigned({reg144[(1'h1):(1'h1)],
              reg147})))
            begin
              reg144 <= wire139;
              reg145 <= {($signed($signed((^~wire141))) | $signed(($unsigned((8'ha6)) | wire139))),
                  (reg146 ?
                      reg146[(4'hc):(3'h7)] : ((((8'h9e) ?
                          wire138 : wire141) | (wire140 != wire138)) - ((~&wire139) ^ ((8'hb3) >>> wire140))))};
              reg146 <= (wire142 || ($signed((~(wire142 ?
                  reg148 : wire140))) ~^ $unsigned(wire140[(2'h2):(1'h0)])));
            end
          else
            begin
              reg144 <= $unsigned((((reg143[(4'h8):(2'h3)] < (reg143 ?
                      wire142 : reg146)) ?
                  reg143[(4'hf):(4'ha)] : $signed((wire138 ?
                      reg147 : (8'ha4)))) > $unsigned(reg147[(3'h5):(2'h2)])));
              reg145 <= {{$unsigned($unsigned(reg143)), wire142},
                  $unsigned($unsigned($unsigned($unsigned(wire141))))};
              reg146 <= ((reg143[(4'h8):(1'h1)] ^ $signed((~(reg144 & reg146)))) ?
                  ((~^(&((8'had) ? wire140 : wire142))) ?
                      $unsigned((~^$signed(wire138))) : {((wire140 >> reg145) ?
                              (wire140 | wire140) : {wire141})}) : ((~&((wire138 < wire140) != {reg148})) ?
                      $unsigned($unsigned((-reg147))) : {(8'ha2),
                          (^((8'hbe) >>> (8'ha8)))}));
            end
          reg147 <= (^{reg145, ($unsigned($unsigned(reg143)) + {wire139})});
          reg148 <= (reg146 != ((8'ha0) ?
              (+(~reg147[(3'h5):(2'h2)])) : wire139[(4'he):(1'h1)]));
          reg149 <= $signed(reg143[(3'h5):(3'h4)]);
        end
      reg150 <= $unsigned($unsigned(reg145[(1'h1):(1'h0)]));
      if ($unsigned((wire140 ?
          {$unsigned((reg146 + reg143)),
              $unsigned((reg146 ? reg148 : reg148))} : ((~|(reg147 ?
                  wire142 : reg144)) ?
              (!((8'ha1) ? reg147 : (7'h44))) : (7'h43)))))
        begin
          if (reg148)
            begin
              reg151 <= $unsigned(wire138);
            end
          else
            begin
              reg151 <= {reg143[(5'h12):(5'h11)],
                  ($signed(reg145[(1'h1):(1'h1)]) >>> (+reg144[(3'h4):(3'h4)]))};
              reg152 <= ((!($unsigned(((8'h9c) + (8'ha1))) ?
                      $unsigned((reg150 >= wire141)) : reg144)) ?
                  $signed(wire142) : (wire141[(2'h2):(2'h2)] <<< {reg144,
                      wire138}));
              reg153 <= $signed(wire140);
              reg154 <= (|$unsigned($unsigned(($unsigned(wire141) & (~&reg148)))));
              reg155 <= $unsigned(reg144);
            end
          if ({{wire138[(2'h2):(1'h0)]},
              {(wire140 ?
                      {$unsigned(reg144)} : (reg150[(4'h9):(3'h5)] ?
                          reg155[(2'h2):(1'h1)] : (reg145 * reg148)))}})
            begin
              reg156 <= (|$signed(($signed(reg154[(4'he):(4'h8)]) && $signed((reg149 < reg144)))));
            end
          else
            begin
              reg156 <= wire140;
              reg157 <= ($signed($unsigned((!$unsigned(wire138)))) ?
                  reg143 : {wire140[(3'h5):(1'h0)]});
              reg158 <= (&$unsigned((^wire142[(1'h0):(1'h0)])));
              reg159 <= $unsigned((reg152 ?
                  $unsigned((&(+reg157))) : ({$signed(reg155), reg144} ?
                      (~(8'hae)) : (!(reg153 ? reg151 : (8'h9c))))));
            end
          reg160 <= reg156[(4'hc):(4'h9)];
          reg161 <= $signed(reg154);
        end
      else
        begin
          reg151 <= wire139;
          reg152 <= $signed((&(~^{(+(8'hab))})));
          reg153 <= (8'h9c);
          if ($unsigned((wire138[(3'h4):(2'h3)] - (($unsigned(reg157) && (-(8'ha1))) ?
              $unsigned($unsigned(reg146)) : reg159[(2'h2):(2'h2)]))))
            begin
              reg154 <= $unsigned(reg151);
              reg155 <= {reg152[(4'hc):(3'h5)]};
              reg156 <= wire139[(5'h12):(5'h11)];
              reg157 <= reg157[(2'h2):(1'h0)];
            end
          else
            begin
              reg154 <= (((({reg148} ?
                      (!wire141) : (reg150 ~^ wire142)) + ((^~(8'hbd)) >= reg158[(5'h10):(4'hc)])) ?
                  ($unsigned(wire139) << ((+(8'hb7)) ?
                      (^~(8'hb2)) : reg158[(2'h2):(1'h1)])) : wire140[(3'h5):(1'h1)]) >= ($signed(((&reg145) ?
                  (7'h40) : (wire138 ?
                      wire141 : reg154))) <<< ($unsigned($signed(reg150)) ?
                  reg156[(2'h3):(1'h1)] : ((reg148 >> wire142) >= (wire139 ?
                      reg153 : reg156)))));
              reg155 <= $signed(wire141[(1'h1):(1'h1)]);
              reg156 <= ((8'haa) ?
                  (((^$signed(reg155)) && reg143[(3'h7):(2'h3)]) ~^ $unsigned($signed(reg144[(2'h3):(1'h0)]))) : (((-$unsigned(reg150)) ?
                      ($signed(reg153) > $unsigned(wire138)) : ((^~reg159) ?
                          reg148 : $signed(wire140))) >>> {$signed($signed(reg160)),
                      reg159[(3'h5):(3'h4)]}));
            end
          reg158 <= reg152;
        end
      if ($unsigned(reg152))
        begin
          reg162 <= reg158[(4'he):(4'hd)];
          reg163 <= reg161;
          reg164 <= $signed($unsigned(reg155[(1'h1):(1'h1)]));
          reg165 <= {$unsigned({(+reg159)})};
        end
      else
        begin
          if (reg158)
            begin
              reg162 <= {(reg147[(1'h0):(1'h0)] ?
                      ((+reg165) >>> reg154) : ((reg161 >> (reg164 & reg148)) ?
                          $signed($unsigned(reg163)) : $unsigned((reg152 ?
                              reg165 : (8'hb6)))))};
              reg163 <= ($signed(reg144[(1'h0):(1'h0)]) & reg149);
              reg164 <= $signed(((~^{(-wire138)}) ?
                  $unsigned($unsigned($unsigned(reg157))) : {((reg144 ?
                          reg158 : reg147) < reg150[(4'he):(2'h3)]),
                      reg164}));
            end
          else
            begin
              reg162 <= $unsigned(reg158);
            end
          reg165 <= $unsigned($signed(reg154[(3'h4):(1'h0)]));
        end
      if (((-$signed((reg144[(3'h5):(1'h1)] < (~|reg148)))) ?
          (8'ha8) : reg155[(2'h2):(2'h2)]))
        begin
          if (wire139)
            begin
              reg166 <= {$signed((~&(wire139[(4'he):(4'h9)] >= ((8'ha7) ?
                      reg158 : reg147))))};
              reg167 <= reg163;
              reg168 <= ($signed(reg150[(5'h14):(5'h12)]) >>> (reg164 ?
                  reg147 : $signed(reg152)));
              reg169 <= $unsigned($signed(reg159));
              reg170 <= wire141;
            end
          else
            begin
              reg166 <= $signed((|($unsigned((~|reg161)) >> reg157[(2'h2):(1'h1)])));
            end
          reg171 <= (reg164 ? $unsigned((|(8'ha8))) : reg155);
          reg172 <= ((&reg146) ~^ (($signed({(8'haa)}) ?
              ({reg161} ?
                  $unsigned((8'hab)) : ((8'hbb) - reg162)) : (~$signed(reg160))) ^~ reg154[(1'h1):(1'h1)]));
          reg173 <= reg157;
        end
      else
        begin
          reg166 <= $unsigned((&(^~({reg161} <= $signed(reg171)))));
          if (reg158)
            begin
              reg167 <= reg163[(2'h3):(2'h2)];
              reg168 <= {(reg148[(3'h7):(3'h4)] ?
                      (~$unsigned((reg164 ? wire140 : (8'h9c)))) : reg171)};
              reg169 <= (~&(~{(((7'h43) <= reg149) > wire139),
                  $unsigned(reg167)}));
              reg170 <= $unsigned(reg144[(3'h5):(3'h4)]);
              reg171 <= (reg166 != {reg164[(3'h7):(1'h0)], wire138});
            end
          else
            begin
              reg167 <= (~&({reg154[(3'h7):(2'h2)]} & reg169[(2'h3):(2'h3)]));
              reg168 <= $signed(($signed(((wire138 ?
                  (8'hac) : reg156) << (reg146 ?
                  wire138 : wire141))) - (((reg160 ? reg162 : (8'hb6)) ?
                      (reg143 ? reg155 : (8'hb8)) : {reg171}) ?
                  $signed(reg145) : $signed($signed(reg149)))));
              reg169 <= $signed((&$signed($signed($unsigned(reg152)))));
              reg170 <= reg172;
              reg171 <= (reg167 >= (8'hbb));
            end
        end
    end
  assign wire174 = (^(reg144[(3'h5):(1'h1)] ?
                       $unsigned((~&(reg157 >>> wire139))) : (reg157 < reg154)));
  assign wire175 = ({$signed($unsigned($signed(reg149)))} ?
                       reg146[(3'h6):(2'h2)] : (8'ha1));
  assign wire176 = ($unsigned((reg157 ?
                       (~|{reg147, reg159}) : {(reg166 ?
                               reg150 : reg154)})) == reg157[(2'h2):(1'h1)]);
  assign wire177 = $signed({reg153, (|$signed(wire141))});
  always
    @(posedge clk) begin
      reg178 <= $signed({{(8'hb2), reg151}});
      reg179 <= $unsigned(((((8'hbe) ? $unsigned(reg151) : reg169) ?
          reg164 : (wire175 * $signed((8'ha4)))) | {reg160[(3'h5):(1'h0)]}));
    end
  assign wire180 = wire174;
  assign wire181 = (((~$signed(reg167[(2'h3):(1'h1)])) ?
                           (reg172 << (~reg159)) : ($unsigned(wire176[(4'hf):(4'hd)]) * $unsigned((|reg172)))) ?
                       reg168[(5'h10):(1'h0)] : $unsigned($unsigned(((reg173 != reg161) > $signed(reg155)))));
  assign wire182 = $unsigned($signed(($signed(reg147) && {reg164})));
  assign wire183 = $unsigned(reg143[(4'hb):(3'h4)]);
  assign wire184 = reg144[(2'h3):(1'h1)];
  assign wire185 = {(((+$signed(reg168)) ?
                               (~&{wire174,
                                   (8'hb6)}) : $unsigned($unsigned(reg148))) ?
                           $unsigned((~reg167[(4'h9):(3'h4)])) : ($unsigned(reg146[(1'h0):(1'h0)]) ?
                               {$unsigned(reg168),
                                   $unsigned(reg145)} : reg178))};
  assign wire186 = {(+(wire182 ?
                           {reg151,
                               $unsigned(reg164)} : wire185[(2'h3):(2'h2)]))};
  assign wire187 = reg167;
  always
    @(posedge clk) begin
      reg188 <= $unsigned((8'ha2));
      reg189 <= (~^(&wire174));
      if ({(($unsigned($unsigned(reg172)) == $unsigned((reg153 ?
              reg162 : reg150))) <= wire180[(5'h11):(4'he)])})
        begin
          if ((~|$unsigned(reg162[(2'h2):(1'h1)])))
            begin
              reg190 <= $unsigned((^($signed((reg178 ? reg169 : reg167)) ?
                  ((reg151 ? wire180 : reg150) ?
                      (wire174 ?
                          reg148 : wire139) : {wire174}) : ($signed((8'hbb)) ?
                      $signed(reg149) : wire174))));
              reg191 <= (&(~^reg160[(3'h4):(2'h2)]));
            end
          else
            begin
              reg190 <= $unsigned(reg163[(3'h5):(2'h2)]);
              reg191 <= ((~^$signed($signed((!reg188)))) ?
                  ((~{$unsigned(reg151)}) ?
                      wire139[(5'h10):(4'h8)] : (^$unsigned({reg188}))) : wire186);
              reg192 <= wire185;
            end
          reg193 <= {wire177, {$signed((^$signed(reg190)))}};
          if (reg168[(1'h0):(1'h0)])
            begin
              reg194 <= wire174;
              reg195 <= {wire177,
                  $unsigned($signed($signed((reg164 & reg166))))};
              reg196 <= ((reg148[(4'hb):(4'h9)] ?
                  (^({(8'hb6), (8'h9e)} ?
                      (reg190 || wire138) : {(8'hb9)})) : ((&$signed(wire185)) ?
                      $signed((reg158 != reg151)) : (!{reg160,
                          reg143}))) || ((^~({wire174, wire142} < {(8'had)})) ?
                  $unsigned($unsigned(wire183)) : reg189));
              reg197 <= ($signed((~|$unsigned($unsigned(wire142)))) ?
                  (^~reg143) : (|(-((!(8'hb2)) ?
                      (wire186 ? reg151 : reg173) : $signed(reg153)))));
            end
          else
            begin
              reg194 <= (reg171 < wire182);
              reg195 <= (-{(&($signed((8'ha5)) ?
                      reg190[(1'h1):(1'h1)] : (reg168 ? reg149 : wire175))),
                  $unsigned($signed((|(8'hb7))))});
            end
          if ($unsigned(reg149))
            begin
              reg198 <= $signed($signed((~&(wire138[(1'h0):(1'h0)] ?
                  (reg189 * reg189) : {(8'ha3)}))));
              reg199 <= reg154[(4'hc):(2'h3)];
            end
          else
            begin
              reg198 <= ((((wire175[(3'h4):(3'h4)] > $signed((7'h44))) ?
                      $unsigned(reg144) : ({(8'h9e)} ?
                          {(8'hba), (8'hbf)} : reg194)) ^~ reg178) ?
                  (reg158 ?
                      reg173[(1'h0):(1'h0)] : $signed(($signed(wire181) ?
                          (reg178 << (8'hbf)) : (-reg192)))) : {reg191[(4'ha):(3'h4)],
                      (reg194[(1'h0):(1'h0)] ?
                          (8'haf) : (~&wire142[(4'he):(3'h7)]))});
              reg199 <= {reg189};
              reg200 <= $unsigned(((~^$signed($signed(wire176))) ?
                  $signed($unsigned((reg154 ?
                      reg144 : reg144))) : reg188[(3'h4):(1'h0)]));
              reg201 <= (-wire177[(3'h6):(2'h2)]);
              reg202 <= ((-{(~|$signed(wire142)),
                  (|$signed(reg190))}) & (+($signed((reg154 ?
                      wire182 : (8'hb9))) ?
                  (|$signed((8'hbd))) : ($signed(wire184) <<< $signed((8'hb0))))));
            end
        end
      else
        begin
          reg190 <= reg189[(2'h2):(1'h0)];
          reg191 <= $signed(({$unsigned((^~(7'h41)))} | ($unsigned((8'hbf)) >>> {{wire186},
              (~^wire174)})));
        end
    end
  assign wire203 = reg179[(5'h10):(4'hd)];
  assign wire204 = (~&(-(wire138 << {(reg163 ? reg166 : reg151), reg198})));
  assign wire205 = reg148;
  always
    @(posedge clk) begin
      if ((reg166[(2'h2):(1'h1)] ?
          ($signed(($unsigned(reg159) ?
              reg172 : $unsigned(reg167))) < $signed($signed((reg170 >>> wire174)))) : ((^$unsigned($signed(wire139))) ?
              $unsigned(reg179) : (+$unsigned({reg191})))))
        begin
          reg206 <= (((8'hb7) ?
                  $unsigned((-reg171)) : ($unsigned($signed((8'ha4))) ?
                      ((reg154 ? (8'hbd) : (8'h9d)) ?
                          (reg149 <<< reg189) : (wire140 != reg198)) : wire203[(4'ha):(4'h9)])) ?
              reg149 : (+(((wire181 ? (8'haf) : reg163) ?
                      (reg166 << wire174) : wire140[(3'h4):(1'h0)]) ?
                  (reg192 != (7'h43)) : (!wire142))));
        end
      else
        begin
          reg206 <= (~^wire180);
          reg207 <= $unsigned({wire182[(1'h1):(1'h0)]});
        end
      reg208 <= reg179;
      reg209 <= $unsigned((&$signed(($unsigned(reg168) ?
          $signed(wire187) : $signed(reg160)))));
      reg210 <= ($unsigned($signed({(reg201 ?
              wire177 : (8'had))})) <= wire183[(1'h1):(1'h1)]);
    end
  assign wire211 = ({$unsigned({$unsigned(reg156),
                           ((8'hb8) || wire142)})} || (^~reg191));
  assign wire212 = $unsigned($unsigned(($signed((|reg179)) ?
                       {reg159} : reg179)));
  assign wire213 = (({$signed((~reg170))} ?
                       reg170[(2'h2):(1'h1)] : $unsigned((&(reg198 ?
                           wire141 : reg162)))) >> ((8'ha7) || (~^($unsigned((8'hb6)) && (~|reg151)))));
endmodule

module module115
#(parameter param131 = ((!(&((8'hbf) << (!(7'h42))))) && ((^~(((8'ha8) ? (8'ha8) : (8'ha4)) - (~^(7'h42)))) >> {(8'hbf), {{(8'hb9)}}})), 
parameter param132 = (8'hb2))
(y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire120;
  input wire [(4'hb):(1'h0)] wire119;
  input wire signed [(2'h2):(1'h0)] wire118;
  input wire [(3'h7):(1'h0)] wire117;
  input wire signed [(4'hd):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire130;
  wire [(4'hf):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire [(3'h7):(1'h0)] wire126;
  wire signed [(5'h11):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire123;
  wire [(3'h6):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire121;
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 (1'h0)};
  assign wire121 = wire117;
  assign wire122 = $signed(wire119);
  assign wire123 = (wire120[(2'h2):(2'h2)] ?
                       (wire121[(3'h4):(2'h3)] ?
                           $signed(wire119[(2'h3):(2'h3)]) : wire117) : ((wire118 ^ (wire122[(3'h4):(1'h1)] == (wire119 > wire120))) ?
                           wire120 : $signed(($unsigned(wire116) ^~ $unsigned((8'hab))))));
  assign wire124 = ((^(-(8'h9f))) ?
                       wire118[(1'h1):(1'h1)] : (wire119[(1'h1):(1'h0)] ?
                           (wire116 >= $unsigned((8'ha0))) : wire122[(2'h3):(2'h3)]));
  assign wire125 = $unsigned($signed($unsigned(wire116)));
  assign wire126 = (!($signed((wire123[(4'ha):(2'h3)] ?
                           wire124 : (wire124 ? wire125 : wire121))) ?
                       ((!wire119) < ((wire119 ? wire117 : wire117) ?
                           wire116 : $signed(wire120))) : wire118));
  assign wire127 = {$signed($unsigned((~^(wire116 ? wire118 : wire118))))};
  assign wire128 = wire126[(3'h4):(2'h3)];
  assign wire129 = wire119[(2'h2):(1'h1)];
  assign wire130 = wire125[(3'h7):(1'h1)];
endmodule

module module84
#(parameter param97 = ({(((&(8'hbd)) ? ((8'hb0) ~^ (7'h40)) : ((8'haa) ? (8'ha2) : (8'ha2))) ? (8'ha6) : (((8'hae) ^ (8'hbd)) && ((8'ha6) + (8'h9f)))), (({(8'h9d), (8'h9c)} == (~(8'h9f))) ? (-{(8'ha4), (8'hb0)}) : (((7'h41) ? (8'haf) : (8'had)) ? (+(7'h40)) : (-(7'h40))))} ? (({(&(8'hab))} >>> (+{(8'hbc), (8'hb3)})) ? (~|(~^{(8'hab), (7'h42)})) : (~|(^(^~(8'hbf))))) : (((((8'had) ? (7'h41) : (8'hb9)) - (8'h9e)) ? (((8'hb8) ? (8'h9f) : (8'hb1)) ? (8'h9e) : (~^(8'hbb))) : (((8'hb5) ? (8'hba) : (8'haf)) + {(8'ha9)})) ? {(((8'ha0) ? (8'hac) : (8'had)) ? {(8'hb7)} : ((8'ha0) & (7'h43))), {{(8'h9d)}, ((8'ha8) ? (8'hab) : (8'ha0))}} : (&((+(7'h42)) < ((8'ha3) ? (8'ha5) : (8'hac)))))), 
parameter param98 = ((+(&((param97 ? param97 : param97) > (param97 ? param97 : param97)))) ? {(-param97)} : {((^{(7'h41)}) ? (param97 >>> (param97 ? param97 : (8'ha8))) : (~&param97)), (~^param97)}))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire89;
  input wire signed [(4'hb):(1'h0)] wire88;
  input wire [(2'h3):(1'h0)] wire87;
  input wire [(5'h15):(1'h0)] wire86;
  input wire [(3'h4):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire92;
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  assign y = {wire96, wire95, wire94, wire93, wire92, reg91, reg90, (1'h0)};
  always
    @(posedge clk) begin
      reg90 <= $signed(wire87);
      reg91 <= {{(((|wire89) ?
                  $signed((8'hb5)) : ((8'hac) ~^ (8'ha3))) + ($signed(wire89) ?
                  (wire86 ? wire85 : wire85) : $unsigned(wire87)))}};
    end
  assign wire92 = $unsigned((~|((~&(wire87 >>> wire89)) && ({(8'ha3), wire86} ?
                      (wire88 < (8'hb7)) : wire87))));
  assign wire93 = {{(8'had)}, (8'hb1)};
  assign wire94 = $unsigned(((($signed((8'ha3)) > (|wire85)) ~^ $signed(wire85)) ?
                      $signed({wire88,
                          wire89}) : $unsigned($unsigned($unsigned(wire93)))));
  assign wire95 = $unsigned((!(~^$signed((!wire93)))));
  assign wire96 = $unsigned(((wire92[(2'h3):(2'h2)] ?
                      (~|reg90[(2'h3):(2'h3)]) : ({wire94} ?
                          (wire93 <= wire85) : {wire95, wire85})) ^ {wire89,
                      ((wire89 <= wire85) <<< wire86[(3'h7):(3'h5)])}));
endmodule
