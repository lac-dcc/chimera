module top
#(parameter param61 = ((^~((~&((8'ha4) ? (8'hb8) : (8'hba))) ? ((|(8'hb3)) ? (!(8'had)) : ((8'ha6) ? (8'ha8) : (8'ha4))) : (((8'hbc) == (8'hb1)) ? ((8'hac) ? (8'hbf) : (8'h9d)) : ((7'h41) || (8'ha3))))) || (-((((8'hb6) && (8'ha1)) ? (^(8'hb4)) : (-(8'ha8))) ? (^((8'haf) <= (8'hb2))) : (((7'h40) == (8'hb2)) <= {(8'hae), (8'h9f)})))), 
parameter param62 = ((+(-(8'ha0))) ^~ (+{param61})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire39,
                 wire38,
                 wire37,
                 wire33,
                 wire32,
                 wire31,
                 wire20,
                 wire19,
                 wire17,
                 wire4,
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
                 reg36,
                 reg35,
                 reg34,
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
  assign wire4 = ((wire3 || ((wire3 ? wire0[(2'h2):(1'h1)] : (wire2 == wire1)) ?
                     ({wire2, wire3} ? wire1 : wire2) : (8'h9e))) > wire0);
  module5 #() modinst18 (.wire8(wire4), .wire6(wire1), .y(wire17), .wire7(wire2), .wire9(wire0), .clk(clk));
  assign wire19 = wire4[(4'hd):(4'hb)];
  assign wire20 = (((|(~&$signed(wire3))) ? wire17[(3'h7):(3'h7)] : {wire1}) ?
                      wire4 : {(($unsigned(wire19) ?
                                  (wire1 <= wire1) : $unsigned((8'hbf))) ?
                              wire1[(2'h2):(2'h2)] : $unsigned((wire0 ?
                                  (8'ha9) : (8'ha1)))),
                          $unsigned(($signed(wire2) && $unsigned((8'ha6))))});
  always
    @(posedge clk) begin
      reg21 <= wire1[(4'h8):(2'h3)];
      if (wire1[(4'hc):(2'h3)])
        begin
          reg22 <= wire3;
          reg23 <= (&(~|$unsigned({(|wire0), (^(8'ha1))})));
          reg24 <= (!$unsigned(({(~|wire3)} ~^ (^wire1))));
        end
      else
        begin
          reg22 <= $unsigned(reg21);
          reg23 <= ((wire4[(4'h9):(1'h1)] || {$signed($signed(reg24)),
                  wire20[(3'h4):(1'h1)]}) ?
              wire20 : ((((reg23 ? wire20 : reg21) > $signed(wire17)) ^ reg23) ?
                  (((!reg23) | {wire19}) ^~ wire2) : (wire17[(3'h5):(1'h0)] ?
                      (-$unsigned(reg21)) : ({wire2, wire2} >> wire17))));
          reg24 <= (|$signed($signed({reg22[(2'h3):(1'h0)]})));
        end
      reg25 <= $signed((8'hb3));
      if ($signed((^~wire3)))
        begin
          reg26 <= $signed(wire17);
        end
      else
        begin
          if ({wire20[(3'h5):(2'h3)], reg24[(4'hd):(4'h8)]})
            begin
              reg26 <= wire4[(3'h4):(2'h3)];
              reg27 <= wire1;
              reg28 <= $signed($unsigned(wire20[(2'h2):(1'h1)]));
            end
          else
            begin
              reg26 <= reg28[(3'h4):(2'h2)];
              reg27 <= ({$signed(reg27),
                      ((7'h42) ?
                          ($unsigned(reg27) * ((8'ha2) & wire2)) : reg25)} ?
                  reg24 : $signed({reg24, $unsigned(wire20)}));
              reg28 <= (($signed($unsigned((wire0 >= reg23))) - {(reg22 ?
                      $signed((8'hbc)) : (|(8'hbf))),
                  $signed(reg27)}) ~^ (((^~wire17[(3'h6):(3'h6)]) ?
                  (!$signed(reg27)) : ((reg26 != reg21) & (wire19 ?
                      reg24 : (8'hb8)))) ^ $unsigned((((8'hae) ?
                      (8'hac) : wire17) ?
                  (+(8'hb2)) : (wire3 ^ reg28)))));
              reg29 <= (^(reg28[(3'h7):(1'h1)] ?
                  $unsigned($signed($signed(wire17))) : reg26));
            end
          reg30 <= $signed(reg28[(1'h0):(1'h0)]);
        end
    end
  assign wire31 = ($signed(wire17) != $unsigned(wire19));
  assign wire32 = $unsigned($signed(wire17[(1'h0):(1'h0)]));
  assign wire33 = wire31;
  always
    @(posedge clk) begin
      reg34 <= (($unsigned(($unsigned((8'hab)) ?
              {wire0, reg28} : (wire17 ?
                  reg25 : wire19))) > (({wire31} >> reg24) ?
              {wire1[(1'h0):(1'h0)]} : ($unsigned(wire31) ~^ wire17))) ?
          $unsigned($signed(reg26)) : $unsigned((-(~^reg30[(1'h0):(1'h0)]))));
      reg35 <= (8'hac);
      reg36 <= wire3;
    end
  assign wire37 = reg36[(1'h1):(1'h1)];
  assign wire38 = ($signed($signed({{wire1}, $unsigned((8'hbd))})) ?
                      {wire17} : (reg27[(4'hd):(4'hc)] && $signed($unsigned($unsigned(reg27)))));
  assign wire39 = (~reg26);
  always
    @(posedge clk) begin
      if (wire3)
        begin
          if ((+($unsigned({$unsigned(wire39), (wire20 >> (8'ha4))}) ?
              (|(wire39[(3'h4):(1'h0)] == (wire1 ? wire3 : wire3))) : reg27)))
            begin
              reg40 <= ($signed(wire20[(1'h0):(1'h0)]) ?
                  ((+$unsigned((~^(8'hb1)))) ?
                      ({(wire17 ? wire37 : (8'h9f)),
                              (wire3 ? reg24 : (8'hb5))} ?
                          $signed({wire17}) : (wire3 == $signed(reg35))) : wire38) : {$signed(wire39)});
              reg41 <= $signed(reg22[(3'h7):(2'h2)]);
              reg42 <= wire4[(5'h14):(5'h12)];
            end
          else
            begin
              reg40 <= (~|(($unsigned(reg30) | $unsigned({(8'ha2)})) ^~ (~wire1)));
              reg41 <= wire31;
            end
          if ((8'ha3))
            begin
              reg43 <= reg27;
              reg44 <= reg42[(4'hf):(4'h8)];
              reg45 <= ((+wire17[(3'h7):(2'h3)]) || (!(wire3 ?
                  (-$unsigned((7'h44))) : $signed($signed(reg25)))));
              reg46 <= $signed((((reg41[(2'h2):(1'h0)] ? reg30 : (~^reg34)) ?
                  (~&$unsigned((7'h40))) : reg35) && (($unsigned(wire33) ?
                  (-reg36) : ((8'ha5) ? wire33 : reg45)) * wire38)));
              reg47 <= ((^($signed($signed(reg29)) >>> ($signed(reg41) ?
                      (wire37 ? (8'ha9) : wire0) : wire31[(1'h1):(1'h0)]))) ?
                  $unsigned((((-wire2) ?
                      wire17 : (wire19 <<< reg44)) ^ $unsigned($signed((8'hb6))))) : ($unsigned($signed((reg28 ?
                      (7'h40) : (7'h40)))) << $unsigned((7'h42))));
            end
          else
            begin
              reg43 <= ($signed($signed($unsigned(reg35))) ?
                  reg27 : wire37[(3'h4):(1'h0)]);
              reg44 <= $signed($signed({$unsigned($unsigned(reg22)),
                  (^$signed(reg25))}));
              reg45 <= $signed(reg29);
            end
        end
      else
        begin
          reg40 <= wire3;
          reg41 <= ((reg29[(4'h9):(1'h0)] > reg27) ?
              wire31[(4'h9):(3'h7)] : $signed((reg24 ?
                  $unsigned(reg45[(5'h12):(3'h6)]) : {reg41})));
          reg42 <= (^reg47[(3'h6):(2'h3)]);
          if (reg30[(3'h5):(1'h0)])
            begin
              reg43 <= $signed($unsigned(((reg45[(4'ha):(1'h1)] ?
                  wire17 : {reg46}) && $signed({reg21, (8'hae)}))));
              reg44 <= ((8'ha0) ?
                  (&$signed($signed($unsigned((8'hb6))))) : wire17[(4'h9):(4'h9)]);
              reg45 <= (!$unsigned($unsigned(wire20[(3'h6):(3'h6)])));
              reg46 <= wire20;
              reg47 <= {(((+(~|reg41)) | ((wire19 ? wire17 : reg36) * {reg44,
                          wire32})) ?
                      wire31 : $signed((reg24[(4'h9):(1'h0)] ?
                          $unsigned(reg28) : (7'h41))))};
            end
          else
            begin
              reg43 <= $signed(($unsigned((!{wire33, reg29})) ?
                  ($signed(wire37) ?
                      (-$signed(wire39)) : wire4[(2'h2):(1'h0)]) : (|(wire20 == wire0))));
            end
          if ($unsigned(((reg25[(3'h4):(2'h3)] && reg46[(1'h1):(1'h1)]) + {($signed(reg36) ?
                  $unsigned(wire1) : $signed(wire33)),
              $signed((~wire31))})))
            begin
              reg48 <= ((($signed(wire3) ?
                          $signed((reg29 ?
                              wire0 : reg27)) : {reg30[(2'h3):(2'h3)],
                              $unsigned(wire39)}) ?
                      {$signed((8'ha0))} : ($unsigned((~&reg21)) ?
                          $unsigned((wire19 ?
                              reg26 : wire32)) : reg26[(2'h2):(1'h1)])) ?
                  ($signed($unsigned($signed(reg40))) ?
                      (&{$unsigned(reg40),
                          (+wire33)}) : {wire19[(3'h5):(2'h2)]}) : $signed($signed((+(reg43 ?
                      reg44 : reg27)))));
              reg49 <= $signed((wire39[(1'h1):(1'h0)] ?
                  ((~|reg34[(2'h3):(2'h2)]) ?
                      $unsigned($signed(wire33)) : (reg46[(2'h2):(1'h0)] ?
                          (8'hb0) : (wire31 - reg30))) : $unsigned(wire4[(3'h5):(1'h1)])));
              reg50 <= ($signed(reg24[(1'h0):(1'h0)]) > wire3);
              reg51 <= {$unsigned((~&(+(reg26 ? wire31 : (8'hb6)))))};
              reg52 <= {{$signed(((reg36 && reg22) ?
                          $unsigned(reg26) : (reg26 ? reg41 : reg46))),
                      ((wire38[(3'h5):(1'h0)] ?
                          reg42 : (-reg49)) >= $signed(reg23[(1'h1):(1'h0)]))}};
            end
          else
            begin
              reg48 <= $unsigned((~^((((8'ha3) << wire3) >> ((8'hb2) ?
                      reg44 : reg26)) ?
                  ($signed((8'hb5)) <<< reg41[(2'h3):(1'h0)]) : wire31[(3'h4):(2'h2)])));
              reg49 <= $signed($unsigned({wire38[(4'h9):(2'h2)], reg50}));
              reg50 <= $unsigned($signed(reg45[(3'h5):(2'h2)]));
              reg51 <= $unsigned(wire2);
              reg52 <= wire33;
            end
        end
      reg53 <= $signed(({wire38[(2'h3):(2'h2)]} ?
          ((~(|reg26)) << ((&wire2) ?
              $signed(wire2) : $signed((8'hb0)))) : (|{$signed(wire37)})));
    end
  assign wire54 = ($signed((reg29 ?
                          $signed((reg48 < reg41)) : reg26[(2'h2):(1'h1)])) ?
                      {reg45[(4'h8):(1'h0)]} : (($unsigned((wire37 ?
                              wire37 : wire4)) ?
                          wire38[(2'h3):(2'h2)] : ($signed(wire39) ?
                              $signed(wire32) : reg51)) << {reg41[(2'h3):(2'h3)],
                          ($unsigned(wire19) * reg34[(3'h5):(2'h3)])}));
  assign wire55 = $unsigned($unsigned($unsigned({(wire54 > (8'hac)),
                      (reg46 ? (8'had) : wire31)})));
  assign wire56 = $unsigned((-wire31[(3'h6):(1'h0)]));
  assign wire57 = (^~$unsigned($signed((!((8'ha2) ? reg27 : reg26)))));
  assign wire58 = $unsigned($unsigned((&$signed($unsigned(reg41)))));
  assign wire59 = ({(+wire54)} ? wire55 : reg43);
  assign wire60 = reg47;
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire16, wire15, wire12, wire11, wire10, reg14, reg13, (1'h0)};
  assign wire10 = {((($signed(wire7) >= wire7[(4'h8):(3'h4)]) + wire8) != ($signed((^~(8'hb9))) <= {$unsigned(wire7)}))};
  assign wire11 = {wire9};
  assign wire12 = (~^$unsigned((((^~wire6) ?
                      (wire11 ? wire6 : wire9) : wire8) || $unsigned((wire6 ?
                      wire11 : wire6)))));
  always
    @(posedge clk) begin
      reg13 <= $unsigned(($unsigned((wire11 ? wire9 : (8'hb6))) & wire6));
      reg14 <= ($unsigned($signed((!wire11[(1'h1):(1'h0)]))) ?
          {{$unsigned(wire11), (wire12 ? $signed(wire10) : {wire11})},
              (8'hb2)} : ((~^(wire12[(2'h2):(1'h1)] ?
                  $signed(wire11) : wire6)) ?
              (reg13[(1'h0):(1'h0)] ?
                  (reg13 < ((7'h43) ? wire6 : wire10)) : (|wire10)) : wire9));
    end
  assign wire15 = wire12;
  assign wire16 = reg14;
endmodule
