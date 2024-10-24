module top
#(parameter param86 = ((8'h9e) & (((((8'ha4) ? (8'hb7) : (7'h44)) * {(8'ha8)}) ? (-((8'hb5) ? (8'haa) : (8'hab))) : (^~((8'hb9) ? (8'h9e) : (8'hb3)))) ^ (|({(8'hb6)} ? (8'hb5) : (~(8'h9e)))))), 
parameter param87 = {{param86, (&((!param86) ? (8'ha2) : (~^param86)))}})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire84;
  assign y = {wire4, wire5, wire6, wire7, wire84, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (((wire3 >> $signed((-wire2))) ?
                     $unsigned(wire4) : (+$signed(wire4[(3'h5):(3'h5)]))) ~^ ($signed(($unsigned(wire2) ?
                     {wire4,
                         wire1} : (~|wire1))) & (wire0 ^ wire0[(3'h6):(2'h3)])));
  assign wire6 = $signed(wire0);
  assign wire7 = $signed($unsigned(($unsigned(wire5[(1'h1):(1'h1)]) >>> wire5)));
  module8 #() modinst85 (.wire11(wire4), .clk(clk), .wire13(wire6), .wire10(wire2), .wire9(wire5), .y(wire84), .wire12(wire1));
endmodule

module module8
#(parameter param82 = ({{(((8'h9d) ? (8'h9c) : (8'hae)) << ((8'hb6) >>> (8'haf))), (~(^~(8'ha1)))}} < ((7'h44) | ((((8'ha6) ? (8'ha2) : (8'h9c)) < (^(8'hba))) ? ((8'had) >>> (~&(8'haa))) : ((8'ha1) <<< (~&(8'hbf)))))), 
parameter param83 = {{param82}})
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h287):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire80;
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  assign y = {wire14,
                 wire15,
                 wire42,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire80,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
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
                 (1'h0)};
  assign wire14 = (!(($unsigned(wire13) ?
                          $signed({wire9}) : ((wire12 ^ wire10) ?
                              $unsigned(wire9) : (8'hbd))) ?
                      wire12[(3'h6):(3'h4)] : wire10[(2'h3):(2'h3)]));
  assign wire15 = $unsigned((wire9 - wire13));
  always
    @(posedge clk) begin
      reg16 <= (((~((wire12 ~^ wire15) ? (-wire12) : $unsigned(wire15))) ?
          $unsigned(wire13) : $unsigned(wire10)) || {(wire11 | wire11),
          $signed(($signed(wire10) + (wire13 ? wire13 : wire15)))});
      if (wire9)
        begin
          reg17 <= {(wire9 ? $unsigned((-wire14)) : wire13)};
          if ((|(wire9[(2'h3):(1'h1)] & ($signed($unsigned(reg17)) >> (~reg17[(1'h0):(1'h0)])))))
            begin
              reg18 <= $unsigned((^wire15[(4'ha):(2'h2)]));
              reg19 <= wire15[(1'h1):(1'h0)];
              reg20 <= ((8'ha6) >= (8'hbb));
            end
          else
            begin
              reg18 <= wire11[(1'h1):(1'h1)];
            end
          if ((reg18 >> $unsigned((wire13 ?
              $unsigned(wire11[(2'h2):(1'h0)]) : $signed((wire10 - wire14))))))
            begin
              reg21 <= $unsigned((|(^~((reg18 >>> (7'h44)) << (wire14 * wire10)))));
              reg22 <= wire11;
            end
          else
            begin
              reg21 <= (~^$signed((reg18[(3'h6):(1'h1)] ?
                  $unsigned($unsigned(reg17)) : (wire9 >= $unsigned(wire11)))));
              reg22 <= (~^(|(((7'h44) ? (^(8'ha4)) : reg22) ?
                  $signed((wire15 & wire11)) : reg22[(2'h2):(1'h0)])));
              reg23 <= (+$unsigned((|reg18[(2'h2):(1'h1)])));
              reg24 <= $signed($signed({($signed(reg20) && (wire14 ?
                      wire9 : reg21))}));
            end
        end
      else
        begin
          if ($unsigned($signed($signed(wire13))))
            begin
              reg17 <= (|reg22[(1'h1):(1'h0)]);
              reg18 <= $signed((^(8'hb6)));
              reg19 <= wire9;
              reg20 <= (+{(8'h9f)});
              reg21 <= $signed(($unsigned(((reg16 ? wire11 : reg20) ?
                      $unsigned(reg18) : (reg21 ? wire11 : (8'hb0)))) ?
                  ($signed(reg20) ?
                      $signed({reg21}) : $signed($signed(wire9))) : (wire14[(3'h5):(2'h2)] ?
                      (reg18 ?
                          $signed(reg16) : (reg19 ?
                              wire12 : wire10)) : reg16)));
            end
          else
            begin
              reg17 <= (8'h9c);
              reg18 <= $signed(wire12[(3'h4):(3'h4)]);
              reg19 <= $signed($unsigned({reg16[(4'hb):(2'h3)]}));
              reg20 <= $unsigned(({((wire14 ~^ reg22) < reg18[(4'hb):(4'ha)])} != wire10[(4'hd):(2'h2)]));
            end
          if ($unsigned($signed($unsigned({reg18}))))
            begin
              reg22 <= ((wire9[(4'he):(3'h6)] >>> reg22[(1'h0):(1'h0)]) || ($unsigned(({(8'h9e),
                          wire15} ?
                      wire15 : (reg18 == wire12))) ?
                  reg20[(3'h4):(1'h0)] : $unsigned($signed($signed(reg24)))));
              reg23 <= ((|$unsigned((7'h44))) ?
                  $signed($signed(($unsigned(reg23) ?
                      $signed((8'ha0)) : (wire15 >= reg21)))) : (~(~&$signed((reg17 ?
                      wire9 : reg22)))));
            end
          else
            begin
              reg22 <= (^~reg22);
            end
          if ((!(reg17[(2'h3):(1'h1)] >= $signed(reg18))))
            begin
              reg24 <= (~|$unsigned((($unsigned(reg20) << (reg23 ?
                  (8'h9f) : (8'hb0))) <<< reg22)));
              reg25 <= wire14;
            end
          else
            begin
              reg24 <= reg25[(2'h3):(1'h1)];
              reg25 <= reg22;
              reg26 <= reg23;
              reg27 <= $signed($unsigned(reg26));
            end
        end
      if (reg21)
        begin
          reg28 <= wire11;
        end
      else
        begin
          reg28 <= reg23;
          reg29 <= {(^~(!$signed((7'h41)))),
              $signed(((-(wire12 || wire9)) ?
                  ((reg21 ^~ reg19) ?
                      $signed(reg26) : wire13[(4'h9):(1'h0)]) : reg23[(4'hf):(1'h0)]))};
          reg30 <= {reg19[(3'h7):(3'h4)],
              $signed((((wire9 ? reg20 : wire13) || reg23[(4'ha):(3'h7)]) ?
                  reg27[(4'hb):(4'h9)] : reg18[(4'hd):(4'h9)]))};
        end
      reg31 <= ($unsigned(reg25[(2'h3):(1'h0)]) ?
          $signed($signed((wire13 ~^ $unsigned((8'hb5))))) : {$signed((8'ha1))});
    end
  always
    @(posedge clk) begin
      if (reg16)
        begin
          reg32 <= $unsigned($signed((~^(~|(wire10 ? reg26 : reg24)))));
        end
      else
        begin
          if ($unsigned(((8'hb7) == $signed($signed(reg19)))))
            begin
              reg32 <= reg32;
              reg33 <= (reg29 ^~ reg23[(1'h0):(1'h0)]);
              reg34 <= $unsigned(((wire10 ?
                      ((!reg33) ?
                          $unsigned(wire13) : (~^reg18)) : reg28[(3'h6):(1'h1)]) ?
                  $unsigned($unsigned($signed((8'hb1)))) : (((reg26 * (8'hb9)) || {reg23}) ?
                      reg25 : (reg16[(3'h6):(2'h3)] || {reg28, (8'hab)}))));
              reg35 <= $signed($signed((+((~reg26) ?
                  (8'hbf) : $signed((8'haf))))));
            end
          else
            begin
              reg32 <= $unsigned($signed($signed(({wire11} > reg35[(2'h3):(1'h0)]))));
              reg33 <= ($signed((&reg31[(3'h6):(2'h3)])) ?
                  $signed((^((reg33 <= reg24) ?
                      wire11 : wire12))) : {reg20[(4'hc):(4'h8)],
                      (~|wire11[(1'h1):(1'h1)])});
              reg34 <= $unsigned({$signed($unsigned((~|wire14)))});
              reg35 <= ($signed(reg28) ?
                  reg27 : $unsigned((reg32[(3'h7):(1'h0)] ~^ reg32[(3'h4):(1'h1)])));
            end
          if ($unsigned(reg16[(3'h7):(3'h6)]))
            begin
              reg36 <= $unsigned(reg21[(4'hc):(2'h3)]);
              reg37 <= ($unsigned(reg19[(5'h13):(4'hf)]) ^ reg31[(3'h4):(2'h3)]);
              reg38 <= $unsigned((~|($unsigned(reg16[(1'h0):(1'h0)]) ?
                  reg23 : reg25[(2'h3):(2'h2)])));
              reg39 <= (8'ha3);
              reg40 <= $signed(reg22[(2'h2):(2'h2)]);
            end
          else
            begin
              reg36 <= (wire14[(4'hc):(4'hc)] | (reg27[(2'h2):(1'h0)] | (^~$signed({reg25}))));
              reg37 <= $unsigned($signed($signed((8'hb4))));
              reg38 <= {reg17[(4'h8):(1'h0)]};
              reg39 <= (reg37 ?
                  ((+$unsigned((reg36 && (8'ha6)))) ?
                      (($signed(wire11) == reg28[(4'ha):(3'h6)]) | $signed((~(7'h42)))) : reg23[(4'ha):(2'h2)]) : $signed((&((reg35 ?
                          reg21 : reg27) ?
                      $unsigned((8'hb0)) : wire9))));
            end
          reg41 <= (^~$unsigned((((+(8'h9d)) ? (~|reg20) : {reg22}) ?
              (~{reg19, reg19}) : ((reg19 ?
                  reg37 : reg36) << reg34[(3'h4):(1'h0)]))));
        end
    end
  assign wire42 = wire12;
  always
    @(posedge clk) begin
      reg43 <= wire10;
      reg44 <= ($signed($signed(reg17)) - (8'hb0));
      if ($unsigned(wire12[(2'h2):(1'h1)]))
        begin
          reg45 <= reg16[(4'hb):(4'hb)];
          reg46 <= reg41;
          if ($signed(($unsigned((^~$unsigned((8'ha4)))) << {reg22[(2'h2):(2'h2)]})))
            begin
              reg47 <= $signed($signed(reg28[(4'h9):(4'h8)]));
            end
          else
            begin
              reg47 <= $unsigned($unsigned(reg19[(5'h13):(3'h7)]));
              reg48 <= (($signed(reg27[(3'h6):(3'h4)]) ?
                      {$unsigned({reg38}),
                          $signed($unsigned(reg23))} : ($unsigned(reg17[(3'h6):(1'h0)]) <<< wire10[(4'ha):(2'h3)])) ?
                  $signed(({reg30[(2'h3):(2'h3)]} ?
                      wire9[(4'hf):(4'hd)] : reg44)) : wire13);
              reg49 <= reg39;
            end
          if (reg36)
            begin
              reg50 <= (~&((($signed(wire42) ^ (reg43 * reg22)) ?
                  ($unsigned(wire9) < (reg26 ?
                      reg26 : wire10)) : (~^$signed(reg31))) ~^ (($signed(wire15) ?
                      $unsigned(reg29) : reg40) ?
                  $unsigned(wire12) : ((wire10 ? (8'ha7) : reg17) < (reg33 ?
                      reg33 : (8'ha4))))));
              reg51 <= (8'ha6);
              reg52 <= (^{$unsigned($unsigned(reg31))});
              reg53 <= ($unsigned(reg29[(2'h3):(2'h2)]) >> $signed({wire10,
                  $signed(reg20[(2'h3):(1'h1)])}));
            end
          else
            begin
              reg50 <= reg51;
              reg51 <= $signed($signed(({{reg43, reg43}, {reg38}} ?
                  $signed(reg17) : reg49[(2'h2):(1'h1)])));
              reg52 <= (~($signed($signed($unsigned(reg23))) | {(|(~|(8'hac)))}));
              reg53 <= (^~$signed((reg31[(1'h0):(1'h0)] ?
                  $signed(reg24) : reg40[(4'hc):(4'hb)])));
              reg54 <= wire13[(3'h6):(2'h3)];
            end
        end
      else
        begin
          reg45 <= (8'ha6);
          reg46 <= reg19[(4'hc):(4'h9)];
          reg47 <= $unsigned(reg39);
          reg48 <= (^~(((&(reg23 ? reg45 : (8'ha3))) <= (-{reg32})) ?
              $unsigned($signed(reg47)) : reg28));
          reg49 <= $unsigned((((wire14[(4'ha):(2'h2)] ?
              $signed(reg54) : $unsigned(reg26)) | ((reg39 ? reg31 : reg21) ?
              (~&reg44) : (+reg24))) | {reg34}));
        end
      reg55 <= reg31[(4'he):(4'hd)];
    end
  assign wire56 = $signed({(~reg54[(3'h6):(2'h2)]),
                      ($signed(((8'hb7) != wire14)) > $unsigned((reg33 ^ wire13)))});
  assign wire57 = reg30[(4'h9):(4'h8)];
  assign wire58 = (|reg19[(1'h1):(1'h1)]);
  assign wire59 = (~wire9[(2'h3):(1'h1)]);
  assign wire60 = ({{(~|(wire42 ? reg47 : wire13)), wire57[(2'h3):(2'h3)]},
                      reg29} * reg31[(3'h5):(2'h3)]);
  assign wire61 = $unsigned((~|reg36));
  assign wire62 = $unsigned(((((|(8'hbf)) ?
                          reg43[(4'ha):(3'h7)] : $signed(reg38)) - ((reg27 | reg33) << reg45[(2'h2):(1'h0)])) ?
                      ($signed((|wire59)) ?
                          $signed((^~reg48)) : reg21) : (reg41 ~^ reg29)));
  assign wire63 = reg18;
  assign wire64 = $signed(reg37[(4'h8):(3'h4)]);
  assign wire65 = ((((~^reg39) ~^ wire14[(4'hb):(3'h5)]) ?
                      $signed(((~|(7'h42)) != reg53[(3'h5):(3'h4)])) : wire12[(3'h4):(1'h1)]) || reg33[(4'h9):(4'h8)]);
  assign wire66 = (($signed(($signed((7'h42)) ?
                      (wire13 ?
                          reg52 : reg16) : $unsigned(reg22))) << $signed((((8'hba) >> reg30) ?
                      wire59[(2'h2):(2'h2)] : reg22[(1'h0):(1'h0)]))) - ($signed($unsigned((reg27 << reg48))) & wire42[(1'h1):(1'h0)]));
  module67 #() modinst81 (wire80, clk, reg35, reg36, reg27, wire65);
endmodule

module module67  (y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire71;
  input wire signed [(2'h3):(1'h0)] wire70;
  input wire signed [(5'h14):(1'h0)] wire69;
  input wire [(2'h3):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(4'hf):(1'h0)] wire72;
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 (1'h0)};
  assign wire72 = $signed($signed($unsigned((wire71[(3'h5):(1'h0)] ?
                      wire68[(2'h3):(1'h1)] : (wire70 ? wire71 : wire69)))));
  assign wire73 = $unsigned(($unsigned({wire72}) ? wire70 : wire69));
  assign wire74 = (!(^~(wire68 ?
                      wire68[(2'h2):(2'h2)] : (~^(wire70 ? wire70 : wire72)))));
  assign wire75 = wire69[(4'hb):(4'h9)];
  assign wire76 = wire68[(1'h0):(1'h0)];
  assign wire77 = ({$signed((|(wire74 ?
                          wire73 : wire72)))} == wire75[(3'h6):(1'h1)]);
  assign wire78 = $signed(((wire71[(2'h3):(2'h2)] ?
                          {{(8'ha4)},
                              $signed(wire71)} : wire77[(3'h5):(1'h1)]) ?
                      (8'hb6) : (!$unsigned(wire69[(3'h5):(3'h5)]))));
  assign wire79 = (~|$signed(($signed($unsigned(wire77)) ^ ((~|wire77) * wire73[(4'hb):(4'h9)]))));
endmodule
