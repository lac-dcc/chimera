module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire109;
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  assign y = {wire63,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire76,
                 wire77,
                 wire83,
                 wire109,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire4 = $unsigned((!{wire1[(2'h2):(1'h0)], ((^wire0) <= wire1)}));
  assign wire5 = wire0[(4'ha):(3'h5)];
  assign wire6 = wire3;
  assign wire7 = wire4;
  module8 #() modinst64 (.wire12(wire5), .wire11(wire3), .wire13(wire0), .y(wire63), .wire10(wire7), .wire9(wire6), .clk(clk));
  always
    @(posedge clk) begin
      reg65 <= (wire2 <<< wire6);
      reg66 <= $signed($unsigned(($unsigned((&wire0)) ?
          {{(8'hb5)}} : (|{wire0}))));
      reg67 <= wire1[(3'h5):(2'h2)];
      if (({$signed((~|(&wire2)))} ? wire7 : wire1))
        begin
          reg68 <= reg67[(4'he):(4'ha)];
          reg69 <= reg66;
        end
      else
        begin
          reg68 <= $unsigned(reg66);
          reg69 <= wire3;
          reg70 <= wire0[(2'h2):(1'h1)];
          if ((reg65 ?
              (+$unsigned((|$signed(reg66)))) : ((($signed(wire7) ?
                      wire0[(4'hc):(3'h6)] : wire7[(4'hb):(2'h2)]) ?
                  wire0 : ((reg70 ?
                      reg65 : (8'haa)) != {wire4})) + (~(reg69[(2'h3):(1'h1)] >>> wire0[(4'hc):(2'h2)])))))
            begin
              reg71 <= (+$signed(wire7[(4'ha):(1'h1)]));
            end
          else
            begin
              reg71 <= ($unsigned({(~^wire1[(1'h1):(1'h0)])}) ?
                  ((+(&((8'ha4) ? wire6 : wire1))) ?
                      ({(reg69 <<< wire5), $unsigned(reg67)} ?
                          $signed((^~wire1)) : reg67[(3'h6):(3'h5)]) : $unsigned($signed(((8'hb5) >= reg65)))) : $signed(((7'h42) & $signed(wire5[(5'h13):(4'ha)]))));
              reg72 <= reg68[(1'h0):(1'h0)];
              reg73 <= reg70;
              reg74 <= $unsigned(wire6);
              reg75 <= (~|$unsigned((reg70[(4'h8):(1'h1)] ?
                  ((~&wire7) ? $unsigned(wire0) : {wire4, reg65}) : ((~^wire4) ?
                      $unsigned(wire1) : $unsigned(reg69)))));
            end
        end
    end
  assign wire76 = (~&(wire7 ?
                      wire3[(3'h5):(1'h0)] : ($signed($signed(wire4)) - (~|reg75[(2'h2):(1'h1)]))));
  assign wire77 = $signed((($signed($signed((7'h40))) <<< (reg67[(2'h2):(1'h1)] ?
                      wire63 : $unsigned(reg70))) | (7'h41)));
  always
    @(posedge clk) begin
      reg78 <= wire5;
      reg79 <= $unsigned($signed((^~((8'hbe) ?
          $unsigned((8'hbe)) : reg69[(1'h0):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg80 <= {((wire5[(4'h8):(4'h8)] ?
              wire0[(5'h11):(2'h3)] : (8'hab)) + ((!{reg65,
              reg79}) || (&$signed(reg73))))};
      reg81 <= (+(&(~$unsigned($unsigned(reg67)))));
      reg82 <= reg70[(5'h10):(4'h8)];
    end
  assign wire83 = ((reg71[(3'h5):(3'h4)] * (wire6 ?
                      ((reg74 ?
                          wire1 : wire3) ^~ (reg66 + reg72)) : reg78)) ^~ $unsigned({reg80,
                      {(^(8'hb8))}}));
  module84 #() modinst110 (wire109, clk, wire1, wire63, wire7, reg79, reg73);
endmodule

module module84  (y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire89;
  input wire signed [(5'h15):(1'h0)] wire88;
  input wire signed [(4'h8):(1'h0)] wire87;
  input wire [(4'h9):(1'h0)] wire86;
  input wire [(4'hd):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire101,
                 wire100,
                 wire91,
                 wire90,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire90 = $signed(((wire87 ? wire89 : wire85) | wire85));
  assign wire91 = $signed(((~$signed((wire89 ?
                      wire85 : (8'haf)))) * (wire88[(4'he):(3'h7)] ?
                      $unsigned((-wire90)) : $signed($signed(wire87)))));
  always
    @(posedge clk) begin
      reg92 <= {{$signed((((8'hb8) && wire91) < (wire87 & wire87)))}};
      if (wire87)
        begin
          reg93 <= (($unsigned((reg92 ? wire88 : reg92)) ?
                  {wire91, wire86[(4'h9):(1'h0)]} : (^~{$signed((8'hb6))})) ?
              ($unsigned($signed(wire86)) ?
                  (!$signed($signed(wire89))) : $signed($unsigned($signed(wire86)))) : (^~wire90));
          if ($signed($unsigned($signed(wire86[(4'h8):(3'h5)]))))
            begin
              reg94 <= wire87[(4'h8):(3'h5)];
              reg95 <= (~(~&$unsigned(((reg93 ?
                  wire91 : (8'ha7)) | $unsigned(wire91)))));
              reg96 <= (&$signed((8'hb7)));
              reg97 <= wire88;
              reg98 <= ((!$unsigned(($unsigned(wire87) | wire85[(3'h4):(3'h4)]))) ?
                  reg93 : (^~$unsigned(($signed(wire87) != {wire88, wire88}))));
            end
          else
            begin
              reg94 <= (((((-wire85) & reg97) ?
                          $unsigned($unsigned(wire91)) : reg92) ?
                      $unsigned(wire87) : reg95[(4'he):(2'h3)]) ?
                  {(^~$unsigned((reg96 ~^ (8'hb2)))), wire88} : reg94);
              reg95 <= $signed(((((reg98 ? wire88 : (8'h9c)) ?
                  $signed(wire90) : (reg93 ?
                      reg92 : (8'hba))) + (&wire85)) < (wire91 <= ((!(8'ha2)) ^~ reg98))));
            end
          if ((reg98 ?
              reg94[(4'h9):(3'h4)] : ((~($unsigned((8'hb6)) ?
                  (~&wire91) : wire87[(1'h1):(1'h1)])) ^ (reg98 == (((8'hbb) ~^ reg95) ?
                  (reg92 ? (8'h9d) : reg95) : wire88)))))
            begin
              reg99 <= $signed((($signed((~wire85)) ?
                      ($signed(reg95) ?
                          wire85[(3'h7):(2'h2)] : {wire85,
                              wire87}) : reg97[(4'hf):(3'h5)]) ?
                  (~&({reg96} ^~ (reg95 ?
                      wire90 : wire90))) : (~&(|(^reg98)))));
            end
          else
            begin
              reg99 <= {$signed((($unsigned(wire91) ?
                          $unsigned((8'hb1)) : $signed(reg95)) ?
                      $unsigned((|wire85)) : (!reg97[(4'hf):(4'h9)]))),
                  (wire88[(2'h3):(2'h2)] << $signed(($unsigned(wire91) | (reg95 ?
                      wire85 : reg98))))};
            end
        end
      else
        begin
          reg93 <= (($unsigned(($signed(wire89) ~^ wire85[(1'h0):(1'h0)])) ?
              $unsigned($signed($unsigned(reg98))) : (~&wire87)) ^ ((reg98[(1'h0):(1'h0)] - $signed($signed((8'haf)))) ^ (~^$signed($signed((7'h42))))));
        end
    end
  assign wire100 = (~&{(|($unsigned(wire85) ?
                           wire91[(3'h4):(1'h1)] : (!wire86)))});
  assign wire101 = reg94;
  always
    @(posedge clk) begin
      reg102 <= {(|$signed($unsigned($signed(reg99))))};
      reg103 <= (^{reg98});
      reg104 <= $unsigned((reg94 <<< reg103[(3'h7):(2'h3)]));
      reg105 <= {wire85[(3'h4):(1'h1)],
          (reg102[(3'h4):(1'h1)] ? reg96 : $unsigned(reg96[(3'h4):(1'h1)]))};
    end
  assign wire106 = wire89[(1'h0):(1'h0)];
  assign wire107 = (-reg95);
  assign wire108 = {((^~{$unsigned(wire90)}) ?
                           (+$signed((reg96 ?
                               wire90 : (8'ha0)))) : {(^(wire88 <<< wire107))})};
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire59,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg18,
                 (1'h0)};
  assign wire14 = ({((8'hbc) + wire9)} ?
                      ((~(~&(wire13 ^~ (8'hab)))) == $signed(wire10)) : $signed({$signed(((8'hb8) ?
                              wire12 : (8'haf))),
                          ((~^wire9) - (wire12 < wire9))}));
  assign wire15 = {($unsigned({wire9}) <<< ((^~wire11[(2'h3):(2'h3)]) < wire12)),
                      (((8'hae) ?
                              {$unsigned((8'ha4))} : (wire14[(1'h0):(1'h0)] ?
                                  wire11[(2'h3):(2'h2)] : (wire11 ?
                                      wire9 : wire9))) ?
                          {$unsigned(wire9[(1'h1):(1'h1)])} : {wire14})};
  assign wire16 = wire10[(5'h10):(4'hd)];
  assign wire17 = ((~wire15) ? wire9 : wire14);
  always
    @(posedge clk) begin
      reg18 <= (~^((wire16 < wire12[(4'hc):(1'h0)]) ^~ (^~{$signed(wire11),
          wire10})));
    end
  module19 #() modinst60 (wire59, clk, wire12, wire9, wire15, wire17);
  assign wire61 = wire10;
  assign wire62 = ((($signed(wire17[(1'h0):(1'h0)]) ?
                              ($signed(wire16) >= (wire15 << (8'hb9))) : {{wire17}}) ?
                          (~(&$signed((8'ha9)))) : ($signed((wire59 ?
                                  wire13 : reg18)) ?
                              (wire14[(2'h3):(2'h2)] != $signed(wire59)) : {$signed(wire61)})) ?
                      (wire59[(1'h0):(1'h0)] ?
                          $signed(wire15[(5'h13):(3'h6)]) : (~|$unsigned(((8'h9e) ^~ wire10)))) : wire11[(3'h7):(3'h7)]);
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
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
                 (1'h0)};
  assign wire24 = ($unsigned(((8'hbd) >>> wire23[(4'hf):(4'hb)])) ?
                      wire21[(1'h1):(1'h0)] : (&wire23[(5'h12):(4'hf)]));
  assign wire25 = (!wire24);
  assign wire26 = (((($signed(wire24) > $signed(wire21)) ?
                      (~&wire20[(3'h4):(2'h2)]) : $signed((wire20 <= wire21))) & (|(wire25[(4'h9):(1'h1)] ?
                      ((8'ha4) ~^ wire24) : wire22))) << wire25);
  assign wire27 = $unsigned((wire21 ? wire20[(3'h6):(3'h6)] : wire22));
  assign wire28 = wire23;
  always
    @(posedge clk) begin
      reg29 <= (7'h43);
      reg30 <= $unsigned(wire23[(5'h10):(4'hb)]);
      if ($unsigned(($unsigned((~&$unsigned(wire24))) ?
          (($unsigned(reg30) ? reg29[(4'he):(3'h4)] : wire22[(4'hd):(3'h5)]) ?
              wire25[(3'h6):(3'h4)] : $signed((wire27 != (7'h40)))) : $unsigned(wire25))))
        begin
          reg31 <= ((^~$unsigned((+$unsigned(wire22)))) ?
              (8'ha3) : $unsigned($signed($signed((wire21 & reg29)))));
          reg32 <= ($signed($signed((((8'haf) ?
              (8'h9d) : reg29) >= (8'hb0)))) ^~ $unsigned((((wire22 ?
                  (8'hbb) : wire28) != wire28) ?
              (wire22[(1'h1):(1'h0)] >>> wire21[(2'h2):(2'h2)]) : $unsigned(reg31[(4'h9):(3'h4)]))));
          reg33 <= wire26;
          reg34 <= reg30;
        end
      else
        begin
          reg31 <= ((($signed($unsigned(wire26)) & $unsigned((wire22 && wire28))) | $signed($unsigned((wire24 >= wire23)))) ?
              $signed({($unsigned(wire22) ^~ (|reg33)),
                  wire25}) : (reg33 >= ((~|wire21[(2'h3):(2'h2)]) ?
                  wire27 : ((wire28 > wire25) < reg30))));
          if ((wire27 >= reg34))
            begin
              reg32 <= $unsigned(reg32);
              reg33 <= wire23[(5'h10):(2'h2)];
              reg34 <= ((~wire27) * (7'h41));
            end
          else
            begin
              reg32 <= ($signed($unsigned($unsigned($unsigned(wire26)))) ?
                  ((reg32[(2'h2):(2'h2)] && reg33[(3'h5):(1'h0)]) ?
                      $unsigned($unsigned((reg32 & reg29))) : {($signed(wire23) ^ wire27[(3'h7):(2'h3)])}) : wire26);
              reg33 <= {((wire23 << ($unsigned(wire23) ?
                          wire20[(2'h3):(2'h3)] : (reg30 ?
                              (8'ha9) : (8'hb9)))) ?
                      $unsigned({(reg34 ? reg34 : reg33),
                          (wire27 && wire25)}) : ($signed($signed(wire25)) || $signed($unsigned(reg34)))),
                  wire25[(3'h6):(1'h1)]};
              reg34 <= ($unsigned($signed(wire23[(4'ha):(1'h0)])) ?
                  (^~(((+wire21) ?
                      reg31 : (wire23 && wire20)) <<< (~&wire25))) : $unsigned(((&reg31[(5'h10):(1'h0)]) ?
                      wire21 : (~&$unsigned(wire25)))));
              reg35 <= (-(wire21[(1'h1):(1'h1)] ?
                  ({$unsigned(reg34)} | $unsigned(reg29)) : (wire23[(3'h7):(1'h1)] ?
                      $signed($signed(wire26)) : $unsigned($signed(reg32)))));
            end
          if ($unsigned(((+$signed($unsigned(reg30))) - $unsigned($unsigned(wire20)))))
            begin
              reg36 <= (~^(^(wire26[(5'h10):(1'h1)] ~^ ((-wire24) ?
                  wire27 : ((8'h9e) << wire23)))));
              reg37 <= $unsigned(($unsigned((|$unsigned(reg31))) ?
                  $unsigned($unsigned(wire23[(2'h3):(1'h1)])) : reg36[(2'h2):(1'h1)]));
              reg38 <= ((wire23 ^~ wire24) * (~^$unsigned($unsigned(reg33[(3'h6):(3'h6)]))));
            end
          else
            begin
              reg36 <= (+reg34);
              reg37 <= ((8'hbd) | $signed(wire28[(2'h3):(1'h1)]));
              reg38 <= $signed(wire24);
            end
        end
      reg39 <= ((^~(~$signed(reg33[(3'h4):(1'h1)]))) ?
          reg34 : (($unsigned(reg31[(1'h0):(1'h0)]) << ((reg32 && reg37) >>> reg29)) ^~ reg30[(2'h3):(2'h2)]));
    end
  assign wire40 = $unsigned($unsigned({(wire20 ?
                          (wire24 ? reg34 : reg31) : $signed(wire27))}));
  assign wire41 = wire28[(1'h0):(1'h0)];
  assign wire42 = reg31;
  assign wire43 = (7'h43);
  assign wire44 = wire43[(5'h10):(4'hd)];
  always
    @(posedge clk) begin
      reg45 <= {$unsigned(wire26[(4'h9):(2'h3)])};
      reg46 <= $unsigned(reg32);
      reg47 <= $unsigned(reg37);
    end
  always
    @(posedge clk) begin
      reg48 <= {$signed((+({reg46, reg29} ?
              (reg35 - reg35) : reg33[(3'h4):(1'h0)])))};
      reg49 <= (wire25[(3'h6):(1'h1)] ?
          $signed({reg47,
              (wire41 ? reg39[(4'h9):(3'h5)] : reg38)}) : ((($unsigned(wire41) ?
                  (^~(8'hab)) : (|wire20)) + ($unsigned(wire43) ?
                  wire22 : $signed((8'ha3)))) ?
              ($unsigned({reg38, wire43}) ?
                  {(reg32 ? (8'hbc) : (7'h42))} : ((-(7'h43)) ?
                      (wire28 == reg38) : {wire21})) : wire42));
      reg50 <= ($signed($signed((wire40 >> (~&(7'h43))))) ?
          reg30 : $signed((~&wire42[(1'h0):(1'h0)])));
      reg51 <= reg39;
    end
  assign wire52 = $signed($unsigned($unsigned(($unsigned(reg36) <= wire40[(3'h6):(1'h0)]))));
  assign wire53 = $signed(reg36[(3'h6):(3'h4)]);
  assign wire54 = ($unsigned(reg38[(3'h7):(3'h4)]) ?
                      reg30 : $signed(((8'h9c) ?
                          ((reg31 ?
                              reg29 : reg36) ~^ $unsigned(wire44)) : wire27[(3'h5):(2'h2)])));
  assign wire55 = (!{$unsigned($unsigned($signed(wire25)))});
  assign wire56 = ($unsigned(wire23[(5'h13):(5'h12)]) ? wire40 : wire42);
  assign wire57 = {$signed(((wire25 > (reg34 ? reg37 : reg46)) ?
                          reg36[(2'h2):(1'h1)] : wire56[(5'h15):(4'hd)])),
                      $unsigned((8'ha1))};
  assign wire58 = (!((~&wire41[(4'hf):(4'hf)]) ?
                      reg30 : (-$unsigned((~|wire41)))));
endmodule
