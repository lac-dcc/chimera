module top
#(parameter param172 = (~|({(((8'ha5) * (7'h40)) >= ((8'hbf) + (7'h41))), ({(8'hb0)} != ((7'h43) ? (8'hbe) : (8'hbf)))} < ({(-(8'had)), (~|(8'hab))} ? (((8'h9d) ? (8'ha9) : (8'hb3)) || (+(8'hba))) : ((~^(8'ha9)) ~^ ((7'h42) < (7'h40)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire171;
  wire [(4'hb):(1'h0)] wire170;
  wire signed [(2'h2):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire167;
  wire [(4'hd):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire143;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire141;
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire167,
                 wire144,
                 wire143,
                 wire8,
                 wire9,
                 wire141,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((~|(7'h42)));
      reg5 <= (^wire0[(2'h2):(1'h1)]);
      reg6 <= (&(~&$unsigned($signed(wire0[(1'h0):(1'h0)]))));
      reg7 <= ($unsigned(($unsigned((^reg6)) ?
          reg5[(3'h6):(3'h6)] : (~|(wire3 ?
              reg4 : (8'hac))))) ^ wire2[(3'h4):(1'h0)]);
    end
  assign wire8 = $signed($unsigned((reg4[(3'h6):(2'h3)] & ($unsigned(reg5) ?
                     $signed((8'hbb)) : $signed((7'h41))))));
  assign wire9 = ($signed((wire2 ? (wire0 >>> (+reg6)) : reg6)) ?
                     reg6 : (~&$unsigned(wire0[(1'h1):(1'h0)])));
  module10 #() modinst142 (.y(wire141), .wire12(reg4), .clk(clk), .wire11(reg6), .wire13(reg7), .wire14(wire2));
  assign wire143 = (!wire2);
  assign wire144 = $signed(((reg5 < (wire0 ? reg5[(3'h6):(1'h1)] : (~|wire1))) ?
                       wire2[(4'he):(1'h1)] : wire143[(3'h4):(2'h2)]));
  module145 #() modinst168 (wire167, clk, wire3, reg6, wire2, reg7);
  assign wire169 = {{((wire144[(3'h6):(3'h5)] ?
                               wire8 : (reg5 <<< wire8)) ~^ reg6)},
                       {$signed(($signed(wire167) <= (~^reg5))),
                           ($unsigned((wire2 == wire144)) ^ reg7)}};
  assign wire170 = ((($unsigned(wire3) ?
                           ((wire2 ?
                               (8'ha0) : (7'h42)) >= reg7) : $signed($signed(reg6))) | $signed($unsigned(reg6))) ?
                       ((8'hb5) ^~ (^wire8[(3'h6):(3'h4)])) : (($unsigned((wire0 ?
                           wire9 : wire9)) && $unsigned(reg6[(5'h10):(1'h1)])) <<< reg7[(4'hd):(4'hc)]));
  assign wire171 = ($unsigned($signed($unsigned((8'hbb)))) && $signed((&reg4[(4'he):(2'h2)])));
endmodule

module module145
#(parameter param165 = ({({((8'hbc) ? (8'hbc) : (7'h40))} ? (|((8'h9c) + (7'h42))) : (((8'hb9) - (8'h9c)) ? ((8'ha4) ? (8'hb2) : (8'hab)) : (+(8'ha9)))), (+(~^(~(8'ha1))))} * (8'hb5)), 
parameter param166 = (^(((((8'ha2) <= param165) && {param165, param165}) ? param165 : ((|param165) ? (~|param165) : (param165 <<< (8'hb1)))) ? ((((8'ha7) == param165) ? {param165, param165} : (8'hb5)) ? (param165 ~^ (param165 && param165)) : ((param165 >= param165) ? (8'hba) : (param165 < (8'hb1)))) : {((8'ha3) ? (param165 ~^ param165) : (8'hb0))})))
(y, clk, wire149, wire148, wire147, wire146);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire149;
  input wire signed [(4'ha):(1'h0)] wire148;
  input wire signed [(5'h12):(1'h0)] wire147;
  input wire [(4'h8):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire164;
  wire signed [(5'h13):(1'h0)] wire163;
  wire [(3'h6):(1'h0)] wire162;
  wire [(4'hd):(1'h0)] wire161;
  reg [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg [(4'ha):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(4'ha):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire161,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg150 <= $unsigned(wire147);
      if (wire147[(5'h12):(1'h0)])
        begin
          reg151 <= ($signed((8'hb3)) ^~ {{$signed((wire147 < wire146)),
                  ((wire148 ? wire146 : wire149) ?
                      {(7'h43), reg150} : (wire147 ? wire149 : (8'ha2)))},
              (|$unsigned((~&reg150)))});
          if (wire148)
            begin
              reg152 <= (8'hb6);
              reg153 <= (8'hb7);
              reg154 <= $signed($unsigned(reg150));
            end
          else
            begin
              reg152 <= wire148;
              reg153 <= {{reg151, reg153[(1'h1):(1'h1)]},
                  (~$unsigned((-$unsigned(wire149))))};
              reg154 <= (reg154 + wire147[(5'h10):(4'hd)]);
              reg155 <= wire148[(3'h7):(3'h7)];
              reg156 <= wire149[(3'h5):(3'h4)];
            end
          if (((~|wire147[(5'h12):(4'he)]) ?
              wire147[(5'h12):(3'h5)] : (((~^(-wire146)) || {reg151,
                      reg153[(4'hb):(3'h7)]}) ?
                  ({$signed(wire147), ((8'hab) != reg154)} ?
                      (^~$unsigned((8'ha2))) : wire149) : {$signed(wire148)})))
            begin
              reg157 <= $unsigned(wire149);
              reg158 <= {$signed(wire148), $signed(reg152[(2'h2):(1'h0)])};
              reg159 <= $unsigned(reg154);
            end
          else
            begin
              reg157 <= (($unsigned(reg159) ?
                  reg154 : reg153) ^~ reg157[(4'he):(4'h9)]);
              reg158 <= ({reg154} ? reg158 : (&reg155));
              reg159 <= $unsigned(($unsigned((+$signed(wire148))) != $signed($unsigned($unsigned(reg152)))));
            end
        end
      else
        begin
          if (reg151[(5'h11):(2'h2)])
            begin
              reg151 <= reg158[(1'h1):(1'h0)];
            end
          else
            begin
              reg151 <= $signed(wire146[(3'h6):(2'h2)]);
              reg152 <= (8'ha6);
              reg153 <= reg152[(1'h0):(1'h0)];
            end
          reg154 <= reg151[(4'hf):(3'h6)];
          reg155 <= (~^(reg153[(4'hb):(4'ha)] & ($signed($unsigned(reg156)) & (&(^~reg158)))));
          reg156 <= $unsigned(wire146);
        end
      reg160 <= (8'haa);
    end
  assign wire161 = $unsigned($unsigned({reg158[(3'h7):(3'h5)]}));
  assign wire162 = ((reg150 << (^~$unsigned((~&reg160)))) ?
                       (^~(|$signed((wire147 + reg152)))) : {reg152[(1'h1):(1'h0)]});
  assign wire163 = (wire148[(1'h1):(1'h1)] == $unsigned((wire162 ?
                       $unsigned(wire149[(3'h7):(3'h4)]) : {reg158[(1'h1):(1'h0)],
                           (8'ha6)})));
  assign wire164 = ({$unsigned({$signed((7'h40))}),
                           $signed($signed((reg151 != (8'hb7))))} ?
                       $unsigned($unsigned($signed(((8'ha3) >= wire146)))) : (reg153 ?
                           $signed((^~(&reg160))) : $signed(($signed(reg152) ?
                               $unsigned((8'hbd)) : $signed(reg158)))));
endmodule

module module10
#(parameter param140 = ((({((8'ha5) + (8'ha0)), ((8'ha3) ? (8'ha2) : (8'hb1))} >= (8'ha9)) ^ (&((^~(8'ha3)) ? ((8'hb3) ^~ (8'hb8)) : (^(8'hb1))))) ^~ ((~|{((8'ha4) ? (8'hba) : (8'had))}) ? {((|(7'h44)) >> ((8'ha4) && (7'h42))), (^~((8'hb3) >>> (8'h9e)))} : ((+((7'h41) ? (8'ha7) : (8'hbc))) ? (((7'h44) >>> (7'h42)) ^~ (^(8'hbe))) : (8'ha4)))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h281):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire135;
  wire [(5'h10):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire135,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire70,
                 wire69,
                 wire67,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg137,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
                 (1'h0)};
  assign wire15 = (8'h9e);
  assign wire16 = wire15[(4'h9):(4'h9)];
  assign wire17 = wire16;
  assign wire18 = (((wire11[(4'hb):(3'h7)] ?
                              $unsigned((wire12 ?
                                  wire13 : wire11)) : wire13[(4'h9):(4'h9)]) ?
                          wire15 : {((wire16 ? (8'h9f) : wire16) ?
                                  {wire15, wire12} : wire12[(4'h9):(2'h3)]),
                              $unsigned(wire16[(1'h0):(1'h0)])}) ?
                      $unsigned(wire12[(3'h4):(1'h0)]) : (+(($signed(wire11) ?
                              wire12[(1'h0):(1'h0)] : $signed((8'hb1))) ?
                          $unsigned((wire16 ~^ wire16)) : ($signed(wire15) ?
                              (wire13 ? (8'hb8) : wire16) : (wire15 ?
                                  (7'h40) : wire17)))));
  assign wire19 = $signed((-(($unsigned(wire14) <= $unsigned((8'hae))) ~^ $unsigned(wire18[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      if (wire18[(2'h3):(2'h3)])
        begin
          reg20 <= wire15;
          if ($signed(wire15))
            begin
              reg21 <= (~wire19[(2'h2):(2'h2)]);
              reg22 <= $signed($signed($unsigned(({reg21,
                  wire12} <<< $signed((8'hbc))))));
              reg23 <= {((((!wire19) >> (wire14 ? wire14 : (8'h9d))) ?
                      ($signed(wire17) > (wire12 ?
                          reg22 : wire15)) : (((8'hb0) ?
                          wire16 : wire19) ~^ wire18)) ~^ reg21)};
            end
          else
            begin
              reg21 <= wire16[(3'h5):(2'h3)];
            end
          if ($unsigned({reg22[(2'h2):(2'h2)], $signed(wire12)}))
            begin
              reg24 <= $signed((+wire14[(1'h0):(1'h0)]));
              reg25 <= reg20;
              reg26 <= ((wire17 ?
                      (~$unsigned((8'ha6))) : wire17[(4'h8):(3'h6)]) ?
                  ((!((reg20 ? wire16 : reg25) && reg23)) * (wire14 ?
                      ({wire12, (7'h44)} ?
                          reg21 : (wire13 ?
                              wire11 : wire18)) : {((8'ha6) ^ reg23),
                          (wire19 >> (8'hb6))})) : (7'h43));
            end
          else
            begin
              reg24 <= $unsigned(wire14[(3'h4):(3'h4)]);
              reg25 <= $unsigned(reg22[(3'h5):(3'h5)]);
              reg26 <= {($unsigned({wire11}) ?
                      $signed(({wire14} == (wire15 | reg25))) : $unsigned((|(reg25 & wire14))))};
              reg27 <= (-wire16[(2'h2):(2'h2)]);
              reg28 <= ($unsigned($unsigned($signed($signed(reg20)))) != $unsigned($signed($unsigned((reg25 ?
                  wire15 : reg23)))));
            end
          if (wire11[(1'h0):(1'h0)])
            begin
              reg29 <= $signed($unsigned(($signed((wire15 - wire13)) ?
                  $signed(reg25) : $signed((reg25 > wire12)))));
              reg30 <= reg28;
              reg31 <= (!{wire19[(1'h0):(1'h0)]});
              reg32 <= $unsigned(wire14);
            end
          else
            begin
              reg29 <= ({$signed(reg26), {{$signed(reg20)}, wire13}} ?
                  $signed(((((8'ha5) ? (8'ha1) : wire14) ? (8'ha6) : {wire13}) ?
                      {$unsigned(reg24),
                          (|reg27)} : $unsigned($signed(reg28)))) : ($unsigned(($unsigned(reg31) >= (|reg30))) ?
                      {(|(reg31 ? wire18 : wire12)),
                          $signed($signed(reg27))} : ($signed(((8'ha3) | reg31)) ^~ $unsigned({reg22,
                          (8'hb3)}))));
              reg30 <= $signed($unsigned(({wire12, $signed(reg26)} ?
                  reg29 : {$unsigned(reg32), (~reg31)})));
              reg31 <= {wire15,
                  $unsigned($unsigned(((~|wire15) ?
                      ((7'h44) > reg21) : ((8'hb6) ^ wire17))))};
              reg32 <= reg32[(1'h0):(1'h0)];
              reg33 <= (((($signed(reg23) ? $signed(wire14) : reg21) ?
                  $signed((reg26 ?
                      reg30 : wire16)) : $signed($unsigned(wire12))) != wire19) & reg28[(3'h4):(3'h4)]);
            end
        end
      else
        begin
          reg20 <= wire11;
          reg21 <= $signed($signed(((~|(wire17 ?
              reg26 : reg26)) + $unsigned(wire12))));
          if (wire15)
            begin
              reg22 <= (reg29[(3'h4):(2'h3)] ?
                  wire15 : (reg25 ~^ $unsigned(((reg24 && wire16) >>> wire13[(3'h4):(3'h4)]))));
            end
          else
            begin
              reg22 <= (~^($signed((|(wire13 ?
                  reg29 : reg33))) * $signed(({wire14, reg21} ?
                  wire14[(3'h4):(3'h4)] : (-wire19)))));
              reg23 <= ({$signed(($unsigned(wire13) ?
                          $unsigned(reg27) : wire16[(3'h4):(2'h2)])),
                      reg25} ?
                  $signed((~$signed($unsigned(reg27)))) : $unsigned({((reg31 > reg32) >> reg33),
                      {$unsigned(wire12)}}));
              reg24 <= reg27;
              reg25 <= (-({((reg27 - reg20) ? reg31 : wire12), wire15} ?
                  (^(|$unsigned((8'hb2)))) : $signed((~|$signed((8'hbe))))));
              reg26 <= $unsigned(wire17);
            end
          reg27 <= ((wire15 == ((((8'h9d) ? reg27 : (8'ha4)) ?
                  $unsigned(reg21) : (reg27 != reg26)) ?
              $signed((8'ha7)) : reg21)) <<< {$unsigned((((7'h41) << wire11) ?
                  $unsigned(wire13) : $signed(wire19)))});
          reg28 <= {({$unsigned((reg33 ? reg22 : reg30))} ?
                  (-reg29) : $signed(reg32[(1'h1):(1'h1)]))};
        end
      reg34 <= $unsigned(wire15[(1'h0):(1'h0)]);
      reg35 <= (wire18 * (reg24[(3'h7):(3'h6)] < ($unsigned(reg20[(4'hf):(3'h4)]) ?
          ((reg25 ?
              wire13 : wire14) ~^ reg24[(1'h1):(1'h0)]) : (reg23[(1'h0):(1'h0)] ^ (~&reg21)))));
    end
  always
    @(posedge clk) begin
      if ((((^((wire19 ? reg23 : reg28) ?
          $unsigned(reg30) : ((8'ha4) ?
              wire11 : reg33))) >>> reg28[(3'h6):(1'h0)]) && $unsigned(reg32[(1'h1):(1'h0)])))
        begin
          reg36 <= wire14[(2'h2):(1'h1)];
          if ($unsigned({(reg20 ? reg31 : reg31[(2'h3):(1'h0)]),
              {((~^wire12) && $unsigned(reg26)), (~&$unsigned(reg25))}}))
            begin
              reg37 <= (reg23 <<< reg36[(3'h7):(2'h3)]);
              reg38 <= $signed((reg27[(3'h5):(3'h5)] ?
                  ({wire16,
                      reg24[(4'ha):(4'h8)]} * (~|wire18)) : {(reg28 == wire15)}));
            end
          else
            begin
              reg37 <= wire17;
              reg38 <= reg29[(3'h5):(2'h3)];
            end
        end
      else
        begin
          if (reg32)
            begin
              reg36 <= $unsigned({reg32[(2'h2):(2'h2)]});
              reg37 <= (reg35[(1'h0):(1'h0)] ?
                  ((reg33[(1'h0):(1'h0)] ?
                      $signed((+reg23)) : ({reg28, wire13} ?
                          $signed(reg29) : (reg36 && (8'had)))) || {(^(reg20 <<< wire19))}) : (($unsigned($signed(wire15)) ?
                      ((wire14 & reg37) ?
                          (reg26 ^ wire16) : (wire11 >>> (8'ha8))) : {(wire18 ?
                              (7'h40) : reg33),
                          $unsigned(reg22)}) * $unsigned((~(8'hab)))));
              reg38 <= (((((wire14 << reg25) ^ (wire14 | wire16)) & ($signed(reg35) || (~|reg34))) && {$signed(wire13[(2'h2):(1'h1)]),
                  ((wire16 ? reg28 : wire13) ?
                      (reg37 ?
                          wire19 : reg37) : reg21)}) ~^ ($signed(wire14) ~^ ($signed(reg34[(4'he):(4'hc)]) >= reg24[(4'hb):(1'h1)])));
              reg39 <= ((reg27 ?
                      ((reg37 ? (8'ha8) : (8'hac)) ?
                          ((reg25 | reg36) ?
                              wire11 : reg36[(3'h7):(1'h0)]) : ($signed((7'h43)) > $unsigned(wire13))) : ($signed(((7'h40) != wire11)) ?
                          {{(8'hb2), wire13},
                              ((8'hb3) * reg32)} : {$unsigned(reg20),
                              reg30[(4'h9):(4'h9)]})) ?
                  {$unsigned(({reg27} ?
                          reg34[(1'h1):(1'h1)] : reg27[(3'h4):(1'h0)]))} : wire14[(1'h1):(1'h0)]);
              reg40 <= $signed($signed(reg39[(3'h5):(1'h1)]));
            end
          else
            begin
              reg36 <= $unsigned($unsigned($unsigned($signed(reg40))));
              reg37 <= $signed(reg29);
              reg38 <= reg27;
              reg39 <= $unsigned((wire14[(2'h3):(1'h1)] ^~ $signed(wire17)));
              reg40 <= $signed({($unsigned($signed((7'h42))) - {reg37[(5'h10):(4'h8)],
                      wire11[(3'h4):(1'h0)]})});
            end
          reg41 <= $signed((reg21[(1'h0):(1'h0)] ?
              $signed({(reg30 ? reg21 : wire16)}) : (!reg24[(3'h4):(2'h3)])));
        end
      reg42 <= reg22;
    end
  module43 #() modinst68 (wire67, clk, wire12, reg27, wire14, reg31);
  assign wire69 = wire18[(3'h4):(1'h1)];
  assign wire70 = ($signed((+($unsigned(wire13) ?
                      reg34 : (wire18 < reg40)))) < (+$unsigned(($signed(reg42) & reg35))));
  always
    @(posedge clk) begin
      if ((|{$unsigned(wire11), $signed($unsigned($unsigned(reg42)))}))
        begin
          reg71 <= reg30[(3'h4):(2'h2)];
          reg72 <= reg29;
          reg73 <= $unsigned((~&$unsigned(reg40[(1'h0):(1'h0)])));
        end
      else
        begin
          reg71 <= reg71;
        end
      reg74 <= $unsigned((reg41 ?
          reg25 : (reg35[(3'h5):(1'h1)] ? wire67 : ((^~reg24) > reg24))));
      reg75 <= wire19[(4'h9):(3'h4)];
      reg76 <= $signed($unsigned({$unsigned((reg38 <<< (8'hb8))),
          $signed($signed(reg72))}));
      reg77 <= wire16[(4'h8):(3'h6)];
    end
  assign wire78 = $signed((reg21[(1'h0):(1'h0)] ?
                      (+reg27[(1'h1):(1'h1)]) : $signed($signed($unsigned(wire18)))));
  assign wire79 = $signed((^reg37[(4'hd):(4'hb)]));
  assign wire80 = wire79;
  assign wire81 = $signed(reg23[(1'h1):(1'h1)]);
  assign wire82 = wire11;
  assign wire83 = (8'ha7);
  assign wire84 = wire83;
  assign wire85 = ((($signed(wire16) ?
                              ((wire17 ? reg37 : wire70) ?
                                  (8'hb4) : ((8'haa) ?
                                      reg29 : reg36)) : reg75[(3'h5):(2'h3)]) ?
                          (((wire70 ? reg21 : reg74) != (-wire12)) ?
                              $unsigned(reg77) : $signed($unsigned(reg28))) : ((~|reg77[(1'h0):(1'h0)]) ?
                              (wire14[(2'h3):(1'h0)] > {reg41,
                                  (8'hb1)}) : reg31)) ?
                      (~wire80[(4'h8):(3'h4)]) : (~^($unsigned((8'h9d)) > ($unsigned(wire69) ?
                          $signed((8'hb6)) : $signed((8'hbb))))));
  module86 #() modinst136 (wire135, clk, reg39, reg71, reg34, reg29);
  always
    @(posedge clk) begin
      reg137 <= reg24[(4'hb):(3'h7)];
    end
  assign wire138 = reg29;
  assign wire139 = (8'hb5);
endmodule

module module86
#(parameter param133 = (!((((-(8'hb5)) > ((8'h9e) ? (8'haa) : (8'ha5))) ^ (((8'ha6) ? (8'hba) : (8'hb5)) || ((8'ha8) != (8'ha2)))) <= (8'hb3))), 
parameter param134 = ((|({(8'hb5), ((8'haf) ? param133 : param133)} ? ((~^param133) << (~|param133)) : ((!param133) ? (param133 ? param133 : param133) : (^~param133)))) && ((({param133, param133} || param133) ? ((^param133) ? (~|param133) : {param133}) : param133) ? param133 : param133)))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire90;
  input wire signed [(4'hd):(1'h0)] wire89;
  input wire signed [(2'h3):(1'h0)] wire88;
  input wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire [(4'h8):(1'h0)] wire112;
  wire signed [(4'hb):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire116,
                 wire115,
                 wire112,
                 wire111,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire93,
                 wire92,
                 wire91,
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
                 reg114,
                 reg113,
                 reg110,
                 reg109,
                 reg108,
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
                 (1'h0)};
  assign wire91 = wire90[(2'h2):(1'h1)];
  assign wire92 = (~&$unsigned((8'hac)));
  assign wire93 = (~$unsigned(wire90));
  always
    @(posedge clk) begin
      reg94 <= wire93[(1'h1):(1'h0)];
      reg95 <= ((8'hbd) < wire93);
      if ((~|($signed($signed({reg94,
          (8'ha3)})) && $signed($unsigned($signed(wire91))))))
        begin
          reg96 <= wire92;
        end
      else
        begin
          reg96 <= ($unsigned((8'ha6)) >= $signed((~&($unsigned(wire88) ?
              $signed(wire89) : (+(8'h9e))))));
          reg97 <= (((wire92 ?
                  (~&(^wire93)) : (!{wire89})) & $unsigned((^~{wire88}))) ?
              ((8'hae) ?
                  wire92[(3'h4):(2'h2)] : $signed($signed(wire89))) : ($unsigned(((-wire91) >>> $unsigned(wire88))) ?
                  {($unsigned(wire89) * (^~wire90))} : wire91[(1'h1):(1'h1)]));
          reg98 <= wire88[(2'h2):(1'h1)];
        end
      reg99 <= $signed({wire93[(2'h2):(1'h1)]});
    end
  always
    @(posedge clk) begin
      reg100 <= (~$signed(($signed($signed((8'had))) ?
          ($unsigned(wire91) + {wire89, reg99}) : reg94[(1'h1):(1'h0)])));
      reg101 <= (&($unsigned({((8'haf) ^ reg99), (&wire90)}) ?
          (8'hae) : (~^{$signed(wire90), reg97[(5'h12):(4'hc)]})));
      reg102 <= (&$unsigned(($signed(wire93[(2'h2):(2'h2)]) ~^ $unsigned((!reg97)))));
      reg103 <= (((($signed(wire90) - $signed(wire89)) ?
                  $unsigned((reg102 ? reg97 : wire89)) : ((^~(8'haa)) ?
                      {reg98, reg102} : (reg100 ? reg101 : (8'ha1)))) ?
              (~$signed((8'ha0))) : ((8'hae) << wire87)) ?
          $unsigned((((reg101 * wire88) ?
              (wire91 ? (8'hbe) : wire92) : $signed(reg97)) < ((+wire92) ?
              (reg98 ?
                  reg99 : wire93) : wire88))) : ((reg100[(1'h0):(1'h0)] < $signed((reg96 ?
              wire93 : reg96))) >>> {$signed((~|wire87)),
              reg95[(3'h4):(2'h2)]}));
    end
  assign wire104 = reg96;
  assign wire105 = $signed($signed((+(~^$unsigned((8'ha7))))));
  assign wire106 = reg97[(5'h13):(4'ha)];
  assign wire107 = $unsigned(($signed($signed($signed((8'hb0)))) >>> (+((wire106 > wire106) * wire106))));
  always
    @(posedge clk) begin
      reg108 <= $signed(reg97[(4'ha):(2'h3)]);
      reg109 <= (8'hb2);
      reg110 <= (!{{({reg97, wire90} ? (wire92 <<< wire87) : wire88)}});
    end
  assign wire111 = $unsigned($unsigned({wire105}));
  assign wire112 = $unsigned(reg109);
  always
    @(posedge clk) begin
      reg113 <= (~reg98[(1'h1):(1'h1)]);
      reg114 <= wire105;
    end
  assign wire115 = (|(wire105 ~^ $unsigned(wire89)));
  assign wire116 = ({reg96[(4'h8):(3'h6)]} >> $signed((reg98[(1'h0):(1'h0)] ?
                       ((&reg99) ~^ (wire90 ?
                           wire111 : (8'ha0))) : $unsigned({wire106}))));
  always
    @(posedge clk) begin
      reg117 <= $signed((wire87 || $unsigned((~&(+wire88)))));
      if (wire92)
        begin
          reg118 <= ($signed(($signed(reg117[(2'h2):(1'h0)]) ?
                  ($signed(reg100) && (8'haa)) : (wire104[(4'hf):(3'h4)] ?
                      {reg109} : {wire88, wire93}))) ?
              wire92 : $signed((~$signed(reg113))));
          reg119 <= wire93;
          reg120 <= (~&(($unsigned($signed(wire105)) ?
              reg114[(5'h10):(2'h2)] : (((8'had) < (8'ha0)) + (8'ha5))) == (~&(-(wire93 ?
              reg114 : reg108)))));
          reg121 <= ((wire115[(3'h7):(3'h7)] ?
                  (~&((reg94 ? wire105 : wire111) | (^wire106))) : (8'h9e)) ?
              (^$signed(wire89[(4'ha):(3'h4)])) : $signed(reg98));
        end
      else
        begin
          reg118 <= (($signed((~(wire112 ^ wire89))) ?
                  reg118[(1'h1):(1'h0)] : {(^~reg96), $unsigned({(7'h41)})}) ?
              reg99 : {(((^wire88) ? (~^wire87) : reg99) ?
                      $unsigned(((8'hba) ?
                          (8'ha2) : wire92)) : ((^reg117) << (~^reg110))),
                  $unsigned(({wire116, (8'hae)} ^~ (reg118 | (8'hae))))});
          if ((-$signed(({{reg103}, (~&wire87)} ?
              ($unsigned(reg99) ? reg108 : ((8'hb7) ^~ reg101)) : {((8'hbc) ?
                      (8'hae) : wire89),
                  $unsigned(reg96)}))))
            begin
              reg119 <= $signed(wire91);
              reg120 <= reg94;
              reg121 <= $unsigned((-(reg103[(3'h4):(3'h4)] ?
                  wire90[(4'hc):(4'hc)] : ((wire111 ? reg113 : (7'h40)) ?
                      wire93[(1'h0):(1'h0)] : ((8'hbd) ? reg100 : wire105)))));
            end
          else
            begin
              reg119 <= (reg119[(1'h0):(1'h0)] ?
                  ({$unsigned((reg110 ~^ reg97)),
                      (wire115 ?
                          reg114[(1'h0):(1'h0)] : ((8'ha5) ?
                              wire111 : reg101))} + (((wire111 - wire106) < (wire90 != reg102)) ?
                      wire87[(3'h5):(2'h2)] : $unsigned(reg99[(1'h1):(1'h1)]))) : ($unsigned($signed($unsigned((8'ha8)))) >> (reg108[(1'h1):(1'h1)] >> (reg94[(3'h4):(2'h2)] || reg120[(5'h12):(3'h6)]))));
              reg120 <= wire87[(2'h2):(1'h1)];
              reg121 <= (((wire88 ?
                  wire105 : {(wire116 >>> wire107)}) ^~ $unsigned(reg117[(2'h2):(1'h0)])) + (&$unsigned($unsigned($unsigned(reg94)))));
              reg122 <= {reg109[(4'h8):(3'h6)],
                  ((($unsigned(reg120) ?
                      reg99[(4'hd):(4'h9)] : (~^reg109)) != $signed((wire105 ?
                      reg100 : reg114))) * wire93[(1'h0):(1'h0)])};
            end
        end
      if ((!wire88[(2'h3):(1'h0)]))
        begin
          reg123 <= (-((|$signed($unsigned(reg117))) ? reg100 : reg97));
        end
      else
        begin
          if ((^$signed($signed(wire116))))
            begin
              reg123 <= ((($unsigned((~|reg113)) ?
                  (&(8'ha6)) : ($unsigned((8'hba)) == (reg118 || reg120))) && $signed(((wire115 ?
                      reg117 : reg100) ?
                  reg109[(1'h0):(1'h0)] : (~reg102)))) ~^ ((+($signed((7'h43)) - (~wire105))) && (|reg95[(4'h8):(3'h5)])));
              reg124 <= reg114[(4'hd):(1'h1)];
              reg125 <= ((&(8'h9f)) ?
                  $unsigned((^~$unsigned(reg110[(1'h1):(1'h0)]))) : ($signed(((+reg124) ?
                          reg118 : reg113[(3'h4):(2'h3)])) ?
                      reg120[(3'h7):(3'h4)] : wire106[(3'h7):(3'h7)]));
            end
          else
            begin
              reg123 <= {($unsigned((^reg103)) ?
                      ((~reg101) ?
                          {(reg97 >= reg102),
                              $unsigned(wire107)} : $unsigned((reg101 >> reg110))) : (~&(((8'hbe) ^~ reg124) ?
                          wire87[(3'h6):(1'h1)] : (-wire89)))),
                  reg119[(4'h8):(3'h7)]};
            end
          if (reg125)
            begin
              reg126 <= (8'hbf);
              reg127 <= {{(-reg110)}, reg113[(1'h1):(1'h0)]};
              reg128 <= $unsigned(((~&({reg114} + (^(8'ha0)))) ?
                  wire91 : {(^$unsigned(wire88))}));
            end
          else
            begin
              reg126 <= $unsigned((reg95[(3'h5):(2'h3)] <= (-(8'h9c))));
              reg127 <= (~&$unsigned((7'h42)));
              reg128 <= reg95[(3'h4):(2'h2)];
            end
          reg129 <= {$signed(((!(^reg97)) ?
                  $unsigned($signed(reg102)) : $unsigned(reg119))),
              (reg125[(3'h4):(3'h4)] ?
                  (reg98[(2'h2):(1'h0)] ?
                      reg108[(2'h2):(2'h2)] : $signed(wire92[(2'h3):(1'h0)])) : ($signed((wire115 ^ wire107)) && wire116))};
        end
    end
  assign wire130 = $signed($unsigned(reg117));
  assign wire131 = reg128;
  assign wire132 = {($signed($signed((~|reg113))) ?
                           (({reg109} >>> wire116) ^~ {reg121,
                               $signed(wire107)}) : wire93[(1'h0):(1'h0)])};
endmodule

module module43
#(parameter param66 = ((+(8'hbd)) <= ((({(8'hab)} ? (-(8'hae)) : {(7'h44)}) && (((8'hb9) >> (8'ha5)) ? ((7'h40) << (8'h9e)) : {(8'ha2), (7'h42)})) ? (^~((~^(8'hbe)) ? {(8'hbb), (7'h41)} : ((8'hac) > (8'hb4)))) : ({(8'hb6), (+(8'h9f))} >> (((8'hb9) ? (8'had) : (7'h41)) << ((8'ha9) ? (8'hac) : (8'ha5)))))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(3'h4):(1'h0)] wire46;
  input wire [(3'h6):(1'h0)] wire45;
  input wire [(5'h13):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire48 = $signed(wire46);
  assign wire49 = $signed({((+((8'hb6) ? wire45 : wire44)) + wire45),
                      {($unsigned(wire46) <= (~&wire48)),
                          wire47[(1'h1):(1'h1)]}});
  assign wire50 = (wire46[(3'h4):(2'h2)] * $unsigned((wire45[(2'h2):(1'h0)] ?
                      (|(!wire48)) : $signed((wire46 ? wire45 : wire46)))));
  assign wire51 = $signed($signed((8'ha9)));
  assign wire52 = ($signed($signed((&(wire51 ? wire46 : wire47)))) ?
                      wire45[(3'h6):(3'h4)] : (8'ha1));
  assign wire53 = $unsigned({($signed($signed(wire49)) + ($unsigned(wire45) | (wire49 ^ wire48)))});
  always
    @(posedge clk) begin
      reg54 <= $unsigned(((wire52[(2'h3):(2'h2)] ^ wire51[(2'h3):(2'h3)]) > wire53[(2'h3):(2'h2)]));
      if ((wire48[(4'hd):(4'ha)] <<< wire47[(5'h12):(4'hf)]))
        begin
          reg55 <= $signed($signed((8'hb2)));
        end
      else
        begin
          reg55 <= wire47[(3'h6):(3'h6)];
          if ($signed(($unsigned({$signed(reg54),
              ((8'ha4) ? wire50 : reg54)}) ^ $signed(wire50[(4'hb):(4'ha)]))))
            begin
              reg56 <= ($signed((wire47 ~^ wire48)) - $unsigned($unsigned(((~|wire48) <<< wire47[(5'h11):(1'h0)]))));
              reg57 <= $signed((wire52[(1'h1):(1'h0)] > wire52[(2'h3):(1'h0)]));
              reg58 <= ($signed($signed(reg57[(3'h6):(3'h6)])) >= ((8'h9e) == ((-{wire44,
                  wire47}) ~^ $unsigned(wire48[(4'ha):(4'ha)]))));
            end
          else
            begin
              reg56 <= ($unsigned($unsigned(((~wire44) ?
                      wire46[(3'h4):(2'h3)] : (wire44 != wire52)))) ?
                  {reg54} : $unsigned((wire48[(3'h4):(2'h3)] < ((wire48 && wire48) == wire51))));
              reg57 <= ($signed(wire48[(3'h6):(3'h6)]) ?
                  $unsigned(reg55) : ($unsigned((&(wire47 ? wire44 : wire44))) ?
                      $unsigned((wire46 ?
                          $unsigned(reg54) : $unsigned(wire51))) : $signed({$signed(reg54),
                          $signed(wire44)})));
              reg58 <= wire45;
              reg59 <= ($signed((~^((reg54 ? reg56 : wire50) ?
                      $signed(wire50) : wire47[(4'hd):(3'h5)]))) ?
                  (~^{wire50[(4'hb):(1'h0)]}) : $unsigned($unsigned(wire51[(1'h0):(1'h0)])));
            end
          reg60 <= ((|reg56[(2'h3):(2'h2)]) ?
              $unsigned({{wire46, ((8'hb9) ? wire49 : reg59)},
                  ({wire47,
                      wire44} != $signed(reg57))}) : ((wire48[(3'h6):(3'h5)] ?
                  (~^reg55[(1'h1):(1'h0)]) : wire47[(4'hf):(2'h2)]) == $unsigned({$signed(reg58),
                  {wire53}})));
          reg61 <= (8'hbd);
        end
      reg62 <= $signed(((wire51 < reg61[(3'h6):(1'h1)]) ?
          $signed({wire53}) : ($signed($signed(wire52)) <= reg59[(4'h9):(1'h0)])));
    end
  assign wire63 = reg58;
  assign wire64 = $signed($signed($signed(((reg60 ? reg56 : wire48) ?
                      (reg56 ? reg62 : reg57) : $signed((8'hb9))))));
  assign wire65 = (~$signed((($signed(reg54) ?
                      $signed((7'h44)) : $unsigned(reg59)) >= ((~^wire53) ?
                      (wire63 ? wire44 : wire48) : {wire49, wire63}))));
endmodule
