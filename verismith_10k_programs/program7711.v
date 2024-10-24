module top
#(parameter param125 = ({((((8'hb2) ? (8'hb9) : (8'hb8)) < {(7'h41)}) | {(~&(8'ha1)), {(8'ha0), (8'hbc)}})} ? {((&((8'ha1) ? (8'hb9) : (8'hb4))) <= ((-(8'hb6)) ? {(8'hb5), (8'hae)} : ((8'hbf) ? (8'hb9) : (8'hb9))))} : {(^(((8'hbf) & (8'hba)) * (^(8'hb5))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire98;
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  assign y = {wire124,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire100,
                 wire84,
                 wire40,
                 wire39,
                 wire37,
                 wire4,
                 wire98,
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
                 reg101,
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
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 (1'h0)};
  assign wire4 = (wire1[(4'h9):(1'h0)] ?
                     (wire3[(4'hd):(3'h6)] ?
                         wire2 : (+$unsigned(((8'hbc) ?
                             wire2 : wire2)))) : (wire3[(3'h5):(3'h5)] ?
                         (wire0[(4'h8):(4'h8)] <= wire1) : wire2[(4'he):(4'ha)]));
  module5 #() modinst38 (wire37, clk, wire2, wire4, wire3, wire1);
  assign wire39 = wire0;
  assign wire40 = wire39[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg41 <= $unsigned((($signed((wire0 ?
              wire3 : wire2)) >= {wire2[(4'hb):(1'h1)],
              ((7'h41) ? wire39 : (7'h44))}) ?
          $unsigned(($signed(wire39) ?
              (-wire37) : wire3[(4'hd):(4'ha)])) : $unsigned($signed((wire3 >> wire3)))));
      if (wire4[(3'h5):(1'h1)])
        begin
          reg42 <= reg41[(1'h1):(1'h1)];
          reg43 <= (($signed($signed((wire1 ?
              wire3 : reg41))) - $signed(({wire3} ?
              wire2[(3'h6):(1'h1)] : wire39[(1'h1):(1'h0)]))) * $signed($signed(reg42[(3'h6):(2'h3)])));
          reg44 <= (+(!(reg42[(1'h1):(1'h0)] ?
              (8'hb0) : ($unsigned(wire1) ?
                  (reg42 ? wire37 : wire3) : (wire37 || wire3)))));
        end
      else
        begin
          reg42 <= ($signed((&$signed((|wire37)))) << (|(8'had)));
          reg43 <= {($signed((reg43 < (wire4 ?
                  (8'hb5) : wire2))) < (~&(wire1[(4'ha):(1'h0)] ^~ (wire39 ?
                  wire37 : wire0))))};
          reg44 <= wire1;
          reg45 <= ({wire1} >= (|(!reg42[(1'h1):(1'h0)])));
          reg46 <= $unsigned((({$unsigned(reg44)} << ({wire3} ?
                  ((8'hb0) ? wire3 : (8'had)) : $signed(wire37))) ?
              ($signed(wire2[(2'h2):(2'h2)]) == $signed((wire0 << wire3))) : (~&$unsigned(((8'hb9) && wire4)))));
        end
      reg47 <= $unsigned($signed($signed((|(reg45 >= (8'hbe))))));
      if (reg42[(4'hd):(4'h9)])
        begin
          reg48 <= reg43[(4'hb):(3'h5)];
          if (reg42[(2'h3):(2'h3)])
            begin
              reg49 <= reg43[(5'h11):(1'h0)];
              reg50 <= $signed(reg44);
              reg51 <= $unsigned($unsigned((-$unsigned($unsigned(reg45)))));
              reg52 <= ($unsigned((reg44[(3'h4):(1'h0)] ^ reg51[(1'h0):(1'h0)])) > (wire40 ?
                  ($unsigned($unsigned(wire3)) >>> reg50) : reg47));
            end
          else
            begin
              reg49 <= $unsigned(reg44[(4'h8):(1'h1)]);
              reg50 <= wire2[(4'hc):(3'h6)];
              reg51 <= $signed($signed((wire3[(4'h9):(1'h0)] + reg41)));
              reg52 <= (wire39[(1'h0):(1'h0)] ? wire40[(4'h8):(2'h2)] : wire37);
              reg53 <= $signed(reg50);
            end
        end
      else
        begin
          if ($signed(reg49[(3'h7):(1'h1)]))
            begin
              reg48 <= $signed(wire40[(2'h3):(1'h1)]);
            end
          else
            begin
              reg48 <= {reg43[(3'h6):(3'h4)]};
              reg49 <= {{reg47[(3'h4):(2'h2)], $unsigned({$signed(wire40)})},
                  reg51};
              reg50 <= (({((reg53 && reg48) ?
                          {reg45} : (reg46 ? (8'ha2) : reg47)),
                      reg48[(3'h4):(1'h1)]} ?
                  $signed($signed(reg41[(2'h2):(2'h2)])) : reg45[(5'h11):(4'h8)]) ^ $signed(reg43));
            end
          reg51 <= reg46;
        end
    end
  module54 #() modinst85 (wire84, clk, reg53, wire40, wire1, wire39, reg48);
  module86 #() modinst99 (.wire91(reg44), .clk(clk), .y(wire98), .wire89(wire0), .wire90(wire2), .wire88(reg47), .wire87(wire40));
  assign wire100 = $unsigned(((reg48[(4'he):(3'h4)] && reg42[(4'hb):(4'hb)]) ?
                       reg49 : {($signed(wire84) - (^wire98)),
                           $unsigned((8'had))}));
  always
    @(posedge clk) begin
      reg101 <= $unsigned(($unsigned(($unsigned(wire3) ?
          (reg42 ? wire84 : wire2) : (8'hbc))) ^~ $signed($signed({(8'hb5)}))));
      if ($unsigned((reg48 ? $signed($signed((&wire1))) : wire4)))
        begin
          reg102 <= $unsigned(wire3[(5'h11):(5'h11)]);
          reg103 <= $unsigned(((~|((reg101 | reg51) << {wire2, wire100})) ?
              $unsigned(($signed(wire84) & (wire98 == reg47))) : ((!$signed(reg50)) ^~ {(reg47 ?
                      reg50 : wire40),
                  (reg53 ^~ wire84)})));
        end
      else
        begin
          reg102 <= $signed($signed((wire1 * reg45)));
          if ($signed(reg51[(2'h3):(1'h0)]))
            begin
              reg103 <= reg102[(1'h0):(1'h0)];
              reg104 <= (~&$unsigned((~|($signed((8'hba)) ?
                  (~|reg44) : $unsigned(reg101)))));
              reg105 <= ($unsigned(wire37) ?
                  wire39[(3'h6):(3'h5)] : (reg45 ?
                      $unsigned(reg49[(2'h2):(1'h0)]) : $unsigned(reg103)));
              reg106 <= (^wire39[(3'h6):(1'h0)]);
            end
          else
            begin
              reg103 <= (((!(wire100[(4'h9):(4'h8)] ?
                      (8'hb0) : (~reg50))) ^ reg52[(3'h5):(3'h4)]) ?
                  {$signed(((reg45 ? reg48 : reg51) ?
                          (~|reg106) : reg42))} : reg52);
              reg104 <= (&(^(~|((^~reg101) ?
                  reg45[(5'h10):(5'h10)] : (^~reg41)))));
              reg105 <= (^{wire84[(4'h8):(3'h6)]});
              reg106 <= ($unsigned(wire98) ?
                  ((wire98 || $signed($signed(wire1))) ^~ wire98) : (^~(((~&(7'h40)) ^~ (reg101 ?
                      wire2 : reg43)) <= wire84[(2'h3):(2'h3)])));
              reg107 <= (!((($unsigned(wire98) ?
                      reg103[(4'h9):(3'h4)] : $unsigned(wire37)) && ((reg52 & wire1) ?
                      (reg49 ? (8'hae) : (7'h40)) : ((8'ha2) | reg49))) ?
                  reg104 : $unsigned(reg53)));
            end
        end
      if ({(~{(&((8'h9c) ? wire2 : wire98))})})
        begin
          reg108 <= ($signed($unsigned($signed((+reg45)))) ?
              ($unsigned({(reg48 && reg52), ((8'haf) * reg44)}) ?
                  reg103 : (8'ha8)) : ((~^((reg104 >> reg51) ?
                  ((8'hab) * (8'hb5)) : wire1)) || (8'hbe)));
          if (((((wire39[(3'h6):(1'h1)] >> reg103) ?
              $signed($signed(wire1)) : (!(reg107 <<< reg47))) <<< (reg104 >>> ($signed((8'hb4)) >= wire4))) | wire100[(3'h5):(3'h5)]))
            begin
              reg109 <= $unsigned((+$unsigned((reg104 ?
                  $unsigned(wire1) : reg105))));
            end
          else
            begin
              reg109 <= wire100;
              reg110 <= reg46[(2'h2):(1'h1)];
              reg111 <= (~((wire0 ?
                  {{wire39, (8'hb0)},
                      reg45[(3'h4):(2'h2)]} : ((^~reg48) <= $signed(wire0))) > $signed((&wire1[(3'h6):(2'h2)]))));
              reg112 <= reg43[(2'h3):(1'h1)];
            end
        end
      else
        begin
          if ($unsigned(((|reg101) ?
              wire39 : {((reg45 ? reg48 : (8'hba)) ? (~^reg101) : (8'ha8)),
                  ($unsigned((8'ha2)) != reg107[(4'hb):(3'h6)])})))
            begin
              reg108 <= wire2[(2'h2):(1'h1)];
              reg109 <= $signed(reg48[(4'hb):(3'h6)]);
              reg110 <= ({reg52} ?
                  $signed($unsigned($signed(wire3[(1'h0):(1'h0)]))) : reg109[(4'h8):(3'h5)]);
              reg111 <= ((reg101 && reg102) <<< (&(reg45 ?
                  $signed((reg101 ~^ reg108)) : reg106[(4'h8):(2'h2)])));
            end
          else
            begin
              reg108 <= reg104[(4'hc):(2'h3)];
            end
          reg112 <= $signed($unsigned(wire37));
          reg113 <= reg47;
          reg114 <= wire84[(3'h7):(3'h6)];
          if (wire84)
            begin
              reg115 <= (~&reg41[(1'h1):(1'h1)]);
              reg116 <= ({$signed((8'hb9)),
                  ({(reg52 <= wire0), (!reg110)} ?
                      ($unsigned(wire37) ?
                          $signed((8'h9d)) : reg107[(2'h3):(1'h1)]) : (reg101 != (wire3 ?
                          reg105 : reg105)))} >= $unsigned((reg109[(4'h8):(3'h5)] ^~ (+wire40))));
              reg117 <= reg46[(1'h1):(1'h1)];
              reg118 <= reg105;
            end
          else
            begin
              reg115 <= wire4[(3'h6):(1'h0)];
            end
        end
    end
  assign wire119 = $signed(wire0[(4'he):(3'h5)]);
  assign wire120 = (reg103 ?
                       ($unsigned($unsigned($unsigned(wire1))) << reg46[(3'h4):(2'h3)]) : (^(reg115[(1'h1):(1'h1)] ?
                           $unsigned(wire2) : {reg44[(1'h1):(1'h1)]})));
  assign wire121 = $unsigned((($unsigned((~|wire84)) ?
                       (^$signed(reg50)) : ((-wire0) ?
                           wire37[(4'hf):(3'h4)] : $unsigned(reg106))) << ($signed(reg109) ?
                       (~|$unsigned(wire84)) : (+reg51[(3'h6):(3'h5)]))));
  module63 #() modinst123 (.wire65(wire120), .wire68(reg117), .wire67(wire40), .wire64(reg47), .wire66(reg51), .y(wire122), .clk(clk));
  assign wire124 = reg111;
endmodule

module module86  (y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire91;
  input wire [(3'h6):(1'h0)] wire90;
  input wire [(5'h12):(1'h0)] wire89;
  input wire signed [(4'hb):(1'h0)] wire88;
  input wire signed [(2'h2):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  assign y = {wire97, wire96, wire95, wire94, wire93, wire92, (1'h0)};
  assign wire92 = wire88[(4'ha):(3'h6)];
  assign wire93 = wire90;
  assign wire94 = $signed((~|$signed((&(&wire93)))));
  assign wire95 = ({wire90[(2'h3):(2'h3)],
                          ((wire90 ?
                                  (wire92 != wire92) : (wire92 ?
                                      wire88 : wire92)) ?
                              {wire94} : $signed(wire87))} ?
                      ((8'hb8) ^ (~$signed($unsigned(wire87)))) : wire88[(1'h0):(1'h0)]);
  assign wire96 = wire91[(4'hc):(2'h3)];
  assign wire97 = $unsigned((+((^$signed(wire96)) ?
                      wire93 : $unsigned((wire92 ? wire88 : wire95)))));
endmodule

module module54
#(parameter param82 = (+(!(^~{((8'had) ? (8'hb4) : (8'hba)), (&(8'ha4))}))), 
parameter param83 = ((+(7'h42)) ? {param82, (param82 ? (((7'h40) - param82) ~^ (param82 < param82)) : ((8'hb0) || {param82}))} : param82))
(y, clk, wire55, wire56, wire57, wire58, wire59);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire55;
  input wire [(3'h6):(1'h0)] wire56;
  input wire [(5'h11):(1'h0)] wire57;
  input wire [(5'h10):(1'h0)] wire58;
  input wire [(4'he):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire77;
  assign y = {wire81, wire80, wire79, wire60, wire61, wire62, wire77, (1'h0)};
  assign wire60 = $unsigned(({$unsigned($signed(wire59)),
                      (+$signed(wire55))} << wire59));
  assign wire61 = wire57;
  assign wire62 = (+$unsigned($unsigned({$signed(wire55)})));
  module63 #() modinst78 (wire77, clk, wire59, wire61, wire62, wire55, wire57);
  assign wire79 = $unsigned(wire60[(3'h4):(2'h2)]);
  assign wire80 = {(-wire59)};
  assign wire81 = wire77[(1'h1):(1'h1)];
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire31;
  assign y = {wire36, wire35, wire34, wire33, wire31, (1'h0)};
  module10 #() modinst32 (wire31, clk, wire6, wire8, wire9, wire7);
  assign wire33 = $unsigned(($unsigned({$unsigned(wire8)}) ?
                      wire7 : ($unsigned($signed(wire9)) ?
                          ((wire31 <= (8'ha5)) ?
                              (wire7 ?
                                  wire6 : wire9) : $unsigned((8'ha0))) : $unsigned((~wire7)))));
  assign wire34 = wire7[(5'h12):(4'hb)];
  assign wire35 = (^((($unsigned((8'hb1)) ?
                          $signed(wire31) : (wire34 ?
                              wire31 : wire8)) - wire31[(4'h9):(2'h2)]) ?
                      wire7[(5'h12):(3'h5)] : $signed($signed(wire8[(1'h1):(1'h0)]))));
  assign wire36 = wire8;
endmodule

module module10
#(parameter param30 = (|(((((8'ha9) ? (8'h9e) : (7'h43)) ? ((7'h41) & (8'hbe)) : {(8'hb0)}) ? (((8'h9c) < (8'hb9)) <<< ((8'h9e) ^~ (8'ha0))) : (8'hbf)) ? ({((7'h40) & (8'hb5)), ((8'h9e) != (8'h9d))} ? ((^(8'h9d)) ? {(8'hba)} : ((7'h44) ? (8'hbe) : (8'hab))) : (-((8'hb2) ? (8'haa) : (8'haa)))) : ((^(+(8'ha3))) ^~ (((8'ha1) ? (8'hac) : (8'h9f)) ? ((8'hb9) | (8'h9f)) : (~&(8'ha4)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire14;
  input wire [(2'h2):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg26,
                 reg24,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= wire13[(2'h2):(1'h0)];
      reg16 <= $unsigned(((&wire14) | wire14));
      reg17 <= (^((reg15[(1'h0):(1'h0)] * wire14) && wire13[(1'h0):(1'h0)]));
      reg18 <= reg17[(4'hf):(4'hc)];
      reg19 <= reg18;
    end
  assign wire20 = $unsigned($unsigned(reg19[(3'h5):(3'h4)]));
  assign wire21 = $signed($signed(wire12));
  assign wire22 = ((wire14 * reg18) ?
                      (wire21 <<< reg17) : wire11[(3'h5):(3'h4)]);
  assign wire23 = ((8'hae) <= wire20);
  always
    @(posedge clk) begin
      reg24 <= wire20;
    end
  assign wire25 = $unsigned(wire23);
  always
    @(posedge clk) begin
      reg26 <= wire12[(1'h0):(1'h0)];
    end
  assign wire27 = (wire20[(3'h4):(1'h0)] ?
                      (^wire21) : $unsigned($signed(reg18[(4'ha):(4'h8)])));
  assign wire28 = $signed({(~^((~^wire27) ? wire14 : (~^wire21))), (8'hb3)});
  assign wire29 = (!($signed(wire23[(3'h4):(3'h4)]) ^~ {$unsigned($unsigned(wire23))}));
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire68;
  input wire signed [(2'h2):(1'h0)] wire67;
  input wire [(4'h9):(1'h0)] wire66;
  input wire signed [(4'hb):(1'h0)] wire65;
  input wire signed [(4'hf):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 (1'h0)};
  assign wire69 = (~&wire68);
  assign wire70 = {($unsigned($signed(wire69[(3'h6):(2'h3)])) ?
                          {(8'ha0),
                              $signed(((8'h9f) ?
                                  wire68 : wire69))} : $signed(wire64)),
                      (wire69 ?
                          wire65[(3'h6):(1'h0)] : ($unsigned(((8'ha4) ?
                                  wire67 : wire67)) ?
                              (-{wire67, wire68}) : $signed((wire67 ?
                                  wire68 : wire67))))};
  assign wire71 = (^~(wire70[(2'h2):(2'h2)] ^~ ({(8'ha0), {wire64}} | wire66)));
  assign wire72 = wire66;
  assign wire73 = ($unsigned(($unsigned(wire66) ?
                          $signed(wire68) : $signed({wire72, (8'h9e)}))) ?
                      ($signed($unsigned(wire65[(4'h9):(2'h2)])) ?
                          (((|wire70) >> (!wire66)) - {(wire69 ?
                                  (8'ha7) : (8'h9c))}) : {(7'h44),
                              ($signed(wire70) <= $unsigned(wire72))}) : $unsigned($unsigned(wire72[(5'h11):(4'hd)])));
  assign wire74 = (&(-wire64));
  assign wire75 = wire66[(4'h8):(3'h4)];
  assign wire76 = $signed($signed((8'hb0)));
endmodule
