module top
#(parameter param96 = (((((8'ha0) ^~ {(8'ha0), (8'hb3)}) ? (~^((8'ha3) << (8'h9d))) : ((^(8'ha5)) ? (|(8'hb8)) : {(8'hae), (8'hb7)})) ? ((~|(~(8'ha7))) ^~ (((8'ha0) == (8'ha4)) ? ((8'hb0) < (8'hb0)) : ((8'h9e) ? (8'ha9) : (8'ha2)))) : {(((8'h9e) ? (8'ha4) : (7'h42)) ? ((8'ha8) >> (8'hb1)) : (^(8'hba)))}) ~^ (~{(((8'h9d) ? (8'h9e) : (8'had)) ^ (!(8'hb3))), (((8'ha8) ~^ (8'hbe)) != ((8'hb0) ~^ (8'hac)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire83;
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  assign y = {wire95,
                 wire86,
                 wire85,
                 wire83,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  module4 #() modinst84 (.wire5((8'hac)), .wire6(wire1), .clk(clk), .wire7(wire3), .wire8(wire0), .y(wire83), .wire9(wire2));
  assign wire85 = {wire0,
                      ($unsigned($signed($signed(wire2))) ?
                          ((wire0[(4'h8):(2'h2)] | $signed(wire2)) || wire83[(2'h3):(2'h3)]) : (wire2 ?
                              $unsigned($unsigned((8'hae))) : wire0))};
  assign wire86 = wire0[(4'h9):(4'h9)];
  always
    @(posedge clk) begin
      reg87 <= ((~|$unsigned((wire86 <= wire1))) ?
          wire1 : ((wire2 * ((wire85 ? wire3 : wire0) ?
              (~&wire0) : {wire83,
                  (8'hb1)})) == $unsigned(((^~wire0) || {wire83}))));
      if ((wire1[(4'hd):(1'h0)] ?
          ($signed(wire85) & wire83) : wire2[(3'h5):(2'h2)]))
        begin
          reg88 <= $unsigned((~|wire2[(3'h5):(1'h0)]));
        end
      else
        begin
          if (((reg88 < (^~wire83)) ? $unsigned(reg88) : wire83))
            begin
              reg88 <= (~|$signed($signed({wire86, {reg88, wire85}})));
            end
          else
            begin
              reg88 <= $unsigned(({((wire0 * wire86) ?
                          wire1[(2'h2):(1'h0)] : wire2[(4'h9):(3'h4)]),
                      ($unsigned(wire1) ? (~&(8'ha9)) : $signed(wire0))} ?
                  wire85[(4'hc):(4'ha)] : (wire2[(2'h2):(1'h0)] <= (+$signed((8'ha9))))));
              reg89 <= wire83;
            end
          reg90 <= (wire1[(4'h8):(3'h4)] ?
              $signed(reg88) : $signed((^~$signed(((7'h43) ?
                  reg88 : wire85)))));
          reg91 <= (wire85 ?
              $unsigned((7'h40)) : {(reg90[(2'h3):(2'h3)] ?
                      {wire1,
                          $unsigned(reg87)} : ($signed(reg88) <= $signed(wire2)))});
          reg92 <= reg91[(1'h0):(1'h0)];
        end
      reg93 <= {(reg89 == wire3[(5'h14):(4'he)])};
      reg94 <= (((($unsigned(reg90) ^~ (8'haf)) == reg88[(3'h5):(3'h5)]) <= wire0) > $signed($unsigned((+(reg90 ?
          (8'h9e) : reg90)))));
    end
  assign wire95 = wire2[(3'h4):(2'h3)];
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire6;
  input wire [(4'hf):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire79;
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire63,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire65,
                 wire67,
                 wire79,
                 reg66,
                 (1'h0)};
  assign wire10 = ((8'ha4) ^ wire6);
  assign wire11 = wire6[(2'h2):(1'h1)];
  assign wire12 = $unsigned($unsigned($signed($signed((^wire10)))));
  assign wire13 = (~&wire10[(4'ha):(4'h9)]);
  module14 #() modinst64 (wire63, clk, wire13, wire9, wire5, wire7, wire10);
  assign wire65 = ((($unsigned((wire12 <<< wire10)) ?
                      (&(wire9 + wire63)) : ($signed(wire9) - ((8'hba) ?
                          wire12 : wire9))) || (^~(-$unsigned(wire6)))) ^~ wire12[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg66 <= (8'hb6);
    end
  assign wire67 = (~&$signed($unsigned(wire12[(1'h1):(1'h0)])));
  module68 #() modinst80 (wire79, clk, wire7, wire65, wire6, wire11, wire12);
  assign wire81 = (&({(~^$unsigned((8'ha4))),
                      {wire8[(3'h5):(2'h3)]}} & reg66[(3'h6):(3'h4)]));
  assign wire82 = wire67;
endmodule

module module68
#(parameter param78 = (((^~{{(7'h43)}}) ? {(((8'ha2) ? (8'ha3) : (8'had)) << (~&(8'hb9)))} : (~|(((7'h43) - (8'hbd)) + ((8'hbe) ? (8'h9c) : (8'hb0))))) ? (~((~|((8'h9d) <<< (8'hac))) || {(^~(8'hbe))})) : (((((8'haf) ? (7'h41) : (8'hb2)) ^~ ((8'ha9) >>> (8'ha6))) ? ((^(8'hb9)) ? {(8'ha8)} : ((8'hbe) ? (8'hb4) : (7'h44))) : (|((8'ha9) <= (8'hbe)))) ? {((~|(8'h9d)) ? (~|(8'hb8)) : ((8'hb6) ? (8'ha4) : (8'ha4))), ({(8'hb0)} == (!(7'h41)))} : (({(8'hbf)} + ((8'haf) ? (7'h43) : (8'had))) ? (+((8'h9d) * (8'hbe))) : (|((8'hb1) ? (8'hbd) : (8'hb2)))))))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire73;
  input wire signed [(3'h6):(1'h0)] wire72;
  input wire signed [(3'h6):(1'h0)] wire71;
  input wire signed [(3'h4):(1'h0)] wire70;
  input wire signed [(4'hb):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  assign y = {wire77, wire76, wire75, wire74, (1'h0)};
  assign wire74 = {($unsigned(wire73) ? $signed((8'haf)) : wire69),
                      wire72[(3'h4):(2'h2)]};
  assign wire75 = ($unsigned(wire70[(1'h0):(1'h0)]) + wire72);
  assign wire76 = wire73[(2'h3):(1'h0)];
  assign wire77 = wire76[(4'he):(1'h0)];
endmodule

module module14
#(parameter param61 = {(((8'haa) | {((8'haf) > (8'haf)), {(7'h40), (8'hb2)}}) << (-(((8'hb3) ? (8'hb3) : (8'hb3)) ? ((8'hb3) << (7'h41)) : (^~(8'ha3))))), {(~|(((8'hb2) ? (8'ha3) : (8'hae)) ? ((8'hab) || (8'haa)) : ((8'ha2) ? (8'ha9) : (8'ha8))))}}, 
parameter param62 = (((param61 | ((-param61) << {(8'ha5), (8'ha9)})) ? (^(param61 ? (^(8'ha9)) : (param61 ^~ param61))) : (({(8'ha6), param61} ? param61 : (+param61)) ? {(param61 ~^ param61), (|param61)} : ((param61 ? (8'hb5) : param61) > param61))) ? (((~&{param61}) ? (^((8'ha5) != param61)) : (param61 ? (param61 >>> param61) : (param61 && param61))) <<< (((!param61) ? param61 : (param61 ? param61 : param61)) ? ((param61 != param61) ? param61 : (param61 + param61)) : param61)) : (~|param61)))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire18;
  input wire signed [(4'ha):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire signed [(3'h4):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  assign y = {wire60,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire41,
                 wire40,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg59,
                 reg58,
                 reg52,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 (1'h0)};
  assign wire20 = $signed((~(wire16[(3'h5):(3'h5)] ?
                      $unsigned({wire16}) : $unsigned(((8'ha6) ?
                          wire18 : wire19)))));
  assign wire21 = {$unsigned(((^~$signed(wire16)) ?
                          $signed({wire20, wire15}) : ($signed(wire17) ?
                              $signed(wire18) : wire20[(2'h3):(1'h1)]))),
                      ((|(wire20 ?
                          {wire20} : wire17[(2'h2):(1'h1)])) <<< wire15[(1'h1):(1'h0)])};
  assign wire22 = ($signed($unsigned($unsigned((^wire20)))) ^~ $signed((^~{$signed((8'ha2)),
                      wire15})));
  assign wire23 = ($signed((^((^wire21) ?
                          wire20[(2'h3):(2'h2)] : $unsigned(wire22)))) ?
                      {wire17[(1'h1):(1'h0)],
                          $signed(wire17)} : (~(~|wire15[(2'h3):(1'h0)])));
  assign wire24 = (+wire22[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg25 <= wire21[(3'h6):(2'h2)];
      reg26 <= (&$unsigned(wire22[(3'h7):(2'h3)]));
    end
  always
    @(posedge clk) begin
      if (wire22)
        begin
          reg27 <= ($unsigned(wire17) && $unsigned((wire16[(4'hc):(1'h0)] == ((wire15 - wire16) != $unsigned(reg26)))));
          reg28 <= (($unsigned(wire15) ?
              ($signed((wire22 ? wire20 : (8'hb4))) ?
                  ((~^reg26) ?
                      $signed(wire18) : (wire23 >> wire20)) : reg27) : ((^wire24[(1'h1):(1'h1)]) > wire15)) == (wire18[(4'hf):(1'h0)] << $unsigned((wire21[(3'h4):(2'h2)] | (+reg25)))));
          reg29 <= wire19[(3'h5):(2'h3)];
          reg30 <= wire21[(2'h3):(2'h3)];
          reg31 <= reg27;
        end
      else
        begin
          reg27 <= ((-((8'ha5) - wire20)) && (((8'ha3) ?
              $signed($signed(reg25)) : {(reg30 ^~ wire17)}) >>> (-(~^((7'h43) ?
              wire22 : wire19)))));
        end
      if ($unsigned($unsigned($unsigned((wire20[(1'h1):(1'h1)] + (wire21 ?
          reg26 : wire23))))))
        begin
          if (((~^(reg30[(4'hd):(1'h1)] <<< ($signed(reg26) < ((8'hbb) >> (8'ha1))))) < (reg28 ?
              (~^{(wire23 ? wire24 : wire16), (^~reg31)}) : reg29)))
            begin
              reg32 <= reg28;
            end
          else
            begin
              reg32 <= (($signed((~|(wire16 && (7'h42)))) == ($signed(wire17[(4'h9):(1'h1)]) >>> reg28)) >= (~^(-wire19)));
            end
          reg33 <= wire16;
          reg34 <= $unsigned(wire15);
          reg35 <= $signed({$unsigned((~wire17))});
          if ($signed({$unsigned({(8'hb8)})}))
            begin
              reg36 <= {(-{(~|wire24)}), reg26};
              reg37 <= {$unsigned(({((8'hbb) ? (8'hbb) : reg28),
                      ((8'h9c) ? wire22 : wire16)} << (8'hba))),
                  $unsigned((|(wire22 ? $signed(reg33) : $signed((8'hac)))))};
              reg38 <= {reg32, $unsigned((reg31 >> (!{wire18, reg31})))};
            end
          else
            begin
              reg36 <= $unsigned((8'h9e));
              reg37 <= $signed(((wire16[(2'h3):(1'h1)] <<< $signed(((8'h9d) >> reg31))) <= (^{(&reg34),
                  (+wire20)})));
              reg38 <= $unsigned($unsigned($unsigned($signed((reg36 || reg36)))));
              reg39 <= wire16;
            end
        end
      else
        begin
          reg32 <= reg27;
        end
    end
  assign wire40 = (({$signed(reg36[(3'h7):(3'h7)]),
                      (^~(reg34 ?
                          reg32 : wire18))} << wire17[(3'h6):(1'h1)]) | wire22);
  assign wire41 = $unsigned(($unsigned(($signed(reg36) && {reg34})) && wire20));
  always
    @(posedge clk) begin
      reg42 <= $unsigned(((~|({wire18,
          reg28} >>> $unsigned((7'h42)))) < $unsigned((~{wire21}))));
      reg43 <= (7'h44);
      if ((reg26 | reg29[(4'ha):(4'h9)]))
        begin
          reg44 <= (8'h9f);
          reg45 <= $signed($unsigned((^~((!(8'hbe)) ^~ (wire17 + wire18)))));
          reg46 <= reg34[(4'h8):(3'h6)];
        end
      else
        begin
          reg44 <= ($signed((reg29 ?
              $unsigned((~&reg44)) : {reg39})) >> (^~(((|wire18) - reg37) ^ $signed(wire22[(1'h1):(1'h0)]))));
          reg45 <= $unsigned((wire40 << wire22[(1'h1):(1'h1)]));
          reg46 <= $unsigned($signed(($signed((+(8'hb2))) ?
              reg29 : (reg42 ? $signed((7'h40)) : (reg32 != (8'hbe))))));
          reg47 <= (~^((reg46[(2'h3):(2'h3)] ?
                  $unsigned($unsigned(reg31)) : $signed($unsigned(reg45))) ?
              ((reg25 * ((8'h9f) ~^ wire24)) ?
                  (wire18 < (^~wire24)) : $signed(reg25)) : (8'ha9)));
        end
      reg48 <= ((&{$unsigned(wire22[(3'h7):(1'h1)])}) > {($signed($signed((8'hb5))) ?
              ((+wire19) ? $signed(reg47) : $unsigned(reg29)) : {wire16}),
          wire17});
      reg49 <= (($unsigned({(reg37 ? reg28 : reg28)}) ?
          ($signed((reg38 ? wire20 : reg29)) ?
              $signed(reg44[(3'h5):(3'h5)]) : reg39) : (-reg38[(3'h4):(2'h3)])) ^~ wire21[(2'h2):(1'h1)]);
    end
  assign wire50 = reg48[(4'hd):(3'h6)];
  assign wire51 = reg47[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg52 <= $unsigned($signed((|$unsigned((reg28 <= (8'hb5))))));
    end
  assign wire53 = wire40;
  assign wire54 = wire19[(3'h5):(1'h0)];
  assign wire55 = ((-(((reg29 >> reg43) ? reg30 : $unsigned(reg49)) < (wire41 ?
                      $signed(wire19) : (reg36 ?
                          reg46 : wire50)))) <<< $signed(wire16));
  assign wire56 = $unsigned((~|(wire17 ?
                      (8'ha4) : $signed((wire20 != (8'hb1))))));
  assign wire57 = ((|$signed($unsigned(((8'haf) > reg42)))) ?
                      wire55 : (($unsigned((wire22 ? (8'hac) : reg38)) ?
                          $signed(reg32) : (^~(wire16 ^ reg34))) ^~ reg32));
  always
    @(posedge clk) begin
      reg58 <= {reg39[(3'h7):(2'h3)],
          ((wire56[(5'h11):(3'h4)] ?
                  ((reg44 ?
                      wire56 : reg45) < $unsigned(reg43)) : wire24[(3'h5):(3'h4)]) ?
              {wire22} : (-(-$signed((8'hbc)))))};
      reg59 <= ($signed(((~^$signed(wire41)) ?
              ((wire53 <<< reg33) ?
                  wire19 : $signed(reg35)) : (~$signed((8'hbd))))) ?
          wire15[(1'h0):(1'h0)] : $unsigned($unsigned(($unsigned(wire40) ?
              (reg28 ? reg25 : wire53) : ((8'haa) <= wire24)))));
    end
  assign wire60 = $unsigned(((^(((8'hbc) ? wire24 : reg34) ?
                          wire51[(4'h8):(3'h5)] : (^~(8'hac)))) ?
                      $signed({$unsigned(reg25),
                          (8'haf)}) : (reg48[(4'hb):(3'h5)] ?
                          $signed({reg42,
                              (8'hbf)}) : (wire17[(2'h2):(1'h1)] == (reg47 ?
                              reg26 : reg25)))));
endmodule
