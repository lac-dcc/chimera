module top
#(parameter param65 = (~^(~((~|(~(7'h41))) ? (^((8'hb1) ? (8'ha8) : (8'hbd))) : {((8'ha2) | (8'haa))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h212):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire19;
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire54,
                 wire53,
                 wire50,
                 wire42,
                 wire41,
                 wire40,
                 wire5,
                 wire19,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
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
  assign wire5 = {(wire0[(3'h7):(3'h4)] ^~ $unsigned((~|(wire3 ?
                         wire1 : wire3)))),
                     (^(|$signed($unsigned(wire1))))};
  module6 #() modinst20 (wire19, clk, wire2, wire5, wire4, wire0, wire1);
  always
    @(posedge clk) begin
      reg21 <= ($unsigned((~^$unsigned((wire1 * wire0)))) << wire4);
      if (wire4)
        begin
          reg22 <= (~wire2);
          reg23 <= $signed(($signed(wire0[(3'h5):(2'h3)]) ?
              $unsigned((|wire3[(4'h8):(2'h3)])) : $signed($unsigned(reg22))));
          reg24 <= {({reg21[(3'h6):(3'h6)]} != (($signed(wire0) | ((8'ha7) ?
                  wire1 : reg21)) - ((wire2 ?
                  wire5 : (8'hba)) >= wire4[(2'h2):(1'h0)])))};
          reg25 <= $unsigned(((&((wire2 ? wire19 : wire5) ?
                  wire2 : (reg24 ? wire0 : wire2))) ?
              $unsigned(((wire1 < wire4) & (8'hb1))) : (^(-(reg24 > wire5)))));
          reg26 <= (~&(wire3 ^~ (reg22 <<< wire5)));
        end
      else
        begin
          reg22 <= ((8'h9e) ? $unsigned((8'ha4)) : wire3[(4'hd):(1'h1)]);
          if ((wire1 == ($signed($signed({wire5})) ? reg25 : reg24)))
            begin
              reg23 <= (wire5 ?
                  reg24[(3'h7):(3'h4)] : {$unsigned($signed(reg23)),
                      $signed($signed((wire2 - (7'h40))))});
            end
          else
            begin
              reg23 <= ($unsigned($signed(reg25)) != $unsigned($unsigned((-(~&reg24)))));
              reg24 <= wire3;
            end
          if ($unsigned(($unsigned((!$signed(wire2))) ?
              (((wire19 > (8'hb5)) - $unsigned(wire0)) ?
                  $signed((wire5 ?
                      reg26 : wire5)) : ((wire3 || reg26) ^~ wire3)) : ((wire0 ?
                      wire5[(5'h13):(3'h6)] : (~wire19)) ?
                  reg22 : (wire0[(3'h7):(1'h1)] - (wire1 ? (8'ha3) : wire0))))))
            begin
              reg25 <= {$signed((wire2[(1'h1):(1'h1)] ?
                      $signed((wire19 * reg23)) : $signed({reg25})))};
              reg26 <= wire3[(4'hd):(3'h4)];
              reg27 <= wire4[(2'h3):(2'h3)];
            end
          else
            begin
              reg25 <= $unsigned(($unsigned(reg22[(1'h0):(1'h0)]) >= ($unsigned($signed(wire5)) ?
                  wire1 : reg22)));
              reg26 <= (((~{{reg24}}) * wire3[(4'h9):(4'h8)]) ?
                  (^~$unsigned((^~(reg27 > reg21)))) : ($unsigned(wire0[(1'h0):(1'h0)]) ?
                      reg24[(4'h8):(1'h0)] : $unsigned((wire1 >>> (reg22 || reg22)))));
            end
        end
      reg28 <= reg27[(4'h8):(2'h2)];
      reg29 <= reg23;
      if (wire1[(4'h8):(2'h3)])
        begin
          if (reg23[(3'h6):(3'h6)])
            begin
              reg30 <= {reg24, (reg22 ? wire3[(1'h0):(1'h0)] : reg29)};
            end
          else
            begin
              reg30 <= (((-({(8'hbe),
                      reg27} ^~ (&reg27))) >= wire5[(3'h6):(2'h2)]) ?
                  reg29 : ((~({wire3, reg26} ? (~|reg29) : wire1)) ?
                      {((+wire2) ? (reg25 ? wire1 : wire0) : $unsigned(reg23)),
                          reg21} : $signed((^$unsigned(reg29)))));
              reg31 <= reg21;
              reg32 <= reg25;
              reg33 <= $unsigned((8'hab));
            end
          reg34 <= $unsigned(($signed((~(~^reg21))) ?
              reg26 : reg32[(4'hb):(2'h3)]));
          reg35 <= (reg32[(3'h7):(1'h0)] & {reg22, (^wire0[(1'h1):(1'h1)])});
          if (((~&(({reg31} ? (8'hb7) : wire4) ^ ((^(8'hab)) ?
              $signed(reg35) : reg23[(4'ha):(1'h0)]))) + reg27[(3'h4):(1'h1)]))
            begin
              reg36 <= (^~($signed(reg27[(3'h6):(2'h3)]) ?
                  $unsigned($signed(reg34[(3'h4):(1'h1)])) : (-$signed(reg34))));
              reg37 <= ({((8'hb6) < $unsigned(reg22[(3'h5):(3'h5)]))} ?
                  reg36 : ($unsigned((^~$unsigned(reg21))) << wire4[(3'h5):(1'h1)]));
              reg38 <= ((((8'hbd) ?
                      ($unsigned(reg26) | $unsigned(reg37)) : $unsigned((reg23 ?
                          reg21 : wire1))) ?
                  $unsigned(reg21[(4'h8):(2'h3)]) : (8'had)) << $signed(($unsigned(reg22[(2'h2):(1'h0)]) ?
                  reg29[(3'h5):(2'h3)] : (reg37 & reg34[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg36 <= wire19;
              reg37 <= $signed(reg26);
              reg38 <= $unsigned($signed(reg22[(4'h8):(3'h7)]));
              reg39 <= $signed($unsigned((~^reg38)));
            end
        end
      else
        begin
          reg30 <= {reg36[(4'ha):(2'h3)]};
          reg31 <= reg21;
          reg32 <= $unsigned($unsigned((-reg22[(4'ha):(3'h5)])));
          reg33 <= reg24[(2'h2):(2'h2)];
          reg34 <= (+((~reg35) ? (+(^(|reg32))) : (&{$signed(wire1)})));
        end
    end
  assign wire40 = (~$unsigned((!reg37)));
  assign wire41 = $signed(($signed($signed($signed(reg25))) | $signed(($signed(reg34) ?
                      reg36[(5'h11):(3'h6)] : ((8'hba) > wire0)))));
  assign wire42 = (8'h9f);
  always
    @(posedge clk) begin
      if (wire19[(3'h6):(1'h0)])
        begin
          reg43 <= $signed(wire42[(3'h7):(3'h5)]);
          reg44 <= $unsigned($unsigned($signed((|{wire19, reg33}))));
          reg45 <= reg21[(3'h7):(3'h5)];
          reg46 <= $unsigned($unsigned(($unsigned((reg34 ?
              reg38 : reg35)) != (^reg45[(3'h6):(3'h4)]))));
          reg47 <= {(reg22 + (8'haa)), {reg26, reg39[(1'h0):(1'h0)]}};
        end
      else
        begin
          reg43 <= {$signed($unsigned($signed($unsigned(wire0))))};
          reg44 <= (|(wire0 ?
              reg21[(4'h9):(3'h7)] : ((+$signed(reg24)) + $signed($signed(reg28)))));
          if (wire40)
            begin
              reg45 <= (+(wire1[(4'he):(4'hb)] ?
                  {(~^reg46[(1'h1):(1'h1)])} : $signed(wire19)));
              reg46 <= (^(reg38 ? reg25 : (&(!$unsigned(reg38)))));
            end
          else
            begin
              reg45 <= reg39;
              reg46 <= ($unsigned(wire2[(3'h5):(2'h3)]) ?
                  (reg33[(4'h8):(4'h8)] < (reg43[(1'h0):(1'h0)] ?
                      wire40 : {(reg43 ? reg21 : wire42),
                          (8'ha5)})) : $unsigned(reg43[(3'h6):(3'h4)]));
              reg47 <= $signed((!{wire3[(4'hc):(3'h7)], reg33}));
              reg48 <= reg25[(3'h7):(3'h5)];
            end
          reg49 <= (~(^($unsigned($signed(reg22)) ?
              ((reg28 + reg33) <<< reg27) : $unsigned($unsigned(reg45)))));
        end
    end
  assign wire50 = ($unsigned($unsigned($unsigned((reg23 ? reg36 : wire3)))) ?
                      reg46[(1'h1):(1'h1)] : ($signed($unsigned($unsigned((8'hab)))) ?
                          {(^(reg23 ?
                                  wire0 : (8'hbb)))} : reg49[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      reg51 <= (reg31[(4'h8):(3'h4)] ?
          ({$unsigned(wire42)} >>> reg47[(4'hb):(3'h5)]) : (~$unsigned((reg47[(3'h4):(1'h0)] <<< $unsigned(wire40)))));
      reg52 <= $unsigned($signed(reg39[(2'h2):(1'h0)]));
    end
  assign wire53 = {((+($signed(wire40) | reg43[(4'h8):(4'h8)])) ?
                          ($unsigned(reg21) - ((wire1 ? (7'h40) : (8'ha7)) ?
                              wire1 : $signed(reg38))) : (8'hbf))};
  assign wire54 = reg47[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg55 <= ($signed(reg34) ?
          (~&$unsigned(wire0)) : (reg28 ?
              (-wire53) : $unsigned(((reg23 ? (8'h9e) : wire53) ?
                  (wire50 ? wire19 : reg30) : $unsigned(reg39)))));
      if ($signed($signed((&($unsigned(reg37) == $signed(reg31))))))
        begin
          reg56 <= $unsigned(wire2[(2'h3):(2'h3)]);
          reg57 <= ($signed($unsigned((reg49 < (reg23 ?
              wire5 : reg23)))) ^~ reg52);
          reg58 <= ((+$signed(wire40[(4'h8):(1'h1)])) * reg24[(1'h0):(1'h0)]);
        end
      else
        begin
          if (reg39[(1'h0):(1'h0)])
            begin
              reg56 <= (~|$unsigned($signed({wire50[(1'h0):(1'h0)]})));
              reg57 <= $unsigned($signed(((&(~^reg27)) >> ((~&reg45) ?
                  ((8'ha9) ? wire3 : reg21) : (reg56 ^~ reg28)))));
              reg58 <= ((reg25 ^ $signed(($unsigned((8'hae)) <<< reg35[(2'h2):(1'h0)]))) && $unsigned({$signed((reg48 <= (8'hb1))),
                  {{wire2}, (^~reg51)}}));
            end
          else
            begin
              reg56 <= $unsigned((wire4[(2'h3):(1'h1)] ?
                  $unsigned(reg34[(1'h0):(1'h0)]) : {((~^wire50) > (wire54 > reg26)),
                      ($signed((8'h9e)) ? reg52 : reg35[(3'h4):(1'h1)])}));
            end
          if (wire1)
            begin
              reg59 <= $unsigned($signed(wire4));
              reg60 <= (8'ha4);
            end
          else
            begin
              reg59 <= wire42;
            end
        end
    end
  assign wire61 = (($unsigned(reg31) ?
                          ((+{(8'h9e)}) ?
                              $unsigned($unsigned(wire1)) : {(reg43 >> reg43),
                                  reg52[(4'he):(4'ha)]}) : reg38[(1'h1):(1'h0)]) ?
                      ($unsigned((!$unsigned((8'haa)))) ?
                          ((~&(reg58 ^ reg51)) ^ $signed(reg60)) : $unsigned(wire5[(5'h12):(1'h0)])) : (~&(~^(~$unsigned(reg47)))));
  assign wire62 = {wire42};
  assign wire63 = {$signed({($unsigned(wire0) ? (-reg48) : reg23),
                          $signed($unsigned(reg44))})};
  assign wire64 = wire61;
endmodule

module module6
#(parameter param18 = (8'hb7))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  assign y = {wire17, wire16, wire14, wire13, wire12, reg15, (1'h0)};
  assign wire12 = wire11;
  assign wire13 = ((wire9 ~^ {((wire8 ? wire11 : (8'ha1)) ?
                          $signed(wire7) : (wire10 ?
                              (8'hbe) : wire12))}) | wire9[(4'ha):(3'h4)]);
  assign wire14 = (~&(~&((8'ha6) >>> (~|(wire8 ^ wire7)))));
  always
    @(posedge clk) begin
      reg15 <= wire9;
    end
  assign wire16 = (((($signed(wire13) ?
                              (reg15 & wire9) : wire7[(4'hf):(4'hd)]) & {wire12,
                              $signed(wire12)}) ?
                          (wire13[(4'h8):(3'h5)] ^~ (wire13 ?
                              wire14 : wire9[(3'h4):(1'h0)])) : $unsigned($signed($unsigned(wire9)))) ?
                      wire9 : $signed((^~wire7[(1'h0):(1'h0)])));
  assign wire17 = ($unsigned((8'hbc)) != wire7);
endmodule
