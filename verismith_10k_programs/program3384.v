module top
#(parameter param168 = ((&(~^(+(^~(8'hb1))))) ? ((((8'hb7) ? ((8'ha0) <<< (8'hae)) : (8'h9c)) - (^~((8'h9f) | (8'ha4)))) >= {(8'ha4)}) : (((^(+(8'ha6))) ? (!(~|(8'hb5))) : (+((8'hb0) ? (8'ha3) : (8'ha1)))) && (~|(~|((8'hba) || (8'ha9)))))), 
parameter param169 = (param168 && (|((|param168) <<< (|{param168})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire166;
  wire signed [(3'h6):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  wire signed [(3'h7):(1'h0)] wire153;
  wire [(4'ha):(1'h0)] wire152;
  wire [(4'h9):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire149;
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(4'hb):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  reg [(3'h5):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg156 = (1'h0);
  reg [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire153,
                 wire152,
                 wire151,
                 wire5,
                 wire6,
                 wire7,
                 wire27,
                 wire149,
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
                 (1'h0)};
  assign wire5 = (&(-$signed({$signed(wire2)})));
  assign wire6 = wire2;
  assign wire7 = wire4;
  module8 #() modinst28 (.clk(clk), .wire10(wire0), .wire12(wire4), .wire11(wire1), .wire9(wire3), .y(wire27));
  module29 #() modinst150 (wire149, clk, wire6, wire0, wire7, wire2, wire27);
  assign wire151 = {wire3, (~&(~wire5))};
  assign wire152 = ($unsigned((wire151[(1'h1):(1'h1)] ?
                           $signed((wire5 ?
                               wire2 : wire5)) : $signed(wire27))) ?
                       $signed($unsigned($unsigned((~^wire3)))) : $unsigned(((wire4[(4'ha):(3'h7)] == $unsigned(wire2)) - ($unsigned(wire2) ?
                           ((8'hb6) >= wire149) : $unsigned(wire149)))));
  assign wire153 = (wire5[(4'hd):(1'h0)] ?
                       (wire4 >= ((wire1[(4'hb):(4'hb)] ?
                               wire7[(4'hf):(4'hb)] : (wire152 ?
                                   wire151 : (8'h9f))) ?
                           $unsigned((wire0 * wire0)) : {$unsigned(wire3),
                               (wire152 ?
                                   (8'ha0) : wire0)})) : (|$signed(wire3)));
  always
    @(posedge clk) begin
      reg154 <= $unsigned(wire5);
      reg155 <= wire153;
      reg156 <= (^~(~&wire5[(4'hd):(3'h4)]));
      if ($unsigned(wire151))
        begin
          reg157 <= ((8'ha5) ?
              (+(&(((8'ha9) ? wire153 : reg154) ?
                  wire149 : reg154[(3'h6):(1'h1)]))) : ({$unsigned({reg154,
                          wire5})} ?
                  ((+(^(8'hbc))) ?
                      (~|$unsigned((8'hbf))) : (~|wire1)) : (~&$signed((reg155 ~^ wire1)))));
          reg158 <= (^$signed((((wire7 ?
                  wire1 : wire6) == wire153[(3'h6):(3'h6)]) ?
              {(wire6 ^~ wire4), {(8'ha5), reg157}} : $signed((reg156 ?
                  wire153 : (8'hae))))));
          reg159 <= ($signed(reg158) ?
              (($unsigned((8'hb1)) == $unsigned((wire153 ^ wire151))) ?
                  wire1[(1'h0):(1'h0)] : wire151[(4'h9):(3'h6)]) : reg154);
          reg160 <= {{($signed($signed(wire149)) != wire3)}};
          reg161 <= (^~reg157);
        end
      else
        begin
          reg157 <= wire2;
          reg158 <= $signed((-$signed(wire151)));
          if (({(~((&reg158) >> $unsigned(reg155))),
              wire3[(3'h7):(3'h7)]} >= (~^(+$unsigned((reg158 != wire151))))))
            begin
              reg159 <= $unsigned(($unsigned({reg154[(3'h4):(1'h0)],
                  reg155[(3'h6):(1'h0)]}) + (!((wire7 & wire153) & $signed((8'hb5))))));
              reg160 <= reg158[(1'h0):(1'h0)];
              reg161 <= reg154;
              reg162 <= (wire7[(2'h2):(1'h0)] ?
                  wire6[(2'h3):(2'h3)] : (!reg154[(1'h0):(1'h0)]));
            end
          else
            begin
              reg159 <= $unsigned($signed(((-(~&wire3)) ?
                  wire4 : reg161[(5'h12):(1'h1)])));
              reg160 <= (&$unsigned(reg160[(2'h2):(2'h2)]));
              reg161 <= ({((+wire7[(4'h9):(1'h0)]) <<< $unsigned($signed(reg162)))} > ((!wire1) - $signed(($unsigned(wire6) || (^reg160)))));
              reg162 <= (reg161 & (wire153[(3'h5):(2'h2)] ?
                  wire3[(4'h9):(3'h4)] : ($signed((reg156 ? reg157 : reg162)) ?
                      reg156 : $unsigned((wire5 && (8'hb2))))));
            end
          reg163 <= $signed($unsigned((($signed(wire1) ?
              wire7[(4'hc):(3'h4)] : $unsigned(wire0)) + (wire3[(4'h9):(3'h4)] ?
              $signed((8'ha6)) : reg161[(1'h1):(1'h1)]))));
        end
    end
  assign wire164 = $unsigned(reg162[(1'h0):(1'h0)]);
  assign wire165 = $unsigned(((!{{wire152}}) ~^ (8'had)));
  assign wire166 = (|(~$signed(wire27)));
  assign wire167 = reg163;
endmodule

module module29
#(parameter param148 = ((^((!((8'hbd) <<< (8'ha3))) && ((^(8'haa)) ^~ ((8'ha9) << (8'hb3))))) ? (7'h41) : (((|((8'hae) >= (7'h41))) ? {(~&(8'hae))} : ({(8'ha6), (8'hb6)} ? ((8'ha0) == (8'hb9)) : ((8'hac) ^ (8'hb1)))) == {((|(8'hb1)) ? ((8'haf) ? (8'ha7) : (8'hb1)) : (-(7'h43))), {((8'ha8) << (8'hab))}})))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h27e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire [(5'h14):(1'h0)] wire33;
  input wire [(5'h13):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire [(4'hc):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire147;
  wire signed [(2'h2):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire145;
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  assign y = {wire147,
                 wire113,
                 wire78,
                 wire35,
                 wire115,
                 wire116,
                 wire145,
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
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
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
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 (1'h0)};
  assign wire35 = {((((wire34 ? wire33 : (8'ha7)) ?
                              $signed((8'ha1)) : (^~wire32)) + (~|{(8'hb4),
                              wire31})) ?
                          wire32 : $signed(wire32))};
  always
    @(posedge clk) begin
      if (($unsigned((7'h42)) << (+$unsigned(wire30))))
        begin
          if ((~|wire31[(3'h4):(2'h2)]))
            begin
              reg36 <= (8'hba);
              reg37 <= {wire33};
              reg38 <= {{$unsigned($signed((wire35 ? wire32 : wire30))),
                      wire35[(2'h3):(1'h0)]}};
            end
          else
            begin
              reg36 <= {reg36[(3'h6):(3'h6)]};
              reg37 <= $unsigned(reg38[(2'h3):(1'h1)]);
            end
          reg39 <= $signed((~|reg37[(4'ha):(2'h3)]));
          if (($signed(($signed($signed(wire30)) >>> $signed((!reg39)))) + (reg38 ~^ ((~^{(8'hbd),
              (8'hac)}) < ($signed((8'hac)) ? wire33[(3'h6):(3'h6)] : reg36)))))
            begin
              reg40 <= (wire34[(4'h8):(1'h1)] ?
                  {(^~wire33[(3'h6):(3'h6)]),
                      (-reg36[(2'h3):(2'h2)])} : wire31);
              reg41 <= wire35[(1'h1):(1'h1)];
              reg42 <= (~^((&reg36[(4'he):(3'h6)]) | $signed(wire34[(3'h7):(2'h2)])));
            end
          else
            begin
              reg40 <= $signed(((|(~(|(7'h44)))) + ((7'h41) < wire33[(1'h0):(1'h0)])));
              reg41 <= $signed($signed(($unsigned($unsigned(wire34)) ?
                  (~|(reg42 + wire31)) : $unsigned($unsigned(reg36)))));
              reg42 <= ({($unsigned($signed(reg38)) >> reg39), wire31} ?
                  (($signed($signed(reg36)) + {$unsigned((8'haf))}) * (~($signed(reg42) & reg40[(4'h8):(3'h6)]))) : ($unsigned($unsigned($unsigned(wire32))) ?
                      $signed(((wire34 ^~ reg37) ?
                          (^~reg38) : $unsigned(reg42))) : $unsigned($signed($unsigned(reg40)))));
              reg43 <= (^(!reg38));
              reg44 <= reg41[(4'hd):(4'h8)];
            end
          reg45 <= (($signed(wire32) < wire34[(3'h4):(1'h1)]) ?
              $unsigned({(~(reg37 + reg42))}) : (~|(^~reg36)));
        end
      else
        begin
          reg36 <= (({(+$signed(wire31)),
                  (^~reg37[(5'h12):(4'h8)])} & (wire35[(1'h0):(1'h0)] ~^ (reg39 ?
                  (wire35 ? reg36 : reg37) : $signed(reg41)))) ?
              $unsigned($signed(reg45)) : $unsigned({$unsigned((~reg36)),
                  ($signed(wire33) ?
                      (reg38 && reg43) : (wire35 ? wire30 : (8'hae)))}));
          reg37 <= (!{$signed($unsigned($unsigned((8'ha6))))});
        end
      reg46 <= $signed(($signed(((reg40 ? reg38 : reg44) ?
              $unsigned(reg43) : (reg44 < reg36))) ?
          {reg44} : ($unsigned(wire31) ?
              ((reg39 ? reg39 : reg39) >> (8'ha2)) : (wire30[(4'hc):(3'h5)] ?
                  reg42 : $unsigned(reg41)))));
      if (({($unsigned((reg36 != wire35)) ?
              reg42[(3'h4):(2'h2)] : wire31[(2'h3):(1'h1)]),
          $unsigned($signed((reg45 < wire31)))} >> reg38))
        begin
          reg47 <= ($signed(reg41[(3'h5):(3'h5)]) < (-(wire35[(2'h2):(1'h1)] ?
              {(reg44 | reg45), reg36} : {$signed(reg44), {wire33, wire35}})));
        end
      else
        begin
          reg47 <= reg40;
          reg48 <= $unsigned((reg42 >= {wire35}));
          reg49 <= $signed(((!($unsigned(reg43) ? reg43 : reg48)) ?
              $unsigned((!$unsigned(reg38))) : wire33[(4'h8):(3'h6)]));
          reg50 <= wire32[(4'hf):(3'h7)];
          if ($signed((~|(8'ha5))))
            begin
              reg51 <= $signed(($signed($signed({(8'hb7)})) ?
                  (8'ha8) : reg37[(4'h8):(2'h2)]));
              reg52 <= reg45[(2'h2):(1'h0)];
            end
          else
            begin
              reg51 <= (~|{($unsigned((wire31 >>> wire30)) >> reg40), (8'hb1)});
              reg52 <= reg44;
              reg53 <= (reg42[(4'he):(4'h8)] >= (({(reg49 ~^ reg43),
                      (wire34 ? reg49 : reg42)} ^ {$unsigned((7'h40)),
                      (8'haa)}) ?
                  reg41 : $unsigned((-reg47[(4'h8):(2'h3)]))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg54 <= $signed({((&(reg48 << wire35)) ? reg48 : reg47),
          $signed(wire31)});
      reg55 <= reg41[(4'he):(4'he)];
      reg56 <= reg54;
      reg57 <= (wire32[(4'h9):(2'h2)] ?
          wire34[(3'h7):(1'h0)] : $signed($signed($signed($signed(reg56)))));
      reg58 <= (~|reg50[(2'h3):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg59 <= reg45[(2'h2):(2'h2)];
      if ($signed(reg51[(1'h0):(1'h0)]))
        begin
          if (reg59[(1'h0):(1'h0)])
            begin
              reg60 <= ((reg54[(1'h1):(1'h0)] > reg40) ~^ {reg48});
              reg61 <= reg36;
              reg62 <= ((($unsigned((reg38 ?
                      reg58 : reg60)) && (^reg60[(2'h2):(1'h1)])) + reg61[(4'h8):(2'h3)]) ?
                  reg51 : {($unsigned($unsigned((8'hb3))) ^~ (reg55[(1'h1):(1'h1)] == (reg52 ?
                          (7'h43) : reg44))),
                      ($unsigned((reg37 ? reg60 : wire30)) ?
                          $unsigned($signed(reg61)) : {((8'hbb) && reg52)})});
              reg63 <= $unsigned(((~^reg58) ?
                  $unsigned(reg41[(3'h7):(1'h1)]) : reg59));
              reg64 <= $signed((reg36 ?
                  reg58 : (($unsigned(reg54) ?
                          (~^reg49) : (reg46 ? (8'hbc) : reg38)) ?
                      reg55 : reg59)));
            end
          else
            begin
              reg60 <= ($signed(reg58[(2'h2):(1'h1)]) >= wire33[(4'h9):(2'h3)]);
              reg61 <= reg61;
              reg62 <= reg63;
              reg63 <= $signed((reg45[(1'h1):(1'h1)] ?
                  ({(reg63 > reg61),
                      reg37[(4'hf):(2'h2)]} != wire33) : (reg45[(4'ha):(3'h5)] ^~ ((+reg47) ?
                      (wire32 >> reg38) : (reg61 - reg49)))));
              reg64 <= (($unsigned($signed((8'ha7))) & (8'haa)) ?
                  reg63[(2'h2):(2'h2)] : ({(~&reg64)} ?
                      (((wire32 ? reg49 : wire32) & (!reg36)) ?
                          {reg55[(4'hc):(2'h2)]} : reg38[(1'h1):(1'h1)]) : reg46));
            end
          reg65 <= wire31[(2'h3):(2'h2)];
          reg66 <= {($signed(reg44[(5'h10):(3'h7)]) ?
                  wire35[(1'h0):(1'h0)] : $unsigned((8'ha2))),
              reg57};
          reg67 <= reg37;
          reg68 <= ({$signed($signed((reg51 ?
                  (8'hae) : reg63)))} || {$signed(reg47)});
        end
      else
        begin
          reg60 <= $unsigned((reg63[(3'h7):(3'h6)] ^ $signed(reg39[(3'h4):(1'h1)])));
          reg61 <= $signed((|$unsigned((+(^~reg37)))));
          reg62 <= $signed($signed($unsigned(reg51)));
          reg63 <= (8'hbf);
        end
      reg69 <= $unsigned((8'hae));
      if ((reg39 ?
          $unsigned(($signed((reg51 ? reg65 : (7'h41))) ?
              reg40[(4'h8):(1'h0)] : (8'h9e))) : (({$unsigned(reg56)} <<< ({reg46,
              (8'ha8)} | $signed(reg42))) != $signed(($signed(reg62) * {reg45})))))
        begin
          reg70 <= reg45[(4'hb):(3'h6)];
        end
      else
        begin
          if ($signed((^~($unsigned((reg57 >= reg36)) ?
              {(reg66 <<< reg46), $signed(reg43)} : reg60[(1'h0):(1'h0)]))))
            begin
              reg70 <= wire35[(2'h3):(1'h1)];
              reg71 <= wire30;
              reg72 <= (^~(reg55[(3'h5):(3'h4)] ?
                  $signed($signed($unsigned(wire35))) : reg69));
              reg73 <= reg66;
            end
          else
            begin
              reg70 <= {reg69, reg50[(5'h14):(2'h2)]};
              reg71 <= ({$signed((~|$signed(reg67))),
                      ((reg69[(2'h2):(1'h1)] < reg52[(5'h10):(2'h3)]) ?
                          reg72 : reg70[(1'h0):(1'h0)])} ?
                  {{reg40, $unsigned((reg38 - (8'hba)))},
                      ({(reg45 ? reg56 : reg53)} ^~ $signed((reg57 ?
                          reg41 : (8'hb5))))} : (+(reg57 ?
                      ({reg67,
                          reg44} && (reg50 && reg67)) : ($signed(reg41) ^~ reg49[(1'h1):(1'h0)]))));
              reg72 <= ((|(^($unsigned(reg47) == reg39[(4'hf):(4'hd)]))) >> reg42[(4'h8):(3'h5)]);
            end
          if ($unsigned($unsigned((-reg59))))
            begin
              reg74 <= $signed({{(~|(reg45 ? (8'ha2) : reg38))},
                  $unsigned({reg63})});
              reg75 <= $signed({{$signed(reg51), reg62}});
              reg76 <= $signed(($signed($unsigned(reg71)) - $signed(reg75[(4'h9):(2'h2)])));
              reg77 <= $signed($signed(reg53[(1'h1):(1'h0)]));
            end
          else
            begin
              reg74 <= ({(reg48[(4'hc):(1'h1)] ?
                      $signed((reg41 << reg61)) : $signed((reg45 | reg43))),
                  ((^(~|reg46)) ?
                      $unsigned((wire30 >>> reg50)) : reg70[(1'h0):(1'h0)])} >= $unsigned((reg46[(4'hf):(3'h4)] ?
                  reg53[(2'h2):(1'h1)] : $signed((^reg68)))));
              reg75 <= ((reg42 + reg50) ?
                  (reg52 - (($unsigned(reg73) ? {reg66} : wire32) ?
                      (&wire35) : {(8'ha8)})) : $signed(reg49));
              reg76 <= $signed(reg57);
              reg77 <= $signed($unsigned(reg45));
            end
        end
    end
  assign wire78 = ((({((8'hb2) <<< reg36),
                          (reg51 ?
                              (8'hbd) : reg54)} == reg76[(4'hb):(3'h4)]) | $unsigned(((reg61 ?
                              wire35 : reg53) ?
                          (reg66 ? reg64 : reg50) : (-reg72)))) ?
                      $signed($signed(((~reg56) == ((8'haa) <= reg61)))) : {$unsigned((+$unsigned(reg52))),
                          $signed({(reg64 ? (8'hbe) : (8'hab))})});
  module79 #() modinst114 (.wire80(reg53), .y(wire113), .wire83(wire34), .wire84(reg59), .wire82(reg44), .wire81(reg54), .clk(clk));
  assign wire115 = (((+reg47[(4'hc):(3'h5)]) < (($unsigned(reg38) | (reg36 ?
                       reg66 : wire33)) ~^ ((^reg62) ?
                       (wire33 ~^ reg54) : reg62[(4'h9):(4'h8)]))) - $unsigned(($unsigned((8'ha5)) * (7'h42))));
  assign wire116 = $unsigned(reg44[(3'h7):(1'h0)]);
  module117 #() modinst146 (.wire119(reg64), .wire121(wire33), .wire118(reg75), .y(wire145), .wire120(reg65), .clk(clk));
  assign wire147 = reg61;
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((((wire10[(3'h7):(2'h2)] ?
              wire12 : $signed((wire12 ? wire12 : wire11))) ?
          (8'hbb) : $signed((^~(wire11 ?
              wire9 : wire11)))) <= $unsigned((wire10[(3'h4):(2'h3)] ?
          ((wire12 >= wire11) | (~wire10)) : $signed(wire9)))))
        begin
          if (wire11)
            begin
              reg13 <= ((($signed((wire12 ?
                          wire9 : wire9)) || $signed((+wire12))) ?
                      ({(~wire12)} ? wire12 : (~^$signed(wire12))) : ((8'hb7) ?
                          ($signed(wire11) <<< $signed((8'ha6))) : {wire9[(1'h1):(1'h0)],
                              $signed(wire12)})) ?
                  $unsigned({(+(~^wire10)),
                      $signed($unsigned(wire9))}) : wire11[(2'h3):(2'h3)]);
            end
          else
            begin
              reg13 <= $signed((8'hb5));
              reg14 <= $signed(wire10[(4'h8):(2'h3)]);
              reg15 <= (~|wire11[(3'h7):(1'h0)]);
              reg16 <= {reg14[(2'h3):(2'h2)],
                  (({(^~reg15)} >> $unsigned($unsigned(wire11))) ?
                      (reg14[(2'h3):(2'h2)] == $signed(wire9)) : $signed($unsigned((wire10 ?
                          reg13 : (8'hbd)))))};
              reg17 <= (^~wire9);
            end
        end
      else
        begin
          reg13 <= ($unsigned((reg13 ^~ reg15[(1'h1):(1'h0)])) <= $unsigned(wire9[(2'h3):(1'h1)]));
          reg14 <= $signed(((~($signed(wire9) ? $unsigned(reg14) : wire12)) ?
              $unsigned({{wire12, (8'hb7)},
                  (!wire12)}) : reg17[(4'hc):(4'hb)]));
          if ((((((wire11 ? wire9 : reg15) ?
                      $unsigned(wire9) : $signed(wire10)) <= ($signed(reg14) >= (reg16 ?
                      reg14 : reg17))) ?
                  ($unsigned($signed(reg17)) ?
                      $signed(reg15) : (^~wire12)) : ($signed($unsigned(reg15)) >= $unsigned((wire12 < reg13)))) ?
              (|{($signed(wire12) && wire10),
                  $signed(((8'hb1) ?
                      (8'ha8) : reg14))}) : reg16[(2'h2):(2'h2)]))
            begin
              reg15 <= wire9[(1'h1):(1'h1)];
              reg16 <= $signed($unsigned($unsigned(reg17)));
            end
          else
            begin
              reg15 <= ((~&({(|wire9), {reg13, wire10}} ?
                      (reg14[(2'h2):(1'h0)] && $unsigned((8'ha6))) : (^~wire12[(4'ha):(3'h6)]))) ?
                  ($signed(wire11) ? wire10 : reg16) : reg15);
              reg16 <= $unsigned(reg17);
              reg17 <= reg14;
              reg18 <= wire12;
              reg19 <= reg17[(4'ha):(1'h0)];
            end
          reg20 <= (wire10 && $unsigned(reg17));
        end
      reg21 <= $unsigned(wire9);
      reg22 <= $signed(reg15);
      reg23 <= reg14;
    end
  assign wire24 = wire10[(3'h7):(2'h2)];
  assign wire25 = $unsigned($signed($unsigned($signed((reg17 ?
                      wire9 : reg13)))));
  assign wire26 = $signed(($unsigned($unsigned(wire24)) ?
                      wire11 : $signed(((|reg13) ?
                          (wire10 >= reg15) : $signed(reg23)))));
endmodule

module module117
#(parameter param144 = (+(((((8'hb3) * (8'h9c)) ^ ((8'ha4) > (8'ha2))) ? (!((8'ha0) ? (8'hab) : (8'ha8))) : (~&(8'ha2))) ? (^(7'h40)) : (8'ha9))))
(y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire121;
  input wire signed [(4'h9):(1'h0)] wire120;
  input wire [(5'h14):(1'h0)] wire119;
  input wire [(2'h3):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire141;
  wire [(3'h7):(1'h0)] wire140;
  wire [(5'h10):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire138;
  wire signed [(3'h5):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire135;
  wire [(4'hb):(1'h0)] wire134;
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg122 <= {$signed(($signed(wire118) == $signed((wire119 ?
              wire119 : wire121))))};
      reg123 <= (wire121 == reg122[(3'h5):(1'h0)]);
      if ($unsigned($unsigned($signed($signed({reg122, wire120})))))
        begin
          reg124 <= $signed($signed({($signed(wire121) ?
                  reg123[(4'hb):(3'h5)] : $unsigned(reg123)),
              $signed($unsigned(reg123))}));
          reg125 <= ((^({(wire121 || (8'h9c)), (wire121 > wire119)} ?
              wire121[(4'hb):(4'hb)] : ($unsigned(reg124) ?
                  {(7'h41)} : $signed((7'h43))))) * (&(((reg122 < wire119) | wire119[(5'h14):(1'h1)]) | wire120)));
          if ($signed({(reg123 ?
                  (+{wire119}) : (((8'hb5) | reg124) * ((8'h9e) >>> reg124))),
              ((~|(8'hb4)) > (|(wire120 >>> reg124)))}))
            begin
              reg126 <= ((^~wire120[(2'h3):(1'h1)]) >>> (^~$unsigned($signed((~reg124)))));
              reg127 <= (~^({wire120[(2'h2):(1'h0)]} ?
                  wire120[(2'h3):(2'h3)] : (^~({wire121} <= reg126[(4'he):(2'h3)]))));
            end
          else
            begin
              reg126 <= {(^~$unsigned(wire121)),
                  ({$signed({reg125})} ?
                      (($unsigned(wire120) ?
                          (reg123 ? reg122 : (8'hbb)) : {reg122,
                              reg127}) + $unsigned($signed((8'ha2)))) : ($unsigned((wire119 | reg126)) | (wire121[(4'hc):(4'ha)] ?
                          {(8'hb5), reg122} : reg127)))};
              reg127 <= {(reg126 ?
                      reg123[(2'h3):(1'h0)] : reg123[(3'h4):(1'h0)]),
                  wire120};
              reg128 <= (~&(^~(wire121[(4'hd):(4'h8)] ?
                  (~&reg125[(1'h1):(1'h1)]) : $unsigned($unsigned(wire121)))));
              reg129 <= (8'h9f);
              reg130 <= reg126;
            end
          reg131 <= {((reg124[(3'h4):(2'h3)] ?
                      {$unsigned(reg130)} : (wire120 < reg130[(1'h0):(1'h0)])) ?
                  ($unsigned($signed(reg125)) * reg127[(4'hc):(4'h8)]) : reg129[(1'h0):(1'h0)])};
          reg132 <= ((wire119[(4'hd):(4'hd)] != reg127[(1'h0):(1'h0)]) ?
              ((8'hb9) <<< reg129) : ($signed(reg131) ^ {((-(8'haa)) >>> (wire121 ?
                      reg125 : reg128))}));
        end
      else
        begin
          if ((reg122[(1'h1):(1'h0)] + (~^reg131)))
            begin
              reg124 <= reg130[(3'h4):(2'h3)];
              reg125 <= (reg124[(3'h5):(3'h5)] ^~ {((!(8'ha2)) ?
                      $signed(reg124[(3'h5):(3'h5)]) : ((~(8'ha0)) >= $unsigned(wire118))),
                  $unsigned(($unsigned(wire120) + reg126[(1'h0):(1'h0)]))});
              reg126 <= (-{(|(reg130 ?
                      $signed(reg130) : ((8'hbc) >>> reg125)))});
              reg127 <= ((^~$signed(reg126[(4'hd):(3'h6)])) > {{((&reg123) ?
                          (reg128 ? reg129 : wire120) : (&reg122)),
                      $signed(((8'ha0) * reg131))},
                  (7'h40)});
              reg128 <= reg131;
            end
          else
            begin
              reg124 <= (((($signed(wire120) ? $unsigned(reg129) : wire120) ?
                  reg129 : reg125) <<< (~&$unsigned(reg131))) > wire119[(4'h8):(3'h6)]);
              reg125 <= ((($unsigned(reg124) * reg126[(2'h3):(1'h0)]) ?
                      (((~|wire121) << $unsigned(reg131)) ?
                          wire120[(4'h9):(1'h0)] : $signed(reg127)) : $unsigned($unsigned($signed(wire118)))) ?
                  reg123[(2'h2):(1'h1)] : ((wire121 ?
                      ((&reg127) ?
                          {reg123} : {reg131,
                              reg128}) : (((8'ha7) > reg126) != $unsigned((8'hb2)))) >= reg123[(3'h4):(2'h3)]));
              reg126 <= (reg127 ?
                  $unsigned(reg122[(2'h3):(1'h0)]) : {$unsigned($unsigned($unsigned((8'ha7)))),
                      (wire118 >= (~^(wire120 < reg123)))});
            end
          reg129 <= $unsigned(wire120[(3'h6):(2'h2)]);
          reg130 <= $unsigned(reg127[(2'h3):(2'h3)]);
          reg131 <= (~(wire119[(4'he):(3'h7)] ?
              $signed((wire119 ?
                  (reg125 | wire121) : $signed(wire120))) : ((reg128 ?
                  (wire120 ^ wire120) : {reg122,
                      (8'ha4)}) ^ {(wire120 != reg125), wire118})));
        end
      reg133 <= reg125[(3'h5):(3'h4)];
    end
  assign wire134 = (($unsigned($unsigned((&reg127))) * reg126[(3'h7):(2'h2)]) ?
                       $signed(reg128) : (($signed(reg128) ?
                           reg122 : reg126[(4'hb):(4'h8)]) ^ (~&$unsigned($signed((8'ha6))))));
  assign wire135 = (8'h9c);
  assign wire136 = ((~wire134) || (&(($unsigned(wire134) <= wire134) ?
                       $unsigned(((8'hb9) ?
                           (8'hb3) : reg124)) : $signed(wire118[(2'h2):(1'h0)]))));
  assign wire137 = $unsigned($unsigned(($signed((reg123 ? reg122 : wire135)) ?
                       ($unsigned(wire119) >>> (wire119 == reg122)) : $unsigned((-(8'hbb))))));
  assign wire138 = $unsigned($signed($signed({wire121, $unsigned((8'ha4))})));
  assign wire139 = reg122[(1'h0):(1'h0)];
  assign wire140 = reg129[(2'h2):(1'h0)];
  assign wire141 = (((+{$signed(reg131)}) ?
                       $signed($signed((wire136 + reg125))) : (((^wire135) + wire135) > $unsigned(wire138[(3'h5):(2'h3)]))) >>> (8'hb5));
  assign wire142 = wire134;
  assign wire143 = (wire119[(3'h5):(1'h0)] + $unsigned((-{{wire137}})));
endmodule

module module79
#(parameter param112 = (-(((((8'ha8) ? (8'ha7) : (8'ha0)) ? ((8'ha4) > (8'hb9)) : ((8'ha2) >> (8'hb2))) ? (((8'h9f) ? (7'h44) : (8'hbc)) && ((8'hb2) ^~ (8'hb5))) : (~^((8'hbf) ? (8'ha6) : (8'hb0)))) ~^ (&((!(8'haf)) ? (~&(7'h43)) : (~^(8'hb5)))))))
(y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire84;
  input wire signed [(3'h6):(1'h0)] wire83;
  input wire [(4'hc):(1'h0)] wire82;
  input wire [(5'h14):(1'h0)] wire81;
  input wire [(4'hb):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire signed [(4'hf):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire88;
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg85 <= (~({$unsigned((&wire80)),
              (wire82[(2'h3):(1'h0)] || wire83[(1'h0):(1'h0)])} ?
          wire82[(4'hc):(4'h9)] : ({$unsigned((8'hbb))} << wire82)));
      reg86 <= wire84[(2'h3):(1'h0)];
      reg87 <= {((wire83[(3'h6):(2'h3)] ?
              {reg85} : wire84) == ($signed((8'haa)) < $unsigned(wire81)))};
    end
  assign wire88 = ($unsigned((^~$signed({(8'hb8), wire82}))) && wire82);
  assign wire89 = $signed(($signed(((&wire83) - $signed(wire80))) ?
                      reg87 : $signed(((reg86 ? wire81 : (8'ha3)) ?
                          (-reg86) : (8'hbc)))));
  assign wire90 = $unsigned(($signed(({wire88, reg86} == (+reg87))) + wire82));
  assign wire91 = (&(&{(reg87 ? (-wire84) : (8'haa)),
                      $unsigned((reg86 & wire80))}));
  assign wire92 = $signed({wire82[(2'h3):(2'h3)]});
  assign wire93 = (wire91[(2'h3):(1'h1)] <<< reg86[(4'ha):(4'h9)]);
  assign wire94 = $signed((+{(~&(8'hbc))}));
  assign wire95 = $unsigned((reg86 ?
                      {$signed({wire83, reg85}),
                          (-{(7'h44)})} : $signed(reg86[(4'hf):(4'h8)])));
  assign wire96 = $unsigned(wire94[(3'h7):(2'h2)]);
  assign wire97 = {$signed(wire84[(2'h2):(1'h0)]),
                      ((&$signed(wire84[(2'h2):(2'h2)])) >> (((~reg86) ~^ (&wire84)) ?
                          wire92 : wire91[(3'h4):(1'h1)]))};
  assign wire98 = ({(((wire88 ? wire84 : wire90) ?
                          wire88[(1'h0):(1'h0)] : ((8'hbd) << (7'h40))) && (wire96 ?
                          wire94[(3'h7):(3'h6)] : $unsigned(wire91)))} == wire81);
  always
    @(posedge clk) begin
      reg99 <= (^{$signed(wire90), wire82[(3'h6):(3'h5)]});
      reg100 <= ((|($unsigned({wire81}) < wire91)) ?
          $signed((!($signed(wire84) ?
              {wire90, (8'hb2)} : (reg99 ?
                  reg85 : wire97)))) : ($unsigned((|$signed(wire97))) ?
              ($unsigned((~^(8'hba))) ?
                  (~|(wire93 ?
                      (8'ha3) : wire90)) : ((~^wire81) >> wire92)) : (^~(|(8'hb6)))));
      if ((^$unsigned(((8'hab) << (~wire92)))))
        begin
          reg101 <= wire92;
          reg102 <= {$signed($signed((~^(wire95 * wire90)))),
              reg99[(4'h8):(3'h6)]};
          reg103 <= ((^$unsigned($signed((wire88 ?
              wire90 : wire83)))) <<< (((wire91 ^ (wire82 ?
                  wire93 : wire96)) && reg99[(4'hb):(4'ha)]) ?
              (($signed(wire80) ? wire88 : (wire93 < wire94)) & $signed({reg86,
                  wire95})) : (wire90[(4'h9):(4'h8)] ?
                  ($signed(reg85) && (8'hb0)) : $signed(((8'ha7) * wire96)))));
          reg104 <= reg102[(3'h5):(1'h1)];
        end
      else
        begin
          reg101 <= $signed($signed(($unsigned(reg87[(4'ha):(4'h8)]) ?
              ($unsigned((8'hb4)) ?
                  (!wire81) : $signed(wire91)) : (~|wire96[(4'hb):(3'h4)]))));
          reg102 <= ($unsigned(wire93) ~^ wire95);
          reg103 <= ((reg104 ? (&reg85) : $unsigned((^~(reg85 >> wire96)))) ?
              (((wire81[(3'h5):(3'h4)] ?
                          wire98[(3'h5):(1'h1)] : $unsigned(wire82)) ?
                      $unsigned((wire98 ? wire93 : wire88)) : wire90) ?
                  reg103 : ((^(-wire84)) ?
                      ((wire88 ^~ wire92) ?
                          reg99[(5'h10):(3'h5)] : (reg104 > reg99)) : ((+reg99) ~^ wire83))) : (wire94 ?
                  $unsigned((reg87 ^ $unsigned(wire81))) : {($signed(reg101) ^ wire98),
                      (~|(reg102 >= wire84))}));
          reg104 <= $unsigned(($unsigned($unsigned(reg85[(1'h0):(1'h0)])) ?
              ($unsigned(((8'hbd) ? wire93 : wire80)) ?
                  {$unsigned(wire84),
                      ((8'ha2) ?
                          (8'ha7) : wire94)} : $signed(reg87[(2'h3):(2'h2)])) : (wire81[(3'h4):(2'h2)] <= wire89[(3'h6):(3'h6)])));
          reg105 <= wire80;
        end
    end
  assign wire106 = $unsigned((wire84[(2'h3):(2'h3)] ?
                       wire94[(1'h1):(1'h1)] : ({(!reg105)} ^ ((reg86 ?
                               wire84 : reg87) ?
                           $signed(wire82) : $unsigned(wire84)))));
  assign wire107 = {((8'hb7) ?
                           $signed((8'ha6)) : $signed(wire80[(3'h5):(1'h0)]))};
  assign wire108 = wire95[(3'h7):(2'h2)];
  assign wire109 = (-(($unsigned($signed(reg87)) ?
                           reg101[(1'h1):(1'h0)] : $signed({wire84, reg99})) ?
                       (wire84[(2'h3):(1'h1)] * reg100[(2'h3):(2'h3)]) : (~|((^~wire80) ?
                           wire97 : (reg102 == wire81)))));
  assign wire110 = wire97[(3'h5):(2'h2)];
  assign wire111 = $unsigned((8'hb5));
endmodule
