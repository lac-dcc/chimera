module top
#(parameter param75 = ((((((8'ha4) != (8'haf)) > (8'hab)) ? ({(8'hb1), (8'hb1)} <= (8'hba)) : {(8'hb7)}) || (((+(8'haf)) ^~ ((8'ha2) ? (8'ha4) : (8'ha5))) ? (((8'h9f) - (8'hb1)) > {(7'h40), (8'ha0)}) : (-((8'h9d) * (8'hb5))))) ? ({(~^((8'h9c) + (8'ha4)))} ? ((((8'hb9) || (8'hbd)) ? {(8'hbe)} : {(8'hbc), (8'had)}) ? {((7'h44) ? (8'hbb) : (8'h9f)), (|(8'ha0))} : (((8'hb8) ? (8'hae) : (8'h9e)) ? {(8'ha3)} : ((8'hb2) ? (7'h44) : (8'ha2)))) : ({(&(8'hbe)), ((7'h44) ^~ (8'hb2))} ? (~^((8'ha4) ? (8'ha8) : (8'hb9))) : (((8'ha6) ? (8'hab) : (8'hb4)) <= ((8'ha1) ? (7'h44) : (8'hb8))))) : (&(-(((7'h43) ? (8'h9c) : (8'h9f)) | (&(8'ha5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire70;
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  assign y = {wire74, wire72, wire70, reg73, (1'h0)};
  module5 #() modinst71 (.y(wire70), .wire6(wire0), .wire8(wire3), .wire9(wire4), .clk(clk), .wire7(wire1));
  assign wire72 = $unsigned((wire3 ? (~^wire1) : wire0[(4'hf):(1'h0)]));
  always
    @(posedge clk) begin
      reg73 <= ($signed(({wire4} ?
          wire70[(3'h6):(1'h1)] : ($signed(wire2) ?
              {(8'haf)} : wire70))) && ((((wire0 ? wire1 : wire0) ?
          {wire72} : $signed(wire3)) ^ (+wire1[(2'h3):(2'h2)])) >> $unsigned($unsigned(wire1))));
    end
  assign wire74 = wire70[(2'h3):(1'h0)];
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire10;
  assign y = {wire69, wire68, wire66, wire10, (1'h0)};
  assign wire10 = wire7;
  module11 #() modinst67 (wire66, clk, wire9, wire10, wire6, wire7);
  assign wire68 = {wire9[(1'h1):(1'h1)]};
  assign wire69 = wire10;
endmodule

module module11
#(parameter param64 = {(((((8'hae) + (8'ha6)) - ((8'ha6) >= (8'hb8))) & (~^(&(8'ha4)))) ? (-(((8'hac) | (8'hbd)) ? ((8'hb1) ? (8'hbf) : (7'h44)) : ((8'h9c) > (8'ha2)))) : (!(-{(8'hbf)}))), (^((((8'ha5) ? (8'hbc) : (8'hbd)) ? ((8'h9d) ? (8'ha6) : (7'h43)) : ((8'hb2) ? (8'ha7) : (8'hb5))) || {((7'h40) ? (8'hbe) : (8'ha7))}))}, 
parameter param65 = ((param64 <<< (param64 > {(param64 ? (8'ha7) : param64)})) ? ((((~|(8'hbf)) ? (param64 ? param64 : (8'h9f)) : param64) ? (+{param64}) : param64) <= (~param64)) : (param64 ? {(+(|param64)), {param64}} : (|(((7'h44) >> (8'haa)) - param64)))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h224):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire54,
                 wire53,
                 wire52,
                 wire28,
                 wire27,
                 wire26,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg57,
                 reg56,
                 reg55,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg20,
                 (1'h0)};
  assign wire16 = (|wire12[(2'h2):(1'h0)]);
  assign wire17 = ((($signed($signed(wire16)) >>> $unsigned($unsigned((8'h9d)))) << (|wire12[(4'h8):(2'h2)])) >>> $unsigned(wire13[(1'h0):(1'h0)]));
  assign wire18 = ((wire16[(3'h5):(1'h0)] ?
                      ((&{wire17,
                          wire12}) || wire15) : ($signed({wire17}) >= (8'ha2))) ^~ $unsigned(((wire16 ?
                      (+wire16) : (wire12 ?
                          wire16 : wire15)) > ($signed(wire13) ?
                      {wire15, wire13} : wire13))));
  assign wire19 = $unsigned((~^$signed(($signed(wire16) ?
                      (8'ha5) : (wire18 ? wire15 : wire15)))));
  always
    @(posedge clk) begin
      reg20 <= wire18;
    end
  assign wire21 = ((~&((wire15[(3'h4):(2'h3)] ?
                          wire13[(3'h4):(2'h3)] : wire17) | wire18)) ?
                      $signed($signed($signed($unsigned(wire16)))) : wire16[(4'ha):(4'ha)]);
  always
    @(posedge clk) begin
      reg22 <= (|wire18);
      reg23 <= $signed(wire15[(3'h4):(2'h2)]);
      reg24 <= ((reg22[(1'h0):(1'h0)] > (~^((reg20 ?
          reg23 : (8'hb2)) <<< $signed(reg23)))) && (-wire16));
      reg25 <= {$unsigned($signed($signed((&(8'hb3))))),
          $signed(($unsigned($signed((8'had))) ?
              $unsigned($unsigned(reg24)) : $signed((~^wire15))))};
    end
  assign wire26 = reg20[(4'hb):(1'h1)];
  assign wire27 = wire15;
  assign wire28 = (reg23[(3'h7):(1'h1)] - $unsigned(wire26[(3'h7):(1'h1)]));
  always
    @(posedge clk) begin
      reg29 <= (8'hb3);
      reg30 <= ($signed((((-wire27) ? (wire26 ? wire27 : (8'ha8)) : wire16) ?
              (8'hb4) : ($signed(wire18) ? (+wire14) : wire19))) ?
          reg29[(4'hc):(1'h0)] : (+($signed($unsigned((8'hb0))) >> (7'h42))));
      if ((((~&(reg24 << (&reg29))) ?
              $signed(($unsigned((8'hba)) <<< wire16[(1'h1):(1'h1)])) : (reg29 ?
                  wire13[(1'h1):(1'h0)] : wire15[(2'h2):(2'h2)])) ?
          $signed($unsigned($unsigned($unsigned(wire16)))) : ($signed(wire13) ?
              wire27 : {wire12})))
        begin
          reg31 <= {(($signed((reg29 < reg29)) >= (^~$unsigned(wire26))) ?
                  ($unsigned($unsigned(wire26)) ?
                      wire13[(2'h2):(2'h2)] : (^~(reg23 ?
                          wire16 : reg20))) : ({wire16[(3'h7):(3'h6)]} < wire14)),
              $signed($unsigned({(+wire28)}))};
        end
      else
        begin
          reg31 <= (wire12 >>> (~$unsigned(reg29)));
          if (reg24[(3'h5):(3'h5)])
            begin
              reg32 <= (reg25 ^ ($signed($unsigned((reg20 ?
                      (8'h9f) : wire26))) ?
                  {$unsigned($unsigned(reg23)),
                      ((reg24 <= (8'ha6)) ?
                          (wire28 ?
                              wire26 : wire27) : $signed(wire26))} : wire17[(2'h2):(1'h0)]));
              reg33 <= $signed(wire17);
              reg34 <= $signed((&(($signed((8'h9e)) ~^ $signed(reg23)) ?
                  {(~&reg30)} : $signed((wire21 ? reg33 : (8'hb8))))));
            end
          else
            begin
              reg32 <= reg32[(4'h8):(3'h6)];
            end
          reg35 <= ((wire19 > ((-$unsigned(wire14)) ?
              ((reg31 ~^ reg25) > (wire27 ?
                  wire21 : wire18)) : reg32)) >> {wire26, $unsigned(reg25)});
          reg36 <= reg34;
          if ($unsigned(($signed(((wire27 ? reg23 : reg31) ?
                  $unsigned(wire15) : {wire26, wire16})) ?
              (^~(reg34[(2'h3):(2'h2)] ?
                  (reg22 * (8'hb8)) : {wire19})) : reg36)))
            begin
              reg37 <= ((~&{reg22[(4'hc):(1'h0)]}) > {$unsigned($unsigned(((8'hae) * (8'haf))))});
            end
          else
            begin
              reg37 <= {(&($unsigned((reg36 & wire19)) - (~|reg23[(1'h0):(1'h0)])))};
              reg38 <= wire12[(4'h8):(2'h2)];
              reg39 <= (~|((((wire18 || (8'ha1)) & (-wire17)) ?
                      $unsigned((&(8'hb8))) : $signed(wire12)) ?
                  ($unsigned({wire12}) != (~|(reg30 - wire28))) : $unsigned($signed({wire13,
                      reg35}))));
              reg40 <= reg36;
            end
        end
      reg41 <= (wire28 ? wire26 : wire15[(5'h10):(4'hf)]);
      if ({reg38[(4'ha):(3'h6)], reg31})
        begin
          if ((reg30 >= (8'hb6)))
            begin
              reg42 <= reg41;
              reg43 <= (reg39[(1'h1):(1'h0)] ?
                  (-reg29) : ($unsigned(((wire16 && (8'hbf)) || $unsigned((8'hbc)))) ?
                      $unsigned(((wire19 != reg22) << reg38)) : (~&$unsigned((reg33 - wire14)))));
              reg44 <= $unsigned($signed({((~|wire28) ?
                      (wire12 ? (8'hb9) : (7'h40)) : {reg37, wire12}),
                  ((wire18 <<< reg22) ^~ (reg29 ? (7'h42) : (8'hb8)))}));
              reg45 <= (reg33[(3'h7):(3'h7)] ?
                  ($signed((&(reg29 <= (8'ha0)))) ?
                      (reg41 ?
                          {reg30[(1'h1):(1'h0)],
                              reg39[(1'h1):(1'h1)]} : ($signed(reg41) == ((8'ha3) ?
                              reg29 : (8'hb9)))) : wire26[(4'hb):(4'ha)]) : reg43);
            end
          else
            begin
              reg42 <= ((+{(^~$signed(reg41))}) ?
                  $unsigned(wire16[(3'h5):(2'h3)]) : reg33);
            end
          reg46 <= (~^{$unsigned(({wire21} & {(8'ha5)})), wire27});
          if ($signed(($signed(($unsigned(reg30) != $signed(wire19))) ?
              $unsigned($signed((wire21 > reg31))) : (8'had))))
            begin
              reg47 <= (^$unsigned($signed(reg20[(4'ha):(4'h8)])));
              reg48 <= ((reg42 && $signed(($unsigned(wire17) ?
                      ((8'hb1) ? reg36 : reg43) : reg34))) ?
                  ((!($unsigned(reg46) || (wire27 ? (8'hba) : reg30))) ?
                      ($unsigned($signed(reg34)) | reg38[(4'h9):(1'h1)]) : ((^((8'ha8) | reg35)) && ($signed(wire13) && $signed((8'hb6))))) : (((~&reg32[(4'h9):(3'h6)]) >>> (8'hb5)) ?
                      (~&(wire28 ^~ (8'hb5))) : $signed($signed($unsigned(wire21)))));
              reg49 <= ((~(reg41 ?
                      wire13[(3'h4):(3'h4)] : ((7'h42) != (8'ha3)))) ?
                  {($unsigned((wire14 ? (8'ha8) : reg31)) ?
                          ((reg43 ? (8'hab) : wire13) << (!wire13)) : {{wire14,
                                  wire16},
                              (reg31 | reg41)})} : ({($unsigned(reg39) || (reg30 ?
                              reg30 : (8'haf)))} ?
                      $unsigned({$signed(reg32),
                          (~^reg41)}) : (-$unsigned(reg42))));
              reg50 <= ({wire13[(1'h0):(1'h0)],
                  ($unsigned((^~(8'haf))) ?
                      (8'hac) : wire27[(3'h7):(3'h7)])} + (((reg38[(4'hb):(2'h2)] ?
                      (+(7'h40)) : wire21) ?
                  (~|reg31[(1'h1):(1'h1)]) : wire16) >>> ((!reg25[(3'h7):(3'h7)]) ^ reg31[(2'h3):(2'h3)])));
            end
          else
            begin
              reg47 <= (&$signed(($signed((&reg37)) ?
                  (reg50 ?
                      $unsigned((7'h40)) : $unsigned(reg41)) : ($unsigned(reg34) ?
                      (reg35 & wire16) : (wire27 ? reg45 : reg45)))));
            end
          reg51 <= (8'hae);
        end
      else
        begin
          if ($unsigned(((^~wire14[(3'h7):(1'h0)]) <<< (8'ha3))))
            begin
              reg42 <= ((-reg31) ?
                  ($signed((-$signed(reg51))) >> reg39) : (8'hbb));
              reg43 <= ((reg48 ?
                  wire28[(1'h1):(1'h0)] : (((reg46 ^~ reg25) != (wire19 ?
                      reg38 : reg32)) * $unsigned({wire13}))) & (reg41 ?
                  {$signed((reg41 ? reg20 : reg20))} : (~&((&(8'hb8)) ?
                      {reg48, reg44} : {wire27, reg42}))));
              reg44 <= $unsigned({((wire15[(5'h11):(5'h11)] ?
                          (reg51 ? reg46 : wire13) : $unsigned((8'ha0))) ?
                      reg23 : $unsigned(reg25))});
            end
          else
            begin
              reg42 <= ((({$signed(reg44),
                      {reg37,
                          (8'h9f)}} + $signed(wire17[(1'h0):(1'h0)])) != reg37[(1'h1):(1'h1)]) ?
                  $signed($signed(wire27[(5'h12):(4'h8)])) : ($unsigned(($signed(reg41) > $signed((8'h9f)))) ~^ reg46[(4'hb):(4'h8)]));
              reg43 <= $signed(($signed({(reg40 - (8'haa))}) ?
                  {reg45[(2'h3):(1'h0)],
                      (8'hb9)} : $signed($unsigned({reg42}))));
            end
          reg45 <= (({(reg49 && (8'hb4))} < ({wire18[(1'h1):(1'h1)],
                      $signed(reg38)} ?
                  wire19[(4'h8):(3'h4)] : $unsigned({wire21, reg25}))) ?
              reg36[(4'h9):(1'h0)] : ((~({reg20} && $unsigned(reg40))) ?
                  reg22[(5'h11):(4'h8)] : wire28[(2'h2):(1'h1)]));
          reg46 <= (wire21 != $signed(($unsigned($signed(reg25)) >> (^{(8'ha9),
              wire14}))));
          if ($signed(reg31))
            begin
              reg47 <= ((+(^(^~(wire26 ? reg44 : reg38)))) ?
                  {($signed((&reg37)) >>> wire18[(2'h3):(2'h2)]),
                      (~|$unsigned((wire21 >> reg44)))} : {$signed(($unsigned(reg34) ?
                          $signed(reg42) : wire28[(2'h3):(1'h0)])),
                      $signed((^reg34))});
              reg48 <= reg33;
            end
          else
            begin
              reg47 <= (^(8'hac));
              reg48 <= ($unsigned(reg31) ?
                  (8'hb0) : ((8'ha6) == ($signed({reg39}) >= wire19)));
            end
          reg49 <= $unsigned(wire26[(4'hb):(4'h8)]);
        end
    end
  assign wire52 = reg42;
  assign wire53 = ({(8'had)} ?
                      wire28[(3'h4):(1'h1)] : ($unsigned((reg41 ?
                          ((7'h44) ?
                              reg42 : wire13) : $signed(reg50))) >> $signed((~^reg42[(5'h12):(2'h2)]))));
  assign wire54 = reg32;
  always
    @(posedge clk) begin
      reg55 <= $unsigned((((reg31[(2'h3):(2'h2)] ?
              (reg45 ^~ reg41) : $unsigned(reg42)) <<< $signed(wire18)) ?
          (reg22[(4'hd):(1'h0)] ?
              (~^reg25) : (^$signed(reg51))) : $unsigned((^wire27[(1'h0):(1'h0)]))));
      reg56 <= reg32[(5'h15):(4'ha)];
    end
  always
    @(posedge clk) begin
      reg57 <= (!{{$signed({reg37}), ($signed(reg29) ? reg37 : wire21)}});
    end
  assign wire58 = {$signed(reg51[(4'hc):(3'h7)]), (^~(!reg23))};
  assign wire59 = reg46[(4'h8):(1'h0)];
  assign wire60 = wire13;
  assign wire61 = ({($unsigned($unsigned(reg36)) ?
                          $signed($signed(reg44)) : $unsigned((&wire54))),
                      {$unsigned($signed(wire52)),
                          ($signed((8'hb3)) >> (reg37 > reg33))}} + ((((wire19 < wire12) && reg23[(3'h4):(2'h2)]) ?
                          $unsigned($unsigned(reg46)) : wire21[(1'h0):(1'h0)]) ?
                      ($signed((reg31 >> wire59)) ~^ reg34[(2'h3):(1'h0)]) : $signed((|(reg31 || reg31)))));
  assign wire62 = reg39[(1'h0):(1'h0)];
  assign wire63 = wire27[(5'h12):(4'ha)];
endmodule
