module top
#(parameter param127 = (~&((~|{(^~(8'h9e))}) > ({((8'hb6) < (8'hb7)), ((8'haa) ? (8'hba) : (8'hac))} & (((7'h43) < (8'hb5)) + ((7'h43) ? (8'h9e) : (8'hbf)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire126,
                 wire113,
                 wire112,
                 wire110,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire4,
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
                 reg14,
                 reg13,
                 reg12,
                 reg5,
                 (1'h0)};
  assign wire4 = wire1;
  always
    @(posedge clk) begin
      reg5 <= (($unsigned((8'hb2)) ?
              ($signed(wire3) ?
                  wire2[(4'h9):(4'h8)] : ($unsigned(wire2) ?
                      (+wire4) : $signed(wire3))) : $unsigned($signed((~&wire0)))) ?
          $unsigned(wire0) : $signed({wire0}));
    end
  assign wire6 = ((8'hba) >= (reg5 ^ (~$unsigned(((8'hb6) ?
                     wire2 : (8'hb6))))));
  assign wire7 = (wire4[(1'h1):(1'h0)] ?
                     (^~(^$signed(wire4[(1'h0):(1'h0)]))) : wire6);
  assign wire8 = $unsigned(wire1);
  assign wire9 = $signed(wire0[(1'h1):(1'h0)]);
  assign wire10 = {wire7, $signed(wire6)};
  assign wire11 = (8'hbd);
  always
    @(posedge clk) begin
      reg12 <= wire7[(1'h0):(1'h0)];
      reg13 <= (($signed({(8'hb0), (+wire10)}) ^~ (((!wire9) || (reg12 ?
                  wire11 : (8'hb2))) ?
              $signed(wire8) : wire3)) ?
          wire11[(1'h1):(1'h0)] : (+(^~wire8)));
      reg14 <= (((((wire8 >= wire9) ? $signed(wire10) : wire0[(3'h5):(2'h2)]) ?
                  (-{wire6, wire0}) : $unsigned($signed(wire8))) ?
              ((reg5 ? (wire1 ? reg13 : reg13) : (wire2 + wire3)) ?
                  $unsigned(reg5[(1'h0):(1'h0)]) : ($signed(reg12) + reg13)) : (wire10 - ($unsigned((8'hb0)) ?
                  $signed(wire9) : (&(7'h40))))) ?
          wire6 : wire1[(1'h1):(1'h0)]);
    end
  module15 #() modinst111 (.wire17(wire0), .wire18(wire3), .y(wire110), .clk(clk), .wire19(wire6), .wire16(wire4));
  assign wire112 = (reg14[(1'h1):(1'h0)] > $signed(reg14));
  assign wire113 = ($unsigned((&$unsigned(wire7))) ? wire2 : wire6);
  always
    @(posedge clk) begin
      reg114 <= wire0[(4'h8):(3'h5)];
      if (reg114[(2'h2):(2'h2)])
        begin
          reg115 <= (wire8[(1'h0):(1'h0)] ~^ (-$unsigned(($unsigned(wire4) ?
              (reg5 ? (8'hac) : wire113) : {(8'hb5), wire7}))));
          reg116 <= $signed({((((7'h43) ? wire6 : wire112) ?
                      {wire11, wire11} : (^wire11)) ?
                  reg114[(1'h0):(1'h0)] : ($unsigned(wire2) ?
                      wire8[(1'h0):(1'h0)] : (8'hae)))});
          reg117 <= wire0[(2'h2):(1'h0)];
          if ($signed(wire9))
            begin
              reg118 <= (reg116[(3'h6):(2'h3)] ^ $unsigned({$signed(wire9)}));
              reg119 <= $signed(($unsigned(wire0[(4'h9):(3'h6)]) ?
                  ($signed((!wire0)) - reg5) : $unsigned(wire7)));
              reg120 <= (&((wire11 | $unsigned($signed(wire1))) == (^(~^{reg5,
                  wire113}))));
              reg121 <= $unsigned((~reg119));
              reg122 <= (wire7 ^~ reg12);
            end
          else
            begin
              reg118 <= $signed({reg117,
                  $signed(({wire4, wire11} ^ wire110[(4'hf):(4'hf)]))});
              reg119 <= $signed((($signed((reg13 ?
                  wire9 : reg122)) && (wire112[(5'h10):(1'h0)] ?
                  (^~reg5) : $unsigned(reg12))) != (^wire7[(4'h8):(3'h7)])));
            end
          reg123 <= reg119;
        end
      else
        begin
          reg115 <= wire3[(5'h10):(4'hf)];
          if (($signed(({$signed(reg12)} >>> ((reg115 ?
              (8'hbd) : reg116) == reg122[(4'he):(3'h4)]))) != $signed($signed(reg114))))
            begin
              reg116 <= $signed((7'h42));
              reg117 <= (wire9 >= wire110[(4'hb):(4'h8)]);
              reg118 <= (8'haa);
              reg119 <= $unsigned(wire8);
              reg120 <= $unsigned({({{reg117}} > {(reg123 + reg115),
                      reg117[(3'h7):(3'h5)]}),
                  (!($unsigned(wire8) ~^ {wire110, wire11}))});
            end
          else
            begin
              reg116 <= (reg123 ?
                  $signed(reg13) : ({{(8'hb7)},
                      $signed(wire110)} >>> $unsigned(($unsigned(wire1) ?
                      (reg120 < reg117) : (wire10 ? (7'h44) : reg118)))));
              reg117 <= reg118[(2'h3):(1'h0)];
              reg118 <= $unsigned($unsigned(($signed(wire8[(1'h0):(1'h0)]) ?
                  wire112 : ((wire110 ^ wire11) ^~ (~|wire113)))));
              reg119 <= $signed((((reg116 ? reg12 : wire113[(4'ha):(2'h3)]) ?
                      ($signed((8'ha5)) > {(7'h42)}) : reg117) ?
                  ($unsigned($signed((8'hab))) + $signed($unsigned(wire110))) : (~&wire110)));
            end
        end
      reg124 <= ($unsigned($unsigned(({reg118} < (reg118 & (8'hbb))))) ?
          reg122[(1'h0):(1'h0)] : $unsigned($unsigned((~^{reg12, reg5}))));
      reg125 <= wire0[(1'h0):(1'h0)];
    end
  assign wire126 = reg5[(1'h1):(1'h0)];
endmodule

module module15
#(parameter param108 = (((+{((8'hb2) | (8'hbc))}) ? {(((8'hba) ? (8'ha1) : (8'hba)) ~^ ((8'hb0) ? (8'h9d) : (8'ha5)))} : ((^~((8'ha6) ? (8'hae) : (8'hb0))) < ({(8'hab), (8'hbf)} & {(8'hb7)}))) ? ((((|(8'hb2)) ? (+(8'hb2)) : ((7'h42) + (8'ha6))) != ((~&(8'h9f)) <<< ((8'h9d) ? (7'h41) : (8'haf)))) ^~ (|(((8'ha8) >> (8'hb5)) ? (~&(8'ha2)) : (!(8'ha1))))) : (((&((8'h9f) ? (8'hb9) : (8'hb2))) ? (~^((8'ha8) >>> (8'ha9))) : (^~((8'h9c) ? (8'hbc) : (8'hb4)))) - ((+((8'ha7) < (8'hab))) ? {((8'hb7) ? (8'hb7) : (8'ha2)), (8'haf)} : (((8'ha8) << (8'hb4)) ? {(8'hb3), (8'hb8)} : ((8'hae) ? (8'ha3) : (8'hab)))))), 
parameter param109 = (~((8'h9e) ^~ ((param108 ? (^~param108) : (~^param108)) ? (~|param108) : param108))))
(y, clk, wire16, wire17, wire18, wire19);
  output wire [(32'h245):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire16;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire91;
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire93,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire91,
                 reg105,
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
                 (1'h0)};
  assign wire20 = wire18[(5'h10):(2'h3)];
  assign wire21 = $unsigned(wire17);
  assign wire22 = $unsigned({(wire17[(2'h2):(1'h1)] ?
                          wire19[(4'h8):(1'h0)] : $signed($unsigned(wire19)))});
  assign wire23 = (~&($signed((wire19[(3'h6):(2'h3)] ?
                      (wire22 >> wire22) : wire22)) * $signed($signed($unsigned(wire22)))));
  always
    @(posedge clk) begin
      if ($unsigned({$signed((^(|wire23))), (-(|(wire16 & wire17)))}))
        begin
          reg24 <= ($signed(wire22[(5'h10):(3'h4)]) == wire18);
          if ($unsigned(wire21))
            begin
              reg25 <= ($signed((^~$signed((8'ha3)))) * (|((&$signed(wire19)) ~^ $signed(wire21[(4'h8):(1'h0)]))));
              reg26 <= $unsigned((reg25 >> $signed((~^{wire18, reg25}))));
              reg27 <= (($unsigned(reg25) ?
                  {(^~$unsigned(reg25))} : ($signed((wire19 ?
                      wire22 : wire18)) | $unsigned(wire18[(5'h10):(4'hf)]))) | reg26[(3'h7):(1'h1)]);
              reg28 <= $signed(((reg24[(3'h6):(3'h4)] ?
                  wire22[(4'hc):(4'hc)] : (reg24 ?
                      $unsigned((8'hbf)) : wire22)) < $unsigned(($signed(wire21) - $signed(wire18)))));
            end
          else
            begin
              reg25 <= (~$signed($signed({{reg28, wire22}, {wire20}})));
              reg26 <= wire17;
              reg27 <= ({(8'hb3),
                      $unsigned(((reg27 >> wire19) >>> {(8'ha1)}))} ?
                  reg25[(2'h3):(1'h0)] : $unsigned(wire19));
              reg28 <= $unsigned(({wire18[(4'ha):(4'ha)]} <<< (~|reg27)));
            end
        end
      else
        begin
          reg24 <= {wire19[(3'h7):(1'h1)]};
          if ($unsigned((^~(~&$unsigned($unsigned(wire23))))))
            begin
              reg25 <= $unsigned($signed($signed((~wire16))));
            end
          else
            begin
              reg25 <= wire23[(3'h7):(2'h2)];
              reg26 <= ($unsigned(reg26) <<< ((-reg25) & wire16));
              reg27 <= (+reg27);
            end
        end
      reg29 <= $unsigned((^((reg25 ?
          $unsigned(wire22) : (reg28 ?
              wire20 : (8'haf))) >= (~$unsigned((8'hb8))))));
      if (($signed((wire21[(4'hf):(4'ha)] > wire19)) ?
          $unsigned(reg26) : (^~$signed(($unsigned(wire20) ?
              (wire20 ? wire21 : reg26) : wire20[(2'h2):(1'h0)])))))
        begin
          if ((reg25[(3'h4):(2'h2)] ~^ ((+reg29) ?
              {reg24[(1'h1):(1'h0)],
                  (^(wire17 < reg27))} : (wire21[(2'h2):(1'h0)] > reg25[(1'h0):(1'h0)]))))
            begin
              reg30 <= ($signed($signed(reg24[(1'h0):(1'h0)])) ?
                  $signed(($unsigned(wire21) ?
                      (wire22[(1'h1):(1'h1)] ?
                          (!wire20) : (!reg25)) : (~|(~|wire16)))) : (wire23[(3'h6):(3'h4)] ?
                      (-(8'ha8)) : wire17[(1'h0):(1'h0)]));
              reg31 <= $unsigned(({$unsigned((~&reg30))} >= {(~$unsigned(wire21))}));
            end
          else
            begin
              reg30 <= (~wire19[(3'h5):(2'h2)]);
              reg31 <= (-reg25[(2'h2):(1'h1)]);
              reg32 <= $unsigned(reg31[(4'he):(4'h8)]);
            end
          reg33 <= (wire16[(2'h2):(2'h2)] ?
              $signed($signed((-((7'h42) || wire23)))) : ($signed({$signed(wire21),
                      (wire17 ~^ wire21)}) ?
                  ($unsigned(reg31[(4'ha):(4'ha)]) >>> ((~&wire17) ~^ (wire18 == wire18))) : (-{wire16})));
          if ({(!(~(reg28 ? reg25[(1'h0):(1'h0)] : {reg31, wire16})))})
            begin
              reg34 <= {({(reg32 ?
                          (reg24 && wire16) : (wire18 ? reg24 : reg30)),
                      $unsigned((reg32 ? wire18 : reg28))} || reg28)};
              reg35 <= reg26;
              reg36 <= (wire20[(3'h4):(1'h1)] ?
                  ((~reg35[(4'ha):(2'h2)]) ?
                      {wire22[(4'hb):(2'h2)],
                          reg29} : ($unsigned($unsigned(wire21)) | $unsigned($unsigned(reg26)))) : (reg27 ^ $unsigned(({(8'hb2)} ~^ (reg30 ?
                      (8'hbc) : wire23)))));
              reg37 <= ((|$unsigned({$signed(wire23)})) >> (({((8'hb6) ^~ reg32),
                      $unsigned(wire18)} <= ((reg27 | wire20) >= $signed(reg24))) ?
                  (~|$unsigned(reg34[(3'h7):(3'h7)])) : $signed(wire21)));
              reg38 <= ((((!$unsigned(reg34)) ?
                  $unsigned({(8'hb0),
                      reg28}) : reg28) >= (|wire18)) ~^ (|$unsigned($unsigned((+(8'ha0))))));
            end
          else
            begin
              reg34 <= reg30[(3'h4):(2'h3)];
              reg35 <= $signed((-(reg31 || $unsigned((reg27 ?
                  reg38 : (7'h41))))));
              reg36 <= reg24;
              reg37 <= wire19[(4'ha):(3'h4)];
            end
        end
      else
        begin
          reg30 <= wire22[(3'h5):(1'h1)];
        end
      if ($signed(wire21[(4'ha):(1'h0)]))
        begin
          reg39 <= (reg25[(3'h5):(2'h2)] && {wire19[(3'h5):(3'h4)],
              $unsigned((reg30[(3'h5):(1'h1)] ?
                  $unsigned(wire23) : reg33[(2'h2):(1'h0)]))});
          reg40 <= reg33[(3'h5):(3'h4)];
          reg41 <= $signed((^(8'ha7)));
          reg42 <= wire23[(3'h4):(1'h1)];
          if ($unsigned($signed($signed({reg42, (reg33 ? reg24 : reg35)}))))
            begin
              reg43 <= $signed((((8'ha9) >>> ({(8'ha2),
                  reg24} ^~ $signed((8'hb1)))) == (((reg27 & wire20) ?
                  (reg28 && reg30) : (reg29 || reg27)) * {(reg41 ^~ reg26),
                  (wire18 ? reg40 : reg42)})));
            end
          else
            begin
              reg43 <= ($unsigned((|$unsigned(reg27))) - $unsigned((+((wire18 & reg38) * {reg24}))));
              reg44 <= ((&wire16) ?
                  $signed((reg43 >= reg34)) : $signed((reg25[(4'h8):(3'h6)] ^~ (reg41[(1'h1):(1'h1)] ?
                      ((8'hb4) >>> reg42) : (8'ha5)))));
            end
        end
      else
        begin
          if ({$unsigned(reg42[(2'h2):(2'h2)]),
              {$signed({((8'hb2) ? reg30 : (8'hae)), (reg29 << wire16)}),
                  ((reg36[(3'h4):(3'h4)] ? reg41[(3'h5):(2'h3)] : (~^(7'h44))) ?
                      (((8'hb0) ? wire23 : wire17) ?
                          ((8'hab) ?
                              wire19 : (8'hbe)) : (wire16 ^ wire20)) : reg39[(3'h6):(3'h5)])}})
            begin
              reg39 <= {$unsigned((+(!(reg35 >>> reg44))))};
              reg40 <= (((|(~|(reg25 == wire22))) + wire19[(3'h6):(2'h2)]) | (!reg30[(4'hb):(1'h1)]));
              reg41 <= (!(~reg39));
            end
          else
            begin
              reg39 <= reg27;
            end
          reg42 <= ({(~^$unsigned($unsigned(reg38))),
                  ($unsigned($unsigned(reg38)) <= wire17)} ?
              reg29 : reg42[(1'h1):(1'h1)]);
          if ({((^~reg37) + ({(wire16 ? reg42 : reg37), {reg36, reg28}} ?
                  (reg29[(3'h6):(1'h1)] ?
                      reg37 : (reg30 ?
                          (8'hb7) : reg35)) : $unsigned(reg43[(3'h7):(3'h7)])))})
            begin
              reg43 <= $signed(((|((^reg43) <<< (wire21 > reg37))) ?
                  (reg42[(2'h3):(2'h3)] ?
                      (~|{reg25,
                          reg34}) : {$unsigned((8'hbd))}) : ((-$unsigned(reg31)) ~^ reg33[(3'h5):(2'h3)])));
              reg44 <= reg29;
              reg45 <= wire18;
            end
          else
            begin
              reg43 <= $signed($unsigned(reg26[(1'h0):(1'h0)]));
              reg44 <= ($unsigned(wire19) >> wire20[(1'h0):(1'h0)]);
              reg45 <= reg31;
              reg46 <= {$signed((({reg33} != (reg35 > (7'h44))) ?
                      {reg25} : wire18[(5'h12):(5'h10)])),
                  (&(+(~|{wire16})))};
              reg47 <= (~&{(reg36[(2'h3):(1'h1)] <<< (|(7'h43)))});
            end
          if ($unsigned($unsigned(({$signed((8'ha5))} ?
              $unsigned((reg41 ^~ reg27)) : (reg37 ?
                  $unsigned(reg29) : $signed(wire17))))))
            begin
              reg48 <= ($unsigned(((8'hae) ~^ (^~reg26[(2'h3):(1'h0)]))) ?
                  reg31 : ($signed(reg29) + ((~|(|reg47)) ?
                      ((~^wire16) ?
                          $unsigned(reg27) : (|reg27)) : ($unsigned((8'hb6)) ?
                          reg47 : $signed((8'hb0))))));
              reg49 <= $signed(reg44);
            end
          else
            begin
              reg48 <= wire23;
              reg49 <= ($unsigned(reg27) >> (reg40 - wire22));
            end
          reg50 <= {($unsigned(reg31) | $signed((^~(reg36 ? reg36 : reg45))))};
        end
      reg51 <= ((^(($signed(reg31) ? (!reg48) : (&reg34)) >= reg30)) ?
          reg33 : ((~|$signed((wire18 ? (8'h9d) : wire20))) == wire21));
    end
  assign wire52 = reg31;
  assign wire53 = wire22;
  assign wire54 = ($signed((!reg24)) || ($signed({(reg30 - wire16)}) ?
                      $signed(reg32[(3'h5):(2'h3)]) : (reg25 ?
                          {$unsigned(wire16)} : $unsigned(reg36[(2'h3):(1'h0)]))));
  assign wire55 = ($signed(reg30) ? reg40 : $signed(reg47[(1'h0):(1'h0)]));
  module56 #() modinst92 (wire91, clk, wire23, reg24, wire17, wire21);
  assign wire93 = ($unsigned($signed($unsigned($unsigned(reg44)))) - (8'had));
  always
    @(posedge clk) begin
      reg94 <= ((~^(reg24 < {(reg24 ?
              reg37 : (8'hb3))})) != reg39[(1'h1):(1'h1)]);
      if ((wire53[(4'hc):(4'hc)] & reg29[(4'hb):(1'h0)]))
        begin
          reg95 <= (^~$signed(($unsigned({reg43}) ?
              $signed((reg35 << wire91)) : (wire53 ?
                  $signed(reg40) : {reg37}))));
          if (((($signed({reg45}) & $signed(wire16[(3'h4):(3'h4)])) ?
              reg25[(3'h4):(2'h2)] : reg42) == {$signed((8'ha6))}))
            begin
              reg96 <= $signed(((8'haa) * {$unsigned((~^(8'hb5)))}));
              reg97 <= (($unsigned(($signed(reg94) ?
                          wire18[(5'h14):(4'he)] : $signed(wire18))) ?
                      wire16 : (($signed(wire16) >= $signed(wire21)) ?
                          ($unsigned((8'hb7)) ?
                              reg96 : (^reg95)) : reg49[(1'h1):(1'h1)])) ?
                  {(~reg47[(1'h0):(1'h0)]),
                      wire54} : $signed((^~{(reg48 != reg38)})));
            end
          else
            begin
              reg96 <= (~|(-reg94[(3'h6):(3'h5)]));
            end
        end
      else
        begin
          reg95 <= $unsigned(($unsigned(((-reg31) * reg46)) ? reg27 : reg34));
        end
      if (reg26)
        begin
          reg98 <= wire91;
        end
      else
        begin
          reg98 <= ($signed(reg94) ? (~|reg30) : (+reg42));
          reg99 <= reg35[(2'h2):(2'h2)];
          reg100 <= $signed((reg37 | {$unsigned($unsigned(reg36)), reg99}));
          if ((wire16[(2'h2):(1'h0)] > {((+((8'hbc) ? reg41 : reg32)) ?
                  $unsigned((-wire52)) : (^~(reg44 - reg47))),
              wire18}))
            begin
              reg101 <= $signed(wire20);
              reg102 <= (^($signed($unsigned((~&reg45))) >= reg37));
            end
          else
            begin
              reg101 <= $unsigned(((((^reg43) | (8'hac)) ~^ wire21[(4'he):(4'hc)]) ?
                  (reg28 < (^~reg96[(3'h7):(3'h5)])) : (($signed(reg45) ?
                      {reg43,
                          reg38} : (reg30 ^ reg96)) ~^ $unsigned((~|reg97)))));
              reg102 <= {$signed(($signed($unsigned(reg46)) ?
                      ((wire93 <= reg50) >> reg46[(2'h2):(2'h2)]) : wire16[(3'h4):(1'h1)])),
                  $signed(wire19)};
              reg103 <= $unsigned($unsigned(reg28));
              reg104 <= reg31[(4'hb):(3'h4)];
            end
          reg105 <= ((+($signed({wire54}) >> reg47)) ?
              (&reg44[(4'h9):(3'h7)]) : (~^(((reg40 > reg33) ?
                  (wire16 ? reg97 : reg44) : reg25) > ((reg28 ? reg30 : reg49) ?
                  (wire22 <<< (8'ha6)) : (~&reg25)))));
        end
    end
  assign wire106 = $unsigned(reg51[(4'ha):(3'h7)]);
  assign wire107 = $unsigned(({reg39[(3'h4):(2'h3)], wire23} ?
                       (($unsigned(reg35) ?
                           ((8'hb4) ? wire19 : reg103) : (reg104 ?
                               wire16 : (8'hb1))) <<< ($unsigned((8'haa)) * (reg97 * wire52))) : (^~$signed((reg102 & reg28)))));
endmodule

module module56
#(parameter param89 = {(-((((8'hb3) < (8'hbc)) ? (8'ha8) : (|(8'ha5))) & ({(8'ha8)} ^ (&(8'hba)))))}, 
parameter param90 = param89)
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire60;
  input wire [(3'h6):(1'h0)] wire59;
  input wire [(4'h9):(1'h0)] wire58;
  input wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire62,
                 wire61,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire61 = (^wire58[(3'h6):(2'h3)]);
  assign wire62 = $unsigned(($unsigned(wire57) ?
                      ($unsigned((wire60 >> (8'hae))) ?
                          wire59 : wire57[(4'hf):(2'h3)]) : (-wire58)));
  always
    @(posedge clk) begin
      reg63 <= $unsigned($unsigned(wire61[(4'hc):(1'h0)]));
      reg64 <= (-wire60);
      reg65 <= (wire57[(4'hc):(3'h5)] != ((($unsigned(wire62) ?
                  (wire62 ? wire57 : reg63) : reg63[(5'h11):(4'hc)]) ?
              (~^(!(8'hab))) : (reg64[(4'h9):(2'h3)] & $signed(wire59))) ?
          (8'haf) : $unsigned($unsigned({wire60, wire57}))));
      reg66 <= $signed(($unsigned(wire61[(3'h6):(3'h5)]) ?
          $unsigned($unsigned((wire57 ?
              wire62 : reg65))) : ((reg63[(3'h7):(3'h4)] ~^ $unsigned(wire57)) ?
              wire59[(1'h0):(1'h0)] : (reg63 ? (wire61 << wire61) : {reg64}))));
    end
  assign wire67 = {wire58[(4'h9):(4'h8)], wire60[(5'h14):(4'hd)]};
  assign wire68 = ({$unsigned($signed(wire62))} * (!wire60[(4'ha):(1'h1)]));
  assign wire69 = wire62[(2'h2):(2'h2)];
  assign wire70 = (wire68[(4'h8):(4'h8)] ?
                      (reg63[(1'h1):(1'h1)] >>> {((^~wire62) ?
                              $signed(wire62) : $unsigned(wire61))}) : $unsigned(($signed($unsigned(wire57)) & (8'hb4))));
  assign wire71 = ((((8'ha1) << (~&$signed(reg66))) ?
                      (8'h9c) : ($signed($signed(wire69)) ^ (wire60[(3'h7):(3'h6)] ?
                          $signed(wire57) : (wire57 ?
                              wire67 : wire59)))) >= {{{{reg65, reg63}}}});
  assign wire72 = $signed((($unsigned(wire59[(1'h1):(1'h1)]) >> {$signed(wire59)}) ?
                      $signed(wire59[(3'h4):(2'h3)]) : $unsigned($signed($signed((8'hbf))))));
  assign wire73 = {(^~wire67[(1'h0):(1'h0)])};
  assign wire74 = $unsigned($unsigned({$unsigned((~reg64))}));
  always
    @(posedge clk) begin
      reg75 <= wire59;
      if ((~(wire67[(1'h0):(1'h0)] ?
          (reg65 ^~ wire68[(3'h5):(2'h2)]) : {$unsigned((wire67 ^~ (8'ha1))),
              {$unsigned(reg65)}})))
        begin
          if ((!((reg66 ? (!(^wire73)) : (+$unsigned((8'had)))) ?
              reg66[(3'h5):(1'h0)] : (({reg64, wire67} ?
                  $unsigned(wire67) : $unsigned((7'h44))) != $signed(reg75[(2'h3):(2'h2)])))))
            begin
              reg76 <= (-$signed($signed((&(wire71 >>> wire73)))));
              reg77 <= ((wire74[(1'h1):(1'h0)] < $unsigned((|$signed((8'hb8))))) ?
                  $unsigned({((reg64 ? wire60 : wire72) ?
                          ((8'hb6) ? wire67 : wire68) : (^wire59)),
                      reg64}) : (&$signed((8'hb0))));
            end
          else
            begin
              reg76 <= ((($signed(reg65[(3'h5):(1'h0)]) ?
                      (!$signed(reg77)) : $signed((reg77 | (8'hb4)))) || ((|reg75[(1'h0):(1'h0)]) ?
                      $signed((wire61 ? wire58 : wire74)) : {{wire67,
                              wire68}})) ?
                  wire67[(2'h2):(1'h0)] : (({$signed(wire73)} > ((reg76 <<< wire61) & wire71)) <<< (reg77 <<< ({wire70,
                          wire68} ?
                      wire70[(1'h1):(1'h1)] : $unsigned(wire57)))));
              reg77 <= wire72;
              reg78 <= (8'haf);
              reg79 <= wire71;
            end
          reg80 <= ($unsigned(wire70) != ({$signed(wire61)} ?
              $signed($unsigned((8'hb8))) : $unsigned($unsigned($unsigned(reg79)))));
          reg81 <= (((^wire74[(2'h3):(2'h3)]) != ($unsigned((wire59 * (8'ha9))) ?
                  ($signed(wire67) ?
                      (8'hab) : wire57) : ($signed(reg79) <<< reg78[(4'ha):(4'h9)]))) ?
              wire73 : (&reg64));
        end
      else
        begin
          reg76 <= ($signed($signed((~(wire68 ? wire62 : wire57)))) ?
              wire58[(4'h8):(3'h4)] : $signed(reg78[(4'ha):(3'h5)]));
          reg77 <= wire61[(1'h1):(1'h1)];
          reg78 <= reg79[(5'h10):(4'hc)];
          reg79 <= {$unsigned((^~$unsigned($signed((7'h44))))), reg80};
        end
      reg82 <= (+(^~({reg76, (wire72 ? (8'haf) : reg77)} ?
          (~&reg81) : wire60)));
      reg83 <= $unsigned(wire68);
      reg84 <= (wire70 && reg64[(5'h10):(2'h3)]);
    end
  assign wire85 = (+reg80[(2'h2):(2'h2)]);
  assign wire86 = reg84;
  assign wire87 = wire69;
  assign wire88 = reg63[(4'hf):(3'h4)];
endmodule
