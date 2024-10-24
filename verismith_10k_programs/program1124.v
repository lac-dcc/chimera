module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2d0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire294;
  wire [(4'hb):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire213;
  wire signed [(5'h11):(1'h0)] wire215;
  wire signed [(2'h2):(1'h0)] wire287;
  wire signed [(3'h4):(1'h0)] wire289;
  wire signed [(5'h12):(1'h0)] wire290;
  wire signed [(4'hb):(1'h0)] wire291;
  wire [(5'h11):(1'h0)] wire292;
  reg [(4'h8):(1'h0)] reg309 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg308 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg307 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg306 = (1'h0);
  reg [(4'ha):(1'h0)] reg305 = (1'h0);
  reg [(2'h3):(1'h0)] reg304 = (1'h0);
  reg [(4'h8):(1'h0)] reg303 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg302 = (1'h0);
  reg [(5'h12):(1'h0)] reg301 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg300 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg299 = (1'h0);
  reg [(5'h14):(1'h0)] reg298 = (1'h0);
  reg [(4'h9):(1'h0)] reg297 = (1'h0);
  reg [(5'h12):(1'h0)] reg296 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg295 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire294,
                 wire4,
                 wire5,
                 wire6,
                 wire9,
                 wire10,
                 wire213,
                 wire215,
                 wire287,
                 wire289,
                 wire290,
                 wire291,
                 wire292,
                 reg309,
                 reg308,
                 reg307,
                 reg306,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = {((^$unsigned($signed((8'hbe)))) >> (((wire3 ?
                             wire3 : wire0) ~^ wire3) ?
                         wire0 : ((8'ha2) ? wire2 : (wire3 & wire2)))),
                     wire0};
  assign wire5 = wire2[(3'h4):(1'h1)];
  assign wire6 = $unsigned((wire0 >= (wire5[(5'h10):(1'h1)] ?
                     ((wire5 < wire3) ?
                         wire5 : wire2[(3'h5):(2'h2)]) : ($signed(wire5) ?
                         (wire0 ? wire1 : wire5) : $signed(wire2)))));
  always
    @(posedge clk) begin
      reg7 <= (((|$signed($signed(wire5))) ?
          $unsigned($unsigned(wire4[(4'h8):(4'h8)])) : wire3) || wire1[(2'h2):(1'h0)]);
      reg8 <= {$unsigned(wire4[(4'h8):(3'h5)])};
    end
  assign wire9 = wire6[(3'h4):(2'h2)];
  assign wire10 = ((($signed((~reg8)) ?
                      {(reg8 ?
                              wire0 : wire0)} : $signed(reg7[(4'hc):(3'h6)])) & $signed($signed({wire4,
                      (8'hab)}))) >>> (!wire2[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg11 <= (((~^(8'ha1)) ^ (!wire5[(1'h0):(1'h0)])) ?
          {wire1, (wire10 < {wire0[(2'h2):(1'h0)]})} : wire5);
      reg12 <= wire10;
      if ($unsigned((^{reg12[(2'h2):(2'h2)], reg7})))
        begin
          if ({($signed(((wire3 ? reg11 : wire9) ^ reg11[(3'h5):(1'h0)])) ?
                  $unsigned(wire5) : $unsigned($signed($signed(wire1))))})
            begin
              reg13 <= ((7'h40) ?
                  (~&$unsigned(wire9)) : ((!$signed(wire5)) && reg8[(2'h2):(1'h0)]));
            end
          else
            begin
              reg13 <= (reg11 >= (($signed((reg11 ?
                      wire2 : wire5)) >>> ((+reg12) >> (~wire1))) ?
                  (((wire2 ? reg12 : wire3) ? reg13 : ((8'haf) <= wire2)) ?
                      $signed(wire3[(3'h5):(1'h0)]) : ($unsigned(reg11) >= wire10)) : (wire6 & ((|reg11) ?
                      $signed(reg7) : (reg8 * (8'hb0))))));
              reg14 <= wire0;
              reg15 <= wire2[(2'h3):(2'h2)];
              reg16 <= $unsigned((~|reg11[(3'h7):(3'h7)]));
            end
          reg17 <= {reg13[(4'he):(4'h8)], (^~(reg13[(3'h7):(3'h5)] || reg8))};
        end
      else
        begin
          reg13 <= $unsigned((wire1 ?
              $unsigned($unsigned($unsigned(wire5))) : reg16[(1'h0):(1'h0)]));
          reg14 <= (+{wire5, (~|$unsigned(((8'ha0) ? wire4 : reg8)))});
          if (($signed(((^reg14) | (^~$signed(reg13)))) <<< reg16))
            begin
              reg15 <= ($unsigned((^~(!$signed(reg17)))) ?
                  ((($signed(wire9) ? wire0 : (wire1 <<< reg15)) ?
                          (~^(reg8 ? wire3 : reg7)) : $signed($signed(wire2))) ?
                      $signed(wire6) : (({wire2} ?
                          (wire2 ?
                              reg17 : (8'hb9)) : $signed(reg13)) || ((~reg8) ?
                          $signed(wire0) : reg17[(1'h0):(1'h0)]))) : (8'ha6));
            end
          else
            begin
              reg15 <= (wire2 - reg8[(4'h8):(2'h3)]);
              reg16 <= $unsigned((&wire0));
            end
          if (reg15)
            begin
              reg17 <= wire10[(1'h0):(1'h0)];
            end
          else
            begin
              reg17 <= ($signed($unsigned(reg17[(2'h2):(2'h2)])) << reg12[(4'h8):(4'h8)]);
              reg18 <= ((((reg8 ?
                  (&reg7) : reg12) >= (7'h42)) <= $unsigned((8'ha1))) * $unsigned(wire2));
              reg19 <= (wire3 == (8'ha5));
              reg20 <= wire10;
            end
        end
      if ({(({(~reg20)} ?
                  reg16[(1'h1):(1'h1)] : $signed(wire9[(1'h1):(1'h1)])) ?
              (+$signed($unsigned((7'h41)))) : {(-$unsigned(wire6)), (~reg15)}),
          $signed(wire10[(1'h1):(1'h1)])})
        begin
          reg21 <= wire5;
        end
      else
        begin
          if (({((^~(8'hbe)) >= reg8[(3'h6):(2'h2)]),
              ((8'hbd) <<< $signed((reg12 ?
                  reg8 : reg13)))} != reg16[(2'h2):(1'h0)]))
            begin
              reg21 <= $unsigned((+((|wire9) ?
                  ($unsigned((8'hb6)) ?
                      (reg13 >= reg20) : reg15[(2'h2):(2'h2)]) : wire2)));
              reg22 <= ($unsigned({((~&reg11) | $signed((8'hb3))),
                  ($unsigned(reg17) ?
                      reg20 : {wire3, reg8})}) <<< $unsigned(({$signed((8'ha7)),
                      reg14} ?
                  {$signed((8'hb9)), $unsigned(wire9)} : {$signed((8'ha1)),
                      $unsigned(wire4)})));
              reg23 <= (reg15 <<< reg18);
            end
          else
            begin
              reg21 <= reg23;
              reg22 <= reg20;
              reg23 <= (wire1[(4'hd):(3'h7)] ? wire9 : wire6[(2'h2):(1'h1)]);
            end
          reg24 <= wire0[(3'h6):(3'h6)];
          if ((~^({wire10} || reg12[(1'h1):(1'h0)])))
            begin
              reg25 <= (~^((8'ha8) * wire9[(1'h1):(1'h0)]));
            end
          else
            begin
              reg25 <= ($signed(reg18[(1'h0):(1'h0)]) && wire4[(2'h2):(1'h1)]);
              reg26 <= {$signed(reg18)};
              reg27 <= $signed((~((~|$unsigned(reg12)) ?
                  ((wire5 ? wire3 : reg8) ?
                      {reg11, wire5} : $unsigned(reg8)) : reg7)));
              reg28 <= {({$unsigned(wire4),
                      $signed((reg25 ?
                          reg16 : (7'h43)))} ~^ $unsigned((~|$unsigned(reg15)))),
                  $unsigned(reg18)};
              reg29 <= $unsigned(wire1[(3'h5):(2'h2)]);
            end
        end
    end
  always
    @(posedge clk) begin
      reg30 <= reg14[(3'h7):(3'h4)];
      reg31 <= reg29;
      if (wire5[(4'he):(4'h9)])
        begin
          if (((($unsigned((reg18 ? reg13 : (8'ha6))) ?
              (^(reg18 <<< reg18)) : (~|(+reg20))) + reg7) >>> $signed(wire3[(4'hc):(1'h1)])))
            begin
              reg32 <= ({reg23[(1'h1):(1'h0)]} ^ $unsigned(reg19[(1'h1):(1'h1)]));
              reg33 <= (^$unsigned($signed($signed((-reg22)))));
              reg34 <= reg18[(3'h4):(1'h0)];
            end
          else
            begin
              reg32 <= $unsigned(reg27);
              reg33 <= ((~^reg8) ^ (|(~(|reg16))));
              reg34 <= $unsigned((~^wire1));
              reg35 <= $signed((reg25 ?
                  ((~^$signed((8'had))) ?
                      $unsigned(((8'h9c) ?
                          reg17 : reg19)) : $signed(wire1[(4'h8):(3'h4)])) : ($unsigned($unsigned(reg7)) << reg32)));
              reg36 <= (($signed($signed($unsigned(reg33))) ?
                  (wire5[(2'h3):(1'h1)] ?
                      $signed(reg11) : $unsigned((reg31 ?
                          reg18 : reg18))) : reg15) * (~&(+wire9)));
            end
          reg37 <= (|$signed((8'hb1)));
        end
      else
        begin
          reg32 <= $unsigned($signed($unsigned(((!reg23) >> reg14[(3'h4):(2'h3)]))));
        end
      reg38 <= (($unsigned(wire3) ?
              $signed($signed((wire1 ? reg29 : (8'ha8)))) : reg15) ?
          reg36[(3'h6):(1'h0)] : ((!reg20[(4'h8):(3'h5)]) ?
              {({reg31, reg16} ? $signed((8'hbf)) : (wire3 ^~ reg20)),
                  (~|(reg32 ? reg36 : (8'ha8)))} : wire5[(5'h12):(3'h7)]));
      reg39 <= (~((reg8 ? (~reg18[(3'h5):(2'h2)]) : {reg31, (wire3 > reg20)}) ?
          ((reg14[(3'h5):(3'h5)] < (~^wire0)) ?
              (|(wire5 ? reg7 : (8'ha5))) : reg28) : ($unsigned((reg18 ?
                  (8'hb4) : reg24)) ?
              {reg28[(1'h0):(1'h0)]} : {(reg13 ? reg8 : reg38)})));
    end
  always
    @(posedge clk) begin
      reg40 <= (reg19 ^ wire10[(2'h2):(1'h1)]);
      reg41 <= $unsigned(($signed($unsigned((~reg28))) || $signed(reg39)));
      reg42 <= $unsigned((({$unsigned(reg21)} ? reg16 : reg29) ?
          $unsigned((-$signed(wire10))) : reg41));
    end
  module43 #() modinst214 (wire213, clk, reg32, reg39, wire9, wire1);
  assign wire215 = ((&reg24[(2'h2):(1'h0)]) ?
                       $unsigned(reg29) : {$signed((^$unsigned((8'hb0)))),
                           reg36[(3'h6):(2'h3)]});
  module216 #() modinst288 (.clk(clk), .wire217(wire6), .wire221(wire0), .wire218(reg32), .wire220(reg41), .y(wire287), .wire219(reg33));
  assign wire289 = (^~$signed({{reg17}, $unsigned(reg41)}));
  assign wire290 = ({$signed($signed($unsigned((8'hbb))))} ?
                       $signed((reg22 ~^ ((reg11 << reg36) ?
                           $signed((8'ha7)) : (reg26 < reg40)))) : ($unsigned(({reg26} <= reg20[(3'h6):(3'h5)])) ?
                           (|({wire6} ?
                               reg29[(3'h7):(3'h7)] : (reg26 ?
                                   (8'hb1) : (8'h9c)))) : wire9));
  assign wire291 = reg19[(3'h4):(1'h0)];
  module166 #() modinst293 (wire292, clk, reg29, wire215, wire213, wire6);
  assign wire294 = {((-$signed((reg41 ?
                           reg42 : (8'hb9)))) != $signed(((~reg28) ?
                           {reg20} : wire292)))};
  always
    @(posedge clk) begin
      reg295 <= reg29;
      if ((!($signed(reg7[(4'hf):(3'h6)]) ? $unsigned(wire291) : reg13)))
        begin
          reg296 <= (^~(^~reg14[(5'h10):(4'ha)]));
          reg297 <= ((($signed(reg28[(3'h6):(3'h4)]) ?
              ($unsigned(wire292) ?
                  (reg26 * reg42) : $signed(reg35)) : (wire292[(1'h1):(1'h1)] >>> (!reg27))) >> reg32[(4'hc):(3'h7)]) <<< reg21[(3'h5):(3'h4)]);
          reg298 <= {wire5};
        end
      else
        begin
          reg296 <= (reg36[(2'h2):(1'h1)] && reg295[(3'h7):(3'h5)]);
          reg297 <= reg296[(3'h4):(2'h3)];
          reg298 <= {$signed(reg39[(1'h1):(1'h0)]),
              (reg295[(3'h6):(1'h1)] ?
                  ({(reg12 ? reg17 : wire289), reg36} ?
                      $unsigned((+(8'hac))) : $signed(reg34[(2'h2):(1'h1)])) : (reg33[(3'h5):(2'h3)] ?
                      (^(&(7'h41))) : ($signed(wire213) ^~ $unsigned(wire1))))};
        end
      if (({reg13[(4'ha):(2'h3)],
          ((reg28[(5'h10):(4'hc)] << (reg297 > reg11)) | $unsigned((reg26 == wire9)))} | $signed((|$signed($signed((8'ha2)))))))
        begin
          reg299 <= (8'ha1);
          reg300 <= ($signed((^$signed((~|(8'hac))))) <<< ($signed({wire215[(3'h6):(1'h0)],
              $unsigned(wire5)}) <<< (($unsigned(reg38) << wire2) != reg35)));
          reg301 <= (wire213[(2'h2):(2'h2)] * ($unsigned(reg14) || (+(~wire292))));
          reg302 <= {{$signed(((~|reg23) & wire290)), reg32},
              $signed($unsigned(wire0))};
        end
      else
        begin
          reg299 <= reg20[(4'hc):(3'h5)];
          reg300 <= $unsigned((!$signed($unsigned($signed((8'hbe))))));
          if ($unsigned(reg33[(5'h11):(2'h2)]))
            begin
              reg301 <= $unsigned(((($unsigned(reg16) ^ (~^(8'hb2))) > {$signed((8'hb2))}) >> (wire6[(4'hd):(3'h7)] ?
                  (^~$signed(reg25)) : reg17)));
              reg302 <= $signed((~|{$signed((reg302 ? reg301 : (8'h9d)))}));
              reg303 <= {{($signed(reg21) != ($unsigned(reg35) ?
                          (|reg21) : (reg296 ? reg37 : reg27))),
                      ($signed((reg18 ? reg31 : reg296)) ?
                          wire0[(4'hc):(3'h6)] : {$unsigned(reg33), wire4})},
                  reg25};
              reg304 <= $unsigned((~&{$unsigned($signed(wire0))}));
            end
          else
            begin
              reg301 <= $unsigned($unsigned(wire294));
              reg302 <= (wire9 ?
                  $signed(({wire4[(3'h6):(1'h1)],
                      $signed(reg25)} > $unsigned(reg24))) : reg304[(2'h3):(1'h1)]);
              reg303 <= reg16;
              reg304 <= {reg30[(2'h2):(2'h2)],
                  (($signed(reg21[(1'h0):(1'h0)]) ?
                      ({reg300, reg14} >>> {wire291,
                          wire9}) : (+reg18[(3'h4):(1'h0)])) <= reg42)};
            end
        end
      if ((|(8'hbf)))
        begin
          reg305 <= (^$unsigned((8'hac)));
        end
      else
        begin
          reg305 <= (8'hb8);
          reg306 <= reg301[(3'h5):(2'h2)];
          reg307 <= reg11[(3'h7):(3'h7)];
          reg308 <= ($unsigned(($signed(reg305[(4'h8):(1'h1)]) - $unsigned((reg12 ^~ reg22)))) ?
              (^~wire292) : reg32);
          reg309 <= (8'hab);
        end
    end
endmodule

module module216
#(parameter param285 = (|(({{(8'hb1), (7'h40)}, (^~(8'ha7))} ^~ (((8'ha1) ^~ (8'ha3)) ? (~&(8'hbf)) : (^~(8'haa)))) ~^ {((^~(8'ha3)) <= (|(8'hb4)))})), 
parameter param286 = param285)
(y, clk, wire221, wire220, wire219, wire218, wire217);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire221;
  input wire signed [(3'h7):(1'h0)] wire220;
  input wire signed [(5'h14):(1'h0)] wire219;
  input wire [(4'hc):(1'h0)] wire218;
  input wire [(2'h2):(1'h0)] wire217;
  wire [(5'h15):(1'h0)] wire284;
  wire signed [(4'hc):(1'h0)] wire282;
  wire [(4'h9):(1'h0)] wire240;
  wire signed [(5'h14):(1'h0)] wire239;
  wire [(3'h7):(1'h0)] wire238;
  wire signed [(2'h3):(1'h0)] wire237;
  wire [(4'ha):(1'h0)] wire236;
  wire signed [(5'h14):(1'h0)] wire231;
  reg signed [(4'hf):(1'h0)] reg222 = (1'h0);
  reg [(5'h15):(1'h0)] reg223 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg224 = (1'h0);
  reg [(5'h12):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg226 = (1'h0);
  reg [(4'ha):(1'h0)] reg227 = (1'h0);
  reg [(5'h10):(1'h0)] reg228 = (1'h0);
  reg [(5'h15):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg230 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg232 = (1'h0);
  reg [(5'h14):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg234 = (1'h0);
  reg [(2'h2):(1'h0)] reg235 = (1'h0);
  reg signed [(4'he):(1'h0)] reg241 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg242 = (1'h0);
  assign y = {wire284,
                 wire282,
                 wire240,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire231,
                 reg222,
                 reg223,
                 reg224,
                 reg225,
                 reg226,
                 reg227,
                 reg228,
                 reg229,
                 reg230,
                 reg232,
                 reg233,
                 reg234,
                 reg235,
                 reg241,
                 reg242,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg222 <= (+$signed(((~|(^~wire217)) ~^ wire219[(5'h12):(3'h7)])));
      reg223 <= $signed($signed(reg222));
      reg224 <= ($signed((~(+{reg223, reg223}))) << reg223[(1'h0):(1'h0)]);
      reg225 <= wire221;
      reg226 <= wire219;
    end
  always
    @(posedge clk) begin
      reg227 <= $unsigned((~reg224[(3'h7):(2'h3)]));
      reg228 <= wire218[(2'h3):(1'h1)];
      reg229 <= wire218;
      reg230 <= $unsigned(reg229[(1'h1):(1'h0)]);
    end
  assign wire231 = $unsigned((~&($unsigned({reg226}) ?
                       ($signed(reg226) ^ $unsigned(wire221)) : reg230[(4'hf):(4'hf)])));
  always
    @(posedge clk) begin
      reg232 <= reg228;
      reg233 <= reg227[(4'ha):(3'h7)];
      reg234 <= $signed($unsigned(($unsigned((+reg223)) ?
          (&reg230) : $signed(wire220))));
      reg235 <= (8'hbc);
    end
  assign wire236 = ($signed((((reg225 ^ reg224) <<< {reg232}) && $unsigned($unsigned(wire217)))) ?
                       reg229[(1'h1):(1'h0)] : reg229);
  assign wire237 = (!reg224);
  assign wire238 = $signed((!$signed((~^((8'ha3) != reg232)))));
  assign wire239 = (8'hae);
  assign wire240 = $signed(({(wire220 || $unsigned(wire231))} || reg234[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg241 <= $unsigned(wire238);
      reg242 <= reg227;
    end
  module243 #() modinst283 (wire282, clk, reg222, wire231, reg241, wire220, reg229);
  assign wire284 = {{(-reg232)}, (~^reg234)};
endmodule

module module43
#(parameter param212 = {(^((~^((8'hb2) ? (8'hb6) : (8'h9d))) > (8'h9e))), (&((((7'h41) >>> (8'hab)) != ((8'hb5) <= (8'ha5))) == (((8'ha0) * (8'ha7)) ? ((8'haf) ? (8'hae) : (8'hb6)) : ((8'haa) ? (8'hb4) : (8'hb0)))))})
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire47;
  input wire signed [(3'h4):(1'h0)] wire46;
  input wire [(5'h15):(1'h0)] wire45;
  input wire [(5'h14):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire164;
  wire [(4'hd):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire210;
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  assign y = {wire164,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire58,
                 wire57,
                 wire56,
                 wire48,
                 wire210,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 (1'h0)};
  assign wire48 = {($unsigned($unsigned(wire44)) != wire44[(5'h12):(4'hb)]),
                      wire47};
  always
    @(posedge clk) begin
      if ((wire44[(5'h13):(4'h8)] && $signed((wire45 <<< wire46[(2'h2):(1'h0)]))))
        begin
          reg49 <= {$signed({{{wire44}}}),
              (wire46 < (($signed(wire44) ?
                      $signed(wire46) : $unsigned(wire47)) ?
                  $unsigned({wire46}) : $unsigned({wire47, wire46})))};
          reg50 <= $unsigned(wire45[(4'h8):(4'h8)]);
          reg51 <= ($signed(reg50[(1'h0):(1'h0)]) ?
              wire48[(4'hc):(4'hb)] : (($signed((wire44 | reg50)) ?
                      {$signed(wire47), wire47} : (reg49[(4'h8):(2'h2)] ?
                          $signed(wire46) : $signed(reg49))) ?
                  (wire48 ?
                      ($signed(reg50) ~^ $unsigned(reg49)) : $signed(wire48[(4'he):(4'hc)])) : $unsigned(({(8'h9d)} ?
                      (reg49 <<< wire48) : $signed(reg50)))));
          reg52 <= wire46;
        end
      else
        begin
          reg49 <= $unsigned({reg50});
        end
      reg53 <= (^~($signed($signed(reg52[(5'h10):(4'ha)])) >>> $signed(((reg52 ?
          wire46 : reg50) & reg49))));
      reg54 <= (($signed((wire46[(1'h1):(1'h0)] ?
          (wire44 ?
              wire44 : reg51) : $signed((8'hb0)))) >>> $unsigned(reg52)) < (8'h9e));
      reg55 <= $unsigned((~^$unsigned((~&(reg50 || (7'h40))))));
    end
  assign wire56 = $unsigned({(+{reg51, (^wire48)}), reg49});
  assign wire57 = $unsigned(($unsigned((~^((8'hb9) >= (7'h43)))) ?
                      (|$signed($unsigned(wire48))) : ((~reg55) ?
                          $unsigned((|reg54)) : {(+reg53), {reg53, reg49}})));
  assign wire58 = (wire48 ?
                      $unsigned((~^reg50[(1'h1):(1'h0)])) : (wire45[(3'h5):(3'h5)] ?
                          (~reg52[(4'h8):(1'h0)]) : ((+(wire48 ?
                                  wire56 : wire45)) ?
                              ((reg53 || reg55) ^ ((8'hab) ?
                                  reg55 : (8'h9f))) : {(wire44 << wire56)})));
  always
    @(posedge clk) begin
      if ($signed(reg53[(3'h6):(2'h2)]))
        begin
          reg59 <= wire46[(1'h1):(1'h0)];
          reg60 <= ($signed($unsigned(reg59[(2'h3):(2'h2)])) ?
              reg49[(1'h1):(1'h0)] : $unsigned((~^reg55[(3'h5):(1'h1)])));
          if ($unsigned((!reg49[(1'h1):(1'h1)])))
            begin
              reg61 <= $signed((+reg55));
              reg62 <= (wire48[(5'h13):(3'h5)] || wire44[(4'hc):(4'h9)]);
              reg63 <= reg50[(1'h0):(1'h0)];
              reg64 <= (!(^(~^reg50[(2'h2):(1'h0)])));
              reg65 <= (^(((reg50[(2'h2):(1'h0)] ?
                  (&reg52) : $signed(reg50)) < wire44) ^ reg59));
            end
          else
            begin
              reg61 <= ((wire44[(4'hd):(2'h2)] > wire44) ?
                  (reg63[(1'h1):(1'h0)] ~^ wire44) : wire46);
              reg62 <= $unsigned((($unsigned((wire46 ?
                  wire58 : reg64)) >= $unsigned(reg50[(2'h2):(1'h0)])) & (wire45[(3'h4):(1'h1)] >> (|wire44))));
              reg63 <= reg54;
            end
        end
      else
        begin
          reg59 <= $unsigned($signed((!($signed(reg50) >= $unsigned((8'hb9))))));
          reg60 <= $unsigned(({wire57[(4'he):(4'hb)]} - wire58[(3'h5):(1'h1)]));
          reg61 <= wire48;
          reg62 <= $signed((^(&(^$unsigned(wire44)))));
        end
      if ((wire58 >> $signed((-wire48))))
        begin
          if ((-(wire44[(1'h1):(1'h0)] != ((~^wire48[(3'h6):(3'h4)]) ?
              {(reg61 ? wire56 : reg61)} : (!$signed(reg49))))))
            begin
              reg66 <= ((^$unsigned(wire45)) ?
                  wire46 : ($unsigned(reg60[(3'h5):(1'h1)]) ?
                      ($unsigned({wire44}) ~^ {$unsigned(wire45),
                          wire47}) : $unsigned(($unsigned((8'ha8)) ?
                          $signed(reg49) : reg55))));
            end
          else
            begin
              reg66 <= ((^$signed(reg59)) ?
                  {$unsigned(wire58[(3'h5):(2'h3)]),
                      (wire48[(3'h4):(1'h0)] < wire56[(4'ha):(3'h6)])} : ($unsigned({(reg49 > reg53),
                      (!wire48)}) ^~ (^~$signed((reg50 ? wire58 : reg52)))));
              reg67 <= $unsigned((8'hb2));
            end
          reg68 <= (~^($signed(wire46) ?
              {(((8'h9d) ~^ (7'h43)) ? $signed(reg49) : (~wire46)),
                  $signed((^wire58))} : ($signed($signed(reg54)) == reg62)));
        end
      else
        begin
          reg66 <= reg60;
          reg67 <= (reg64[(4'ha):(2'h3)] ?
              $signed((reg49[(4'h8):(2'h2)] >>> (-(wire46 * reg55)))) : (|($unsigned($unsigned(reg60)) && (~^{wire44}))));
        end
      reg69 <= $signed(wire46);
      reg70 <= (^({wire45} ? (8'hb4) : (^~((^wire48) < reg50[(1'h0):(1'h0)]))));
      reg71 <= reg65[(3'h4):(2'h2)];
    end
  assign wire72 = $unsigned(reg60);
  assign wire73 = {$unsigned(((reg60[(1'h1):(1'h1)] ^ wire44[(3'h5):(1'h1)]) - $unsigned(reg52[(5'h12):(1'h1)]))),
                      reg70[(3'h6):(2'h2)]};
  assign wire74 = ({$unsigned((wire45 ~^ ((8'ha9) ^~ reg50))), reg53} ?
                      $unsigned(((~(!(8'hac))) ?
                          reg53 : ($signed(reg55) << $signed(wire56)))) : $unsigned(((^~(-wire73)) >= reg68)));
  assign wire75 = ((wire48 & wire72) ?
                      reg51[(4'ha):(1'h0)] : (-(^$unsigned(reg59[(3'h4):(1'h1)]))));
  module76 #() modinst165 (.wire78(reg51), .y(wire164), .wire80(wire45), .wire77(reg50), .wire79(reg64), .clk(clk), .wire81(reg63));
  module166 #() modinst211 (wire210, clk, wire48, reg52, reg49, reg66);
endmodule

module module166
#(parameter param208 = (^((-(^~((8'hbf) ? (7'h43) : (8'ha6)))) ? (((~^(8'hbe)) ? {(8'ha9)} : ((8'hbc) ? (8'ha6) : (8'ha2))) >= ((!(8'hb8)) ? (8'ha0) : ((8'hb0) ? (8'hae) : (8'hae)))) : (-({(8'hb0)} * (^~(8'hac)))))), 
parameter param209 = (((^(+{param208, param208})) ? (param208 < ((+(8'hbf)) < param208)) : (param208 + ({param208} | param208))) ? (~^(param208 ? param208 : param208)) : (param208 >> (|((param208 & param208) <<< (param208 ^~ param208))))))
(y, clk, wire170, wire169, wire168, wire167);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire170;
  input wire [(4'ha):(1'h0)] wire169;
  input wire [(5'h13):(1'h0)] wire168;
  input wire signed [(5'h14):(1'h0)] wire167;
  wire [(4'h8):(1'h0)] wire205;
  wire [(5'h10):(1'h0)] wire204;
  wire [(4'hb):(1'h0)] wire200;
  wire [(3'h6):(1'h0)] wire199;
  wire signed [(3'h7):(1'h0)] wire198;
  wire signed [(3'h6):(1'h0)] wire197;
  wire signed [(3'h6):(1'h0)] wire183;
  wire signed [(5'h14):(1'h0)] wire175;
  wire [(4'ha):(1'h0)] wire174;
  wire [(2'h2):(1'h0)] wire173;
  wire signed [(3'h6):(1'h0)] wire172;
  wire signed [(4'hf):(1'h0)] wire171;
  reg signed [(3'h5):(1'h0)] reg207 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg202 = (1'h0);
  reg [(2'h2):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg196 = (1'h0);
  reg [(3'h7):(1'h0)] reg195 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg191 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  reg [(3'h5):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(4'hd):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg176 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire183,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 reg207,
                 reg206,
                 reg203,
                 reg202,
                 reg201,
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
                 reg184,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 (1'h0)};
  assign wire171 = (!$signed(((7'h41) ?
                       $unsigned((wire167 - wire168)) : $signed((wire169 ?
                           wire170 : wire168)))));
  assign wire172 = wire169;
  assign wire173 = $signed($signed($unsigned($signed($unsigned(wire171)))));
  assign wire174 = $signed((^~{(-wire173)}));
  assign wire175 = wire169;
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire169[(2'h3):(2'h3)])))
        begin
          reg176 <= (^$unsigned(wire171));
          reg177 <= {$signed(wire170),
              (wire171 ?
                  ($signed((8'h9e)) ?
                      (~^{(8'hb0)}) : $unsigned(wire175[(4'he):(4'hc)])) : wire167)};
        end
      else
        begin
          reg176 <= ($unsigned(({wire174[(2'h3):(1'h0)], $signed(wire173)} ?
                  (~$unsigned(wire167)) : wire167[(1'h0):(1'h0)])) ?
              $signed($signed((wire169 ~^ wire171[(1'h0):(1'h0)]))) : $unsigned(wire175[(5'h11):(1'h1)]));
          if (($unsigned((!(wire169 ? wire174[(3'h5):(2'h3)] : {wire172}))) ?
              $unsigned(($signed({reg177, wire174}) ?
                  wire173 : $signed(wire167))) : $signed(wire174[(1'h0):(1'h0)])))
            begin
              reg177 <= ((^~wire175[(4'hd):(4'hc)]) ?
                  reg177 : (((-(8'ha1)) - {{reg177,
                          (8'h9c)}}) | ($unsigned($unsigned(wire171)) ?
                      $unsigned(((8'hb5) >= wire171)) : {wire169})));
              reg178 <= ((+$unsigned((-{wire174}))) ?
                  ((^~$unsigned(((8'hbe) ? wire167 : wire172))) ?
                      (wire169 != $signed(wire170)) : (~&{wire174[(1'h1):(1'h1)]})) : {reg177,
                      $signed(wire169[(4'h9):(4'h8)])});
              reg179 <= {(~^{wire172})};
              reg180 <= (((~|($unsigned(reg177) ?
                  wire167 : {wire167,
                      wire169})) == wire175) | (wire175[(1'h0):(1'h0)] ?
                  {((!wire171) ? (wire172 * wire167) : $signed(wire168)),
                      (~|(wire170 ? wire175 : wire172))} : $signed(((wire168 ?
                          wire170 : wire171) ?
                      $signed(wire171) : ((8'ha8) + wire171)))));
            end
          else
            begin
              reg177 <= (-((-wire174[(2'h2):(1'h0)]) ?
                  ($unsigned(wire167[(3'h5):(2'h3)]) ^~ ($unsigned(reg178) == ((8'hb3) ?
                      wire168 : (8'ha9)))) : (((-wire174) || $unsigned((8'hbb))) ?
                      {{reg177}, wire171} : (-reg180[(4'h9):(1'h0)]))));
              reg178 <= wire167;
              reg179 <= wire169[(3'h6):(3'h5)];
              reg180 <= wire171[(4'hf):(4'hf)];
            end
          reg181 <= $unsigned(($unsigned(($unsigned(wire175) ?
                  (wire170 ? wire175 : (7'h44)) : reg178[(4'ha):(2'h2)])) ?
              {($unsigned(reg177) >= wire169),
                  reg176[(2'h3):(1'h0)]} : {(reg179 + $unsigned(reg177)),
                  wire172}));
          reg182 <= (~&(|reg178));
        end
    end
  assign wire183 = wire174;
  always
    @(posedge clk) begin
      if (reg178)
        begin
          reg184 <= $unsigned(((reg181[(2'h3):(1'h1)] ?
                  reg180[(3'h6):(2'h2)] : $signed($signed(reg181))) ?
              wire168[(4'he):(2'h3)] : (!(|(reg179 ? wire170 : wire173)))));
          reg185 <= reg176;
          if ($unsigned((((+((8'hb8) ?
                  (8'haa) : reg180)) & ($signed(wire183) > wire167[(2'h2):(1'h0)])) ?
              $signed(reg178[(4'hd):(1'h0)]) : $unsigned(wire169))))
            begin
              reg186 <= {$unsigned((~^wire175[(4'he):(4'h8)])), wire175};
              reg187 <= $signed((8'ha9));
              reg188 <= ({$unsigned({$signed(reg182),
                      $unsigned(wire174)})} * reg182[(4'he):(3'h6)]);
              reg189 <= (8'ha8);
              reg190 <= reg178[(1'h0):(1'h0)];
            end
          else
            begin
              reg186 <= ($unsigned($unsigned((^~((7'h41) ?
                      wire173 : reg184)))) ?
                  wire169[(3'h5):(1'h0)] : ((wire175 <= (^wire167)) ?
                      $unsigned(((wire167 >> (8'hb0)) ?
                          (reg179 ~^ reg190) : $unsigned((8'haa)))) : ($unsigned($unsigned(reg189)) ?
                          (~|(8'ha9)) : reg176)));
            end
          if ($unsigned((!$unsigned(reg187))))
            begin
              reg191 <= wire169;
              reg192 <= $unsigned($signed(reg179[(2'h2):(1'h0)]));
              reg193 <= wire172[(1'h1):(1'h0)];
              reg194 <= ($unsigned({(reg188 ^ (wire183 ? reg180 : reg191)),
                  $unsigned(reg185[(1'h1):(1'h1)])}) | {reg189[(5'h11):(4'h9)],
                  (|$unsigned((wire174 ? reg193 : reg189)))});
            end
          else
            begin
              reg191 <= (~(~^(~&(reg176 <= (reg177 < (8'haa))))));
              reg192 <= ((($signed(reg191[(4'hd):(2'h2)]) ?
                  ((wire175 <<< (7'h43)) ?
                      ((8'hac) ^ wire169) : reg178[(3'h4):(1'h0)]) : reg176) ^ $unsigned(reg178[(3'h7):(1'h0)])) - reg190);
            end
          reg195 <= $unsigned(({reg188,
              ($signed(reg176) ?
                  (8'ha1) : reg184[(4'hb):(3'h6)])} >> (reg184[(4'hf):(3'h6)] <= $unsigned($unsigned(reg189)))));
        end
      else
        begin
          reg184 <= ($unsigned($unsigned(reg188)) * ((~^reg187[(4'ha):(3'h6)]) ?
              $signed({reg179,
                  (reg193 ? reg190 : wire172)}) : (|$signed((~|reg176)))));
          reg185 <= (reg194[(3'h7):(3'h4)] ?
              $signed(wire183) : reg187[(3'h5):(3'h5)]);
          reg186 <= {$unsigned(reg182)};
          reg187 <= {$unsigned(($unsigned(wire183) <<< (reg191 != wire172)))};
        end
      reg196 <= $unsigned((&(reg189 ?
          ((reg176 & reg194) == {reg182,
              (8'hb1)}) : $unsigned(((7'h41) < (8'hb6))))));
    end
  assign wire197 = (^~wire171);
  assign wire198 = wire172[(1'h1):(1'h0)];
  assign wire199 = $unsigned(($signed($signed((^reg192))) > reg194[(4'h8):(1'h0)]));
  assign wire200 = ($unsigned((~^(reg185 && wire167[(4'h8):(4'h8)]))) <<< {(reg182 ?
                           $signed((reg187 - wire197)) : reg182[(2'h2):(1'h0)])});
  always
    @(posedge clk) begin
      reg201 <= $unsigned(reg181[(3'h7):(3'h4)]);
      reg202 <= wire199;
      reg203 <= $signed((+reg188[(2'h3):(2'h3)]));
    end
  assign wire204 = ($unsigned(({$unsigned(wire199), reg193[(2'h2):(1'h1)]} ?
                           (~&(^reg202)) : reg194)) ?
                       ((reg203[(4'hd):(3'h6)] ^~ reg189) | wire168) : $signed($signed(wire171)));
  assign wire205 = ((((((8'h9e) <= reg201) ? wire197 : (!reg192)) ?
                               {$unsigned(wire204),
                                   $unsigned((8'hb5))} : $signed((~|wire183))) ?
                           (reg184[(5'h12):(4'hb)] ?
                               ((reg191 ? wire175 : reg179) ?
                                   {reg190,
                                       reg196} : $signed((8'haf))) : {$signed(reg187)}) : $unsigned(reg177)) ?
                       {($signed(wire167[(4'h8):(2'h3)]) ?
                               (wire199 ?
                                   $unsigned(reg191) : (|wire204)) : $signed((~(8'hba))))} : $unsigned((((!reg181) << $unsigned((8'ha3))) >= ((&wire183) & ((8'ha5) ?
                           wire175 : wire167)))));
  always
    @(posedge clk) begin
      reg206 <= {(8'haf),
          ($unsigned(($unsigned((8'hb1)) ?
              $unsigned((8'hb5)) : reg195[(3'h5):(2'h2)])) << (reg186 >> (^((7'h40) ?
              wire204 : wire174))))};
      reg207 <= ($unsigned($unsigned((wire204[(4'hb):(3'h5)] > $signed(wire169)))) + ((((wire183 > reg184) ^ $signed(reg181)) < $unsigned($signed(reg185))) ?
          ($signed(reg189) ?
              wire167[(3'h5):(2'h2)] : wire204[(4'he):(4'hd)]) : (8'hb2)));
    end
endmodule

module module76
#(parameter param163 = (~^(~&((|((8'ha0) ? (8'haa) : (8'hbb))) ? (((8'hae) ? (8'hb4) : (8'ha1)) ? {(8'ha8)} : ((8'h9f) ? (8'hb7) : (8'ha5))) : (~^{(8'hbc)})))))
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h3df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire81;
  input wire signed [(4'he):(1'h0)] wire80;
  input wire signed [(4'hd):(1'h0)] wire79;
  input wire signed [(5'h13):(1'h0)] wire78;
  input wire signed [(5'h14):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire131;
  wire signed [(3'h7):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(4'hb):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire117;
  wire [(3'h7):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire82;
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(5'h12):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire117,
                 wire116,
                 wire115,
                 wire105,
                 wire83,
                 wire82,
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
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire82 = (wire81 ? $signed(wire77[(3'h6):(1'h0)]) : (8'hb4));
  assign wire83 = ($signed($unsigned((-wire78[(3'h4):(1'h0)]))) ?
                      {wire80,
                          $signed(wire80)} : $signed((wire80 * $signed($unsigned((8'hbf))))));
  always
    @(posedge clk) begin
      reg84 <= wire77[(5'h10):(4'hc)];
      if ((~|(wire79 ?
          {$signed(((8'hae) ? wire79 : wire80)),
              $unsigned((&wire83))} : (-(~&$signed(wire82))))))
        begin
          reg85 <= (wire82[(3'h6):(3'h6)] << reg84[(1'h1):(1'h1)]);
          reg86 <= $signed($signed(wire80[(4'hb):(1'h1)]));
          if (wire79)
            begin
              reg87 <= wire78;
              reg88 <= $unsigned((&(&((wire78 ?
                  wire79 : wire81) >= (^~reg84)))));
            end
          else
            begin
              reg87 <= ($unsigned(reg87) == $signed($signed($unsigned(wire81))));
              reg88 <= reg84[(3'h4):(2'h2)];
              reg89 <= reg85;
              reg90 <= $unsigned($unsigned($unsigned(($unsigned(wire78) ?
                  $unsigned(wire82) : (wire80 && wire79)))));
            end
          reg91 <= $signed(($signed((wire80 <<< wire77[(3'h7):(3'h5)])) ?
              $signed((^(|wire82))) : $signed((|(reg84 <<< reg86)))));
          reg92 <= (~|$signed(wire82));
        end
      else
        begin
          reg85 <= reg85[(3'h4):(2'h2)];
          reg86 <= reg89;
        end
      reg93 <= (reg86 - {(8'h9c), $signed((^~(+wire81)))});
      reg94 <= ($unsigned((+((^wire81) || $unsigned((8'h9d))))) << wire81);
      if (($signed((^~$signed((wire79 ? reg89 : wire83)))) ?
          (+((wire77 ?
              ((7'h41) ?
                  reg88 : wire77) : $signed(reg88)) <= (reg91[(1'h0):(1'h0)] || (wire81 ?
              reg89 : reg91)))) : wire78[(3'h4):(2'h2)]))
        begin
          reg95 <= ($unsigned((!(((8'hb7) >>> reg93) <<< $unsigned((8'h9d))))) | reg86[(4'h8):(3'h7)]);
          reg96 <= {(!wire80), reg90};
          reg97 <= $unsigned($signed((8'ha8)));
        end
      else
        begin
          if ($signed($signed((reg87[(1'h1):(1'h1)] + $signed({reg97,
              wire82})))))
            begin
              reg95 <= $signed((!reg87[(4'h9):(2'h3)]));
              reg96 <= $unsigned({$signed(($signed(wire79) ?
                      $signed(reg94) : $signed((8'hbc))))});
              reg97 <= $unsigned((-$unsigned((((8'haa) ? reg94 : reg89) ?
                  (8'hbe) : wire78))));
              reg98 <= $signed((~^$signed(((wire77 < wire82) ~^ $signed(reg86)))));
            end
          else
            begin
              reg95 <= ((~(+$signed((wire77 ?
                  reg89 : wire82)))) ^~ reg84[(1'h1):(1'h1)]);
              reg96 <= reg85[(2'h2):(2'h2)];
              reg97 <= reg98[(3'h4):(3'h4)];
              reg98 <= wire81[(5'h15):(4'h9)];
              reg99 <= (8'h9d);
            end
          reg100 <= $signed({(~|((+reg89) ?
                  {reg96, reg85} : reg94[(1'h0):(1'h0)]))});
          if ((((~|reg87[(3'h4):(1'h1)]) ~^ reg86[(4'hf):(2'h2)]) ?
              $signed(wire81[(5'h13):(3'h6)]) : (~|($unsigned(reg96[(2'h2):(1'h0)]) >= $unsigned(reg91[(1'h1):(1'h0)])))))
            begin
              reg101 <= ($signed($unsigned($unsigned($signed(reg88)))) ?
                  ($unsigned(reg90[(2'h2):(1'h0)]) >> {$signed($signed(reg91)),
                      ($unsigned(reg98) ?
                          (8'ha5) : reg98)}) : $unsigned(($unsigned($signed(wire81)) == $unsigned((reg84 ~^ reg94)))));
              reg102 <= reg90;
              reg103 <= {wire82[(3'h7):(3'h6)]};
              reg104 <= $unsigned($unsigned(((&(wire81 < reg95)) == {$signed((7'h42))})));
            end
          else
            begin
              reg101 <= $unsigned(reg90);
            end
        end
    end
  assign wire105 = {((((wire80 ? reg89 : wire78) & (8'hb9)) ~^ (((7'h42) ?
                           reg101 : reg85) == reg92[(3'h4):(2'h2)])) ~^ ((!wire83) != $unsigned(reg92[(3'h5):(2'h2)]))),
                       (~|(~^($unsigned(reg90) ? reg103 : $signed(reg101))))};
  always
    @(posedge clk) begin
      if (((!reg87[(3'h5):(2'h3)]) ?
          $unsigned($signed({(reg88 ? reg89 : reg99)})) : reg92[(3'h4):(2'h3)]))
        begin
          reg106 <= $unsigned((reg97[(3'h5):(3'h5)] + $unsigned((^~$signed(wire80)))));
          reg107 <= ((reg106[(2'h2):(1'h0)] ?
              (reg101[(4'h8):(3'h6)] ?
                  {$unsigned(wire77)} : (reg90[(1'h1):(1'h0)] ?
                      ((8'ha5) + reg88) : reg100[(3'h5):(3'h5)])) : $unsigned({reg98,
                  (|reg92)})) < ((8'hbe) ?
              $unsigned(wire78[(4'h8):(3'h4)]) : ((((8'h9f) < reg96) ?
                  {reg98, reg91} : (~&(8'ha1))) & ({reg104,
                  wire82} >= reg84))));
        end
      else
        begin
          reg106 <= (~$unsigned(($signed($signed(reg95)) ^~ (^~$signed(reg87)))));
        end
      reg108 <= ($signed(($unsigned(reg98) ? reg95 : reg91[(3'h4):(2'h3)])) ?
          (~&(~&(+reg98))) : (wire105[(4'ha):(3'h7)] ?
              (~&$signed({reg86,
                  reg93})) : $signed($unsigned($signed(reg93)))));
      reg109 <= $signed(wire81);
      reg110 <= ($signed((-$unsigned(wire80))) <= $unsigned((reg107[(1'h1):(1'h0)] <= $unsigned((reg88 ?
          wire79 : reg86)))));
      if ($unsigned(wire78))
        begin
          reg111 <= (^($unsigned($unsigned($signed(reg104))) ~^ {$signed((+reg99)),
              reg100[(3'h4):(1'h0)]}));
        end
      else
        begin
          reg111 <= $unsigned((!reg95[(5'h10):(1'h1)]));
          reg112 <= $signed(reg89);
          reg113 <= wire82[(1'h1):(1'h0)];
          reg114 <= ((~|(8'ha1)) ?
              ((^(7'h43)) ?
                  $unsigned($unsigned((reg86 ^~ reg103))) : $signed((-reg92))) : reg109[(2'h3):(2'h3)]);
        end
    end
  assign wire115 = ((reg92 ?
                       $signed($signed((reg95 || wire78))) : reg96[(2'h3):(1'h0)]) & $unsigned($unsigned(reg99[(4'h8):(2'h3)])));
  assign wire116 = ((reg92 ?
                       reg86 : (wire83[(5'h14):(5'h14)] >>> reg92[(1'h1):(1'h1)])) || (reg104[(3'h5):(2'h3)] ?
                       reg92 : $unsigned(reg114[(2'h2):(2'h2)])));
  assign wire117 = $unsigned($unsigned({(^(-wire116)),
                       ((reg103 ? (8'ha6) : reg84) * reg96)}));
  always
    @(posedge clk) begin
      reg118 <= (~^wire115[(1'h1):(1'h1)]);
      reg119 <= reg84;
      if ($unsigned(reg92))
        begin
          reg120 <= $signed((|{{(wire115 ? reg86 : reg92), reg98}}));
          reg121 <= $signed((reg90[(1'h0):(1'h0)] ?
              wire77 : reg119[(4'ha):(3'h5)]));
          reg122 <= ((!wire78[(5'h12):(5'h12)]) ?
              reg113 : $unsigned((~reg84[(1'h1):(1'h0)])));
        end
      else
        begin
          if ($unsigned({reg86[(3'h6):(3'h5)]}))
            begin
              reg120 <= (~($unsigned((8'ha7)) && $signed({((7'h41) * wire82),
                  reg100[(4'h8):(3'h6)]})));
              reg121 <= $unsigned($unsigned($unsigned({$signed(wire117),
                  $unsigned((8'hb8))})));
              reg122 <= $signed(reg86);
              reg123 <= $signed((8'ha2));
            end
          else
            begin
              reg120 <= {(reg120[(2'h2):(2'h2)] ?
                      wire105 : (~(reg100 + (^~wire115))))};
              reg121 <= reg96[(4'hb):(2'h3)];
            end
          reg124 <= reg110[(4'ha):(4'ha)];
          reg125 <= ((reg98 ?
              {(~reg119[(1'h0):(1'h0)]),
                  $unsigned((~reg106))} : wire83[(4'ha):(4'h9)]) >= ($signed(((+reg90) ?
                  $signed(reg119) : (8'hbb))) ?
              (reg109[(2'h3):(2'h2)] > $unsigned((reg123 >> reg124))) : $unsigned($unsigned($signed(reg121)))));
        end
    end
  assign wire126 = (8'ha3);
  assign wire127 = (((reg97 | $unsigned((+reg118))) ?
                           $unsigned(((~reg112) ^ $signed(reg113))) : $signed($unsigned($unsigned((8'h9f))))) ?
                       (~|{$signed(reg93)}) : $unsigned((+$unsigned({(8'ha1),
                           reg111}))));
  assign wire128 = reg119[(2'h2):(1'h1)];
  assign wire129 = reg114[(1'h0):(1'h0)];
  assign wire130 = ((($signed(reg84) ?
                               (reg90 && $signed(reg108)) : $signed($unsigned(reg122))) ?
                           $signed(($signed(reg112) + $signed(reg125))) : ($unsigned($unsigned(wire115)) ?
                               $signed($signed((8'hb2))) : ({reg101, wire83} ?
                                   (^~reg97) : (|reg119)))) ?
                       wire117[(4'hf):(1'h0)] : reg110[(1'h1):(1'h1)]);
  assign wire131 = ({(reg95[(5'h11):(5'h10)] > wire116[(3'h7):(3'h7)])} ?
                       $signed({$unsigned((~&reg104))}) : reg122);
  assign wire132 = {wire105, reg121[(4'ha):(3'h4)]};
  assign wire133 = reg125[(3'h4):(3'h4)];
  assign wire134 = $signed($unsigned((^~$unsigned(((8'ha6) ?
                       wire79 : (8'hb3))))));
  assign wire135 = reg114;
  always
    @(posedge clk) begin
      if ({wire78[(4'h9):(1'h1)], reg125})
        begin
          reg136 <= reg113;
          reg137 <= $unsigned($signed((8'hb4)));
          reg138 <= reg106;
        end
      else
        begin
          reg136 <= reg98;
          reg137 <= (8'haa);
          reg138 <= (wire79 ?
              $signed($signed((reg102 ?
                  $signed(wire79) : $signed((8'hab))))) : ({{reg94,
                      (^~wire78)}} < (reg97[(2'h3):(1'h0)] <= (|(~^(8'hae))))));
        end
      reg139 <= $signed((^~wire131[(4'ha):(2'h2)]));
      if (reg87[(3'h6):(3'h4)])
        begin
          reg140 <= $unsigned((($unsigned((~&reg87)) < $signed(wire126)) ^~ (|$unsigned($unsigned(reg87)))));
          reg141 <= (reg101[(3'h6):(3'h5)] < (~(8'ha0)));
          reg142 <= $unsigned(reg122[(2'h3):(1'h0)]);
          reg143 <= (^~reg98[(3'h6):(2'h2)]);
        end
      else
        begin
          if (($signed((((wire83 ? wire135 : reg118) ?
                  $unsigned(wire77) : (reg84 < (8'ha1))) ?
              ((reg122 ? wire129 : wire115) ?
                  wire127[(5'h10):(4'hb)] : (wire81 ?
                      reg119 : (8'hb0))) : reg138)) < (reg91[(4'h9):(3'h4)] ?
              wire79 : reg108)))
            begin
              reg140 <= (~&($unsigned(reg91) + $unsigned(reg107[(4'hf):(4'h9)])));
              reg141 <= $unsigned(($signed((8'ha8)) ?
                  (((wire105 == wire134) ?
                      $unsigned((8'ha4)) : $unsigned(wire83)) || reg87) : reg125[(4'he):(4'h9)]));
              reg142 <= $unsigned($unsigned({((reg109 ?
                      reg94 : reg100) || (8'hba))}));
            end
          else
            begin
              reg140 <= $signed(reg103[(1'h0):(1'h0)]);
              reg141 <= $unsigned(reg97);
              reg142 <= reg119[(3'h5):(1'h1)];
            end
        end
      if ({reg101, (|$signed($unsigned(((8'hae) | wire77))))})
        begin
          reg144 <= (wire83 ?
              ((8'hb7) && reg136) : (^~$unsigned((+$unsigned(wire131)))));
          reg145 <= ($signed(reg119) >> (wire134 ~^ $signed($signed(reg114))));
        end
      else
        begin
          reg144 <= ((|(&$signed(wire126[(3'h4):(2'h3)]))) <<< reg144);
          reg145 <= (~&$signed((~$unsigned(wire105))));
          if (wire129[(5'h12):(5'h11)])
            begin
              reg146 <= $unsigned(reg104);
              reg147 <= {(($signed((7'h40)) < (reg106 ?
                          $signed(reg112) : (-reg110))) ?
                      {($unsigned(reg141) ?
                              {reg86,
                                  (8'ha4)} : $unsigned(reg138))} : {reg124}),
                  reg108[(3'h5):(1'h1)]};
              reg148 <= (&(~^reg84[(1'h1):(1'h1)]));
              reg149 <= $unsigned(($unsigned(($unsigned(wire133) && reg139[(2'h2):(1'h0)])) ?
                  (wire127[(1'h0):(1'h0)] ?
                      $signed((reg122 ?
                          reg95 : wire77)) : (+reg142)) : reg125[(3'h7):(1'h1)]));
            end
          else
            begin
              reg146 <= (^($signed(reg124) ?
                  $signed((&(+reg148))) : $unsigned(reg125[(4'hd):(4'hb)])));
            end
          reg150 <= ({($signed($signed(wire83)) ?
                  $unsigned(((8'hbe) ?
                      wire130 : (8'ha0))) : ($signed(wire83) > reg89[(3'h6):(1'h0)])),
              reg91} ^ ({(8'hb1), {(8'ha5)}} + reg118));
          reg151 <= $signed(($unsigned(({reg144,
                  reg99} == (wire78 ~^ (8'hbf)))) ?
              $signed(($unsigned(reg94) != reg91)) : (((8'hb2) - (~reg92)) ?
                  {((8'hae) * reg104),
                      $signed(reg99)} : reg111[(4'hd):(4'h9)])));
        end
      if (wire130[(3'h7):(1'h1)])
        begin
          reg152 <= $signed(((((~^reg106) && $unsigned(wire128)) >> (+(reg103 ?
              reg90 : reg97))) ~^ reg143[(4'ha):(2'h2)]));
          if (wire83[(3'h5):(3'h4)])
            begin
              reg153 <= wire82[(3'h6):(1'h1)];
              reg154 <= ((&{$signed($signed(reg110))}) ?
                  (reg121[(5'h12):(4'ha)] ?
                      $signed((reg123 < $signed(reg119))) : (~wire130[(3'h7):(2'h3)])) : ($unsigned(reg146) >> (^wire127[(3'h6):(1'h0)])));
              reg155 <= (((({(8'hb5)} <= {(8'hb7)}) ?
                      {wire134} : $unsigned((|reg101))) ?
                  $signed(({reg86,
                      reg94} <= (-reg123))) : reg154[(1'h1):(1'h1)]) | {(wire129[(3'h7):(3'h5)] ?
                      (-(reg143 * reg114)) : $unsigned(reg145[(4'he):(3'h6)]))});
              reg156 <= (8'h9e);
            end
          else
            begin
              reg153 <= $signed($unsigned(({(~^reg88)} ?
                  (!(^~reg148)) : ((^reg106) <= reg155[(1'h0):(1'h0)]))));
              reg154 <= $signed(wire131);
              reg155 <= wire117;
              reg156 <= (~&$signed($unsigned((~^reg153[(3'h4):(1'h1)]))));
              reg157 <= wire132[(3'h5):(1'h0)];
            end
          if ($unsigned(reg152[(1'h1):(1'h1)]))
            begin
              reg158 <= ($unsigned($unsigned($unsigned((-reg110)))) + (^~reg151[(4'hb):(2'h2)]));
              reg159 <= reg121;
              reg160 <= ($signed(reg111[(1'h1):(1'h1)]) ?
                  ($signed(reg90) ?
                      (|$signed(reg104[(4'h8):(1'h0)])) : $signed((^reg95[(2'h2):(1'h0)]))) : (^$signed(wire133[(4'h8):(3'h5)])));
              reg161 <= ((((~&wire82) ?
                      ($unsigned(wire127) ?
                          (-(7'h41)) : reg114) : ((~&reg150) <= (|reg150))) + reg144[(2'h3):(1'h0)]) ?
                  ($unsigned(wire131) && (8'hba)) : (!$unsigned($signed({reg154,
                      wire77}))));
              reg162 <= (!$unsigned((((~&reg95) * reg98[(2'h2):(2'h2)]) | $unsigned($unsigned(reg144)))));
            end
          else
            begin
              reg158 <= wire130;
              reg159 <= (reg148[(5'h10):(3'h4)] ?
                  reg125 : reg150[(3'h6):(3'h6)]);
              reg160 <= (8'haa);
            end
        end
      else
        begin
          reg152 <= (reg108[(3'h6):(3'h6)] ?
              {{{(reg95 & reg118)},
                      (reg101[(2'h3):(2'h3)] ?
                          $signed(wire127) : ((7'h44) ?
                              (8'hba) : reg150))}} : {reg104});
          if ($signed(reg158[(3'h5):(3'h5)]))
            begin
              reg153 <= $signed(wire116);
              reg154 <= (~|reg85[(1'h0):(1'h0)]);
              reg155 <= $signed($signed($signed(wire117)));
            end
          else
            begin
              reg153 <= reg147;
              reg154 <= {((reg148[(5'h10):(4'hc)] ?
                          {$unsigned(reg87)} : (reg140 + reg145[(4'h8):(3'h7)])) ?
                      (reg151 || (wire105[(4'h9):(2'h3)] ?
                          (wire105 ? wire83 : wire78) : ((8'ha1) ?
                              reg120 : (8'hb8)))) : (($unsigned((8'hb1)) ^~ wire115) ?
                          $unsigned(wire105) : $unsigned(reg162[(1'h0):(1'h0)])))};
              reg155 <= {(+((&(&reg97)) ?
                      (~|(reg140 > reg94)) : (~(reg138 ? wire117 : (8'hb3))))),
                  reg96[(4'h8):(2'h3)]};
            end
          if (reg101)
            begin
              reg156 <= $signed((^wire78));
              reg157 <= reg162[(1'h0):(1'h0)];
              reg158 <= $signed(reg124[(3'h6):(2'h3)]);
              reg159 <= $unsigned(reg149[(4'h9):(1'h1)]);
            end
          else
            begin
              reg156 <= (~^reg155);
              reg157 <= {(8'ha9),
                  (((~^{reg111}) ?
                          {reg156[(4'he):(3'h6)],
                              $signed(wire127)} : $signed(reg124[(3'h5):(2'h3)])) ?
                      reg121[(1'h0):(1'h0)] : reg144)};
              reg158 <= reg90[(1'h1):(1'h0)];
            end
          reg160 <= (reg111[(4'hb):(3'h7)] >> reg107);
          reg161 <= ({(reg90 ?
                  $unsigned((reg93 ?
                      reg92 : (8'hbf))) : ((!(8'hb2)) <<< (^~reg148)))} < reg114[(1'h0):(1'h0)]);
        end
    end
endmodule

module module243  (y, clk, wire248, wire247, wire246, wire245, wire244);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire248;
  input wire signed [(5'h14):(1'h0)] wire247;
  input wire [(4'he):(1'h0)] wire246;
  input wire signed [(3'h7):(1'h0)] wire245;
  input wire [(5'h15):(1'h0)] wire244;
  wire signed [(4'hb):(1'h0)] wire281;
  wire [(2'h2):(1'h0)] wire280;
  wire signed [(4'hd):(1'h0)] wire279;
  wire [(4'hc):(1'h0)] wire278;
  wire [(2'h3):(1'h0)] wire277;
  wire [(5'h13):(1'h0)] wire276;
  wire [(4'h9):(1'h0)] wire263;
  wire signed [(3'h7):(1'h0)] wire262;
  wire [(4'he):(1'h0)] wire261;
  wire signed [(3'h7):(1'h0)] wire260;
  wire [(2'h2):(1'h0)] wire258;
  wire signed [(4'hd):(1'h0)] wire256;
  wire [(5'h11):(1'h0)] wire255;
  wire [(5'h14):(1'h0)] wire254;
  wire [(2'h2):(1'h0)] wire253;
  wire [(4'hf):(1'h0)] wire252;
  wire [(5'h12):(1'h0)] wire251;
  wire signed [(4'hb):(1'h0)] wire250;
  wire [(5'h13):(1'h0)] wire249;
  reg signed [(4'hd):(1'h0)] reg275 = (1'h0);
  reg [(5'h13):(1'h0)] reg274 = (1'h0);
  reg [(2'h2):(1'h0)] reg273 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg272 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg271 = (1'h0);
  reg [(4'ha):(1'h0)] reg270 = (1'h0);
  reg [(3'h5):(1'h0)] reg269 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg268 = (1'h0);
  reg signed [(4'he):(1'h0)] reg267 = (1'h0);
  reg [(5'h10):(1'h0)] reg266 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg265 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg264 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg259 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg257 = (1'h0);
  assign y = {wire281,
                 wire280,
                 wire279,
                 wire278,
                 wire277,
                 wire276,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire258,
                 wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire252,
                 wire251,
                 wire250,
                 wire249,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg259,
                 reg257,
                 (1'h0)};
  assign wire249 = (8'hb9);
  assign wire250 = wire245[(3'h7):(2'h3)];
  assign wire251 = $signed(($unsigned((^(wire250 ?
                       (7'h42) : wire246))) ~^ $signed((~&$signed(wire249)))));
  assign wire252 = wire250[(3'h6):(3'h6)];
  assign wire253 = (wire250[(4'hb):(3'h4)] + (~&($signed({wire246}) ^ (8'ha7))));
  assign wire254 = (($unsigned((wire245 > (~wire251))) ^ ({(~wire244),
                           (wire249 ?
                               wire247 : wire251)} ^~ wire245[(1'h1):(1'h1)])) ?
                       $signed($unsigned(wire248[(2'h2):(2'h2)])) : ((&(!(wire244 ?
                           wire251 : (8'hab)))) * $unsigned(wire252)));
  assign wire255 = $signed(wire249[(1'h1):(1'h0)]);
  assign wire256 = ((~&(wire249 ?
                       wire252[(1'h1):(1'h0)] : ((~^wire251) ^ $unsigned(wire253)))) ^ ((wire245[(3'h7):(1'h1)] ?
                           {wire247} : wire254[(4'hd):(3'h7)]) ?
                       $signed(wire252[(4'he):(1'h1)]) : wire252));
  always
    @(posedge clk) begin
      reg257 <= wire255[(2'h3):(2'h3)];
    end
  assign wire258 = ($signed({{(^wire252), reg257}}) > wire246[(4'ha):(3'h6)]);
  always
    @(posedge clk) begin
      reg259 <= $unsigned((&(+{(wire251 ? (8'h9e) : reg257)})));
    end
  assign wire260 = (!$unsigned((|{$signed(wire247), (^(8'hab))})));
  assign wire261 = $unsigned((wire254[(1'h0):(1'h0)] ?
                       $unsigned(wire254) : wire254));
  assign wire262 = wire256[(2'h3):(1'h0)];
  assign wire263 = (~wire244);
  always
    @(posedge clk) begin
      if ((+(wire261 ?
          wire247 : ((wire247 ? (8'h9f) : {wire249, wire261}) ?
              ($signed((8'ha1)) ?
                  wire253[(1'h1):(1'h0)] : (~wire258)) : (wire249[(3'h6):(2'h3)] ?
                  wire246[(1'h1):(1'h0)] : (reg259 >>> wire244))))))
        begin
          reg264 <= {$signed($signed($unsigned($signed(wire254))))};
        end
      else
        begin
          reg264 <= (^$signed(wire260));
          reg265 <= (8'hae);
        end
    end
  always
    @(posedge clk) begin
      reg266 <= {$signed($unsigned($unsigned(wire263[(3'h7):(1'h0)]))),
          (|$unsigned(wire245[(2'h2):(1'h0)]))};
      if (wire258[(2'h2):(1'h0)])
        begin
          reg267 <= {$signed($unsigned($unsigned(wire263))),
              $signed(wire263[(2'h3):(1'h1)])};
          if (wire262[(2'h3):(1'h1)])
            begin
              reg268 <= ((($unsigned(reg266) * $unsigned((wire260 | reg267))) >= $unsigned({(wire251 ?
                      reg265 : wire256),
                  (+reg266)})) <<< $unsigned(wire247[(5'h14):(4'ha)]));
            end
          else
            begin
              reg268 <= $signed(wire245);
            end
          reg269 <= $signed($unsigned({(wire246[(1'h0):(1'h0)] ?
                  (wire251 ? wire261 : wire247) : $signed((8'h9d)))}));
        end
      else
        begin
          reg267 <= ((((8'hac) ?
              (reg264[(1'h1):(1'h0)] <<< (wire247 ^~ (8'hbe))) : $unsigned((reg269 ?
                  (8'hb3) : wire258))) <<< (wire244 ?
              wire254[(4'h9):(3'h4)] : ($signed(wire262) != $signed((8'ha5))))) >>> wire250);
          reg268 <= wire248[(1'h1):(1'h1)];
          if ({wire247[(3'h6):(3'h6)]})
            begin
              reg269 <= ($unsigned(wire247) | $unsigned(($signed(((8'h9e) ?
                      wire255 : wire254)) ?
                  (+wire262) : ($signed(reg265) ?
                      $signed(reg268) : (wire253 ^~ reg265)))));
              reg270 <= $signed((-$signed(wire258)));
              reg271 <= (|$signed(wire255));
              reg272 <= (reg271 >= (wire262[(2'h3):(1'h1)] ?
                  (!((+wire260) >>> (~^wire244))) : $unsigned($unsigned($signed(wire253)))));
            end
          else
            begin
              reg269 <= ({{$signed(wire260),
                      ($signed((8'hbc)) ^~ (wire251 * reg268))},
                  (((8'haa) | ((8'ha0) ? wire254 : wire253)) ?
                      (-(8'ha5)) : (8'hbe))} >= {$unsigned((&wire253[(2'h2):(1'h0)])),
                  ((wire256[(3'h5):(3'h5)] | $unsigned((8'hb1))) ?
                      ($signed(reg268) << reg268[(2'h2):(1'h0)]) : ($signed(reg257) - (wire250 || (8'hb0))))});
              reg270 <= wire246[(4'ha):(3'h4)];
              reg271 <= (~|($signed({{wire245}}) ?
                  ((!reg267) || wire245[(3'h5):(1'h0)]) : $unsigned(((wire250 ^ wire262) > $unsigned(reg267)))));
              reg272 <= (~|$unsigned(wire247[(5'h12):(3'h5)]));
            end
          reg273 <= (8'hb2);
        end
      reg274 <= wire245[(3'h5):(1'h0)];
      reg275 <= $signed({$unsigned({reg268, (~wire255)})});
    end
  assign wire276 = ((($unsigned((wire256 ? reg257 : reg272)) ?
                       $signed(reg269[(1'h1):(1'h0)]) : ({wire256} ?
                           reg264 : wire256)) << (wire253[(2'h2):(2'h2)] > $unsigned($signed(wire263)))) * $unsigned((&(wire250 ?
                       (wire261 || reg259) : ((8'ha8) ? wire244 : wire256)))));
  assign wire277 = reg274;
  assign wire278 = reg269;
  assign wire279 = $signed($signed(wire253[(1'h1):(1'h0)]));
  assign wire280 = ((^~{{$signed((8'ha0))},
                       ({(8'had), wire261} ?
                           $unsigned((8'h9f)) : wire246[(4'he):(3'h5)])}) > $unsigned(reg265[(4'h8):(1'h0)]));
  assign wire281 = (reg264[(3'h4):(2'h2)] ?
                       (reg266[(4'hb):(2'h3)] ?
                           $unsigned(($unsigned((8'hbe)) ?
                               $signed(wire278) : (wire263 | wire260))) : $unsigned((7'h40))) : $unsigned((reg268 ?
                           wire248[(2'h2):(1'h0)] : (^~(wire244 >= reg275)))));
endmodule
