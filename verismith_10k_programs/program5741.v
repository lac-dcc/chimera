module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire85;
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire52,
                 wire85,
                 (1'h0)};
  module4 #() modinst53 (wire52, clk, wire3, wire0, wire2, wire1, (8'h9c));
  module54 #() modinst86 (.wire57(wire2), .clk(clk), .wire58(wire52), .wire59(wire0), .wire55(wire3), .wire56(wire1), .y(wire85));
  assign wire87 = $unsigned(wire52);
  assign wire88 = (wire87[(5'h13):(2'h3)] ?
                      (^~(7'h44)) : $unsigned({((~^(8'hb0)) - $signed(wire1)),
                          (~|(wire85 ? wire2 : wire1))}));
  assign wire89 = (wire0 >>> wire2);
  assign wire90 = wire2[(1'h1):(1'h0)];
  assign wire91 = (wire3[(2'h3):(2'h2)] + wire88[(4'hf):(1'h1)]);
  assign wire92 = (wire90[(4'h9):(1'h1)] ^~ wire1[(3'h7):(3'h6)]);
endmodule

module module54
#(parameter param83 = ((^~((~^((8'h9e) ? (8'ha0) : (7'h44))) ? (-{(8'ha6), (8'hb2)}) : (((7'h41) ~^ (8'ha1)) >>> (7'h40)))) ? ((-(((8'hbd) > (8'haa)) | ((8'ha7) ~^ (8'hb1)))) && {(~^((7'h42) >>> (7'h44)))}) : (^~(8'h9c))), 
parameter param84 = param83)
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire59;
  input wire [(5'h14):(1'h0)] wire58;
  input wire signed [(4'hb):(1'h0)] wire57;
  input wire [(3'h5):(1'h0)] wire56;
  input wire signed [(5'h10):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire72,
                 wire70,
                 wire69,
                 wire66,
                 wire65,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg71,
                 reg68,
                 reg67,
                 reg64,
                 (1'h0)};
  assign wire60 = (($signed((~$unsigned(wire55))) > {$unsigned({wire59})}) <= ((($signed(wire58) > wire56[(1'h0):(1'h0)]) ?
                      (wire56[(2'h2):(1'h0)] ^~ $unsigned(wire59)) : $unsigned((wire56 + wire55))) ^ (wire56 ?
                      $signed((~^wire57)) : (^~$signed(wire55)))));
  assign wire61 = wire58;
  assign wire62 = (8'hab);
  assign wire63 = wire57[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg64 <= {wire60[(1'h0):(1'h0)]};
    end
  assign wire65 = wire59[(4'ha):(3'h5)];
  assign wire66 = (^$unsigned({($unsigned(wire59) ?
                          wire63[(2'h2):(2'h2)] : wire63[(4'ha):(2'h2)]),
                      $signed(wire59[(1'h0):(1'h0)])}));
  always
    @(posedge clk) begin
      reg67 <= wire63[(4'ha):(2'h2)];
      reg68 <= $signed((wire57 <= ($unsigned((wire65 ? wire66 : (8'hab))) ?
          (+(wire65 ^ wire58)) : {wire63[(3'h6):(2'h2)], wire66})));
    end
  assign wire69 = $unsigned({($signed((^wire56)) ^~ $signed($signed((8'h9c)))),
                      (-$signed(wire58))});
  assign wire70 = (+$unsigned({$unsigned(reg67)}));
  always
    @(posedge clk) begin
      reg71 <= ($signed((wire59 == (wire65[(3'h4):(2'h2)] ?
          (&wire66) : (wire70 ?
              wire57 : wire66)))) ~^ $unsigned((($unsigned(wire56) ?
              (wire65 >> reg64) : $unsigned(wire55)) ?
          ($unsigned(wire69) & reg64[(4'ha):(3'h5)]) : (&$unsigned((8'ha9))))));
    end
  assign wire72 = $signed($unsigned((^wire57)));
  always
    @(posedge clk) begin
      reg73 <= $unsigned((($unsigned($signed((8'ha7))) && (^$unsigned(wire63))) >> reg67));
      reg74 <= {$unsigned($unsigned($unsigned((wire58 - wire57))))};
      reg75 <= $unsigned(wire59[(4'he):(1'h0)]);
      reg76 <= $unsigned((~^(-$unsigned(((8'ha2) + reg67)))));
    end
  assign wire77 = reg67;
  assign wire78 = ((&((wire58 ?
                      $signed(reg74) : reg76[(1'h1):(1'h1)]) && ($unsigned(wire72) ^~ reg74[(3'h5):(3'h5)]))) >> $signed(((^(|reg71)) ?
                      wire59 : $signed(reg68))));
  assign wire79 = wire77[(2'h3):(2'h3)];
  assign wire80 = $signed($signed($unsigned({(!wire60)})));
  assign wire81 = (($signed(wire80[(3'h5):(1'h0)]) | $signed(wire56)) < $signed(wire56[(1'h0):(1'h0)]));
  assign wire82 = ({$signed(((^(8'ha9)) ?
                          wire66[(2'h2):(1'h1)] : {(8'had)}))} & $signed((~&(+$unsigned(wire72)))));
endmodule

module module4
#(parameter param51 = {((!(~|(~(8'hb3)))) ? ({(+(8'hbd)), (|(8'hae))} ? (((8'ha2) - (8'hbd)) ? (~^(7'h40)) : ((8'hb7) ? (8'hbe) : (8'ha5))) : (+{(8'hae)})) : (~({(8'hbb), (8'hb8)} <<< ((7'h42) ^~ (8'ha7))))), ((({(8'haf)} ? ((8'h9f) - (8'haa)) : (|(8'haf))) ? (^~((8'hb1) & (8'hbe))) : (((8'hbc) > (8'haa)) ? ((8'hb1) ? (8'haa) : (8'hac)) : ((8'hba) ? (8'h9d) : (8'hb6)))) ? (~|(((8'ha8) << (8'hbe)) ? (^~(8'ha1)) : ((8'hb4) != (8'haa)))) : ((((8'hb8) ^ (8'h9e)) ? ((8'hb2) <<< (8'hbf)) : ((8'hb4) ? (7'h40) : (8'h9f))) ? ((|(8'h9f)) * ((8'h9f) != (8'hab))) : ({(8'ha0), (8'hbb)} ^ (~^(8'ha4)))))})
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  assign y = {wire50,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire11,
                 wire10,
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
                 (1'h0)};
  assign wire10 = $signed({($signed((wire6 ? wire8 : wire7)) ?
                          wire5 : (wire5 ?
                              (wire7 ? wire8 : (8'ha7)) : wire6))});
  assign wire11 = wire5;
  module12 #() modinst29 (.wire14(wire10), .wire16(wire11), .y(wire28), .clk(clk), .wire15(wire7), .wire13(wire9));
  assign wire30 = $unsigned($unsigned(wire6));
  assign wire31 = (-({($signed(wire9) && (!(8'hab)))} && ($signed($unsigned((8'hbd))) ?
                      $unsigned(wire9) : (~&wire9))));
  assign wire32 = $unsigned($signed({(wire9[(1'h1):(1'h1)] && (wire10 * wire5)),
                      {wire10[(3'h6):(2'h3)]}}));
  assign wire33 = wire32[(4'h9):(3'h4)];
  assign wire34 = (8'ha9);
  assign wire35 = wire5[(3'h4):(3'h4)];
  assign wire36 = wire8;
  always
    @(posedge clk) begin
      if (wire34[(4'h9):(1'h1)])
        begin
          reg37 <= wire5;
          reg38 <= (&($unsigned($signed({wire34})) ?
              wire33 : (~&(&$signed(wire35)))));
          if ($signed(wire7[(4'ha):(2'h2)]))
            begin
              reg39 <= (8'ha9);
              reg40 <= ($unsigned(({wire7, $signed(wire31)} ?
                      ($unsigned(wire7) ?
                          {wire28} : (~wire34)) : (~|(+(8'hb6))))) ?
                  $unsigned($unsigned($signed((-wire9)))) : $unsigned(wire8[(4'h8):(3'h7)]));
              reg41 <= wire5;
              reg42 <= {(~&wire9[(3'h5):(3'h5)]),
                  ((wire35[(3'h6):(1'h1)] ?
                      reg40[(5'h13):(4'h8)] : ((wire34 >> reg40) - wire8[(3'h5):(2'h3)])) > (wire34[(4'ha):(2'h3)] > (wire9 << (wire34 * (8'h9c)))))};
            end
          else
            begin
              reg39 <= wire35[(4'ha):(1'h1)];
              reg40 <= wire5;
              reg41 <= {$unsigned(reg37[(4'ha):(1'h1)]),
                  (~&(~^$signed(reg37[(3'h5):(2'h2)])))};
              reg42 <= $signed($unsigned($signed($unsigned(wire28))));
              reg43 <= (|$signed(reg40[(4'h9):(4'h8)]));
            end
          reg44 <= $signed(wire33[(1'h0):(1'h0)]);
          if (((~&{(wire36[(1'h1):(1'h0)] > reg41),
              wire32[(2'h2):(1'h1)]}) ~^ $signed(((~|(wire35 ?
                  wire34 : wire36)) ?
              $unsigned($signed((8'hb6))) : (~&$signed(wire32))))))
            begin
              reg45 <= $signed($signed(wire7));
              reg46 <= $signed($unsigned((8'hba)));
            end
          else
            begin
              reg45 <= $signed(($unsigned($unsigned($signed(reg45))) > $unsigned((|(~&reg44)))));
              reg46 <= ($signed($unsigned(reg45[(1'h1):(1'h0)])) ?
                  reg42 : $unsigned((($signed((8'hbc)) | (reg41 ?
                          wire8 : wire28)) ?
                      (~^$signed(wire32)) : wire8)));
              reg47 <= $unsigned(($signed(wire9[(3'h4):(2'h3)]) != $signed((+(8'ha2)))));
              reg48 <= (!$signed($unsigned((!(wire10 ? (8'ha0) : reg43)))));
              reg49 <= $signed((~&reg43[(4'h8):(1'h0)]));
            end
        end
      else
        begin
          reg37 <= {wire8};
          reg38 <= $signed(wire31[(4'h9):(3'h7)]);
          reg39 <= {(8'haa),
              (~&$unsigned(((reg42 ? reg48 : (8'hb3)) ?
                  $unsigned(wire34) : (reg41 ? wire10 : wire31))))};
          reg40 <= ($unsigned(wire31[(5'h11):(3'h6)]) ?
              (reg38 ?
                  $signed(wire34[(4'h8):(3'h7)]) : {($unsigned(reg39) - {reg47})}) : ({(8'ha8)} | reg38[(1'h0):(1'h0)]));
        end
    end
  assign wire50 = {(|(&(wire10 ~^ wire36))),
                      {(-((~|reg42) ^~ $unsigned((8'hb5))))}};
endmodule

module module12
#(parameter param27 = (((^((+(7'h40)) || {(8'hb6)})) ? ((8'ha1) >> (&(~(8'hac)))) : (({(8'ha7), (7'h40)} >> ((8'hba) ? (7'h41) : (8'hba))) ~^ (!(&(7'h42))))) ? ((~&(8'ha4)) ? ((((8'hae) + (8'hab)) <<< ((8'hb4) ^~ (8'had))) ^ (((8'had) ? (8'ha3) : (8'ha6)) ? {(8'hae)} : ((8'ha0) || (8'hb0)))) : ((~|((8'ha6) <<< (8'h9c))) >= (+((8'hab) ? (8'ha1) : (8'hb2))))) : (~|(-((~(8'hac)) ? ((8'hb4) ? (8'ha3) : (8'hb3)) : ((8'hb8) ? (7'h40) : (8'h9e)))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire16;
  input wire [(4'ha):(1'h0)] wire15;
  input wire signed [(2'h3):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 (1'h0)};
  assign wire17 = wire14;
  assign wire18 = $signed((wire16[(3'h4):(1'h0)] + $unsigned(wire13[(3'h6):(3'h6)])));
  assign wire19 = wire18;
  assign wire20 = (&(($signed((wire13 ? wire16 : wire18)) ?
                      wire13 : wire17[(4'hb):(2'h2)]) * wire16));
  assign wire21 = (((&{wire18}) ?
                      ($unsigned((wire20 ? wire17 : wire16)) ?
                          (wire20[(4'hb):(4'ha)] ^~ $unsigned(wire18)) : $unsigned(wire18[(5'h12):(4'h9)])) : wire15) >>> wire14);
  assign wire22 = ((8'ha2) | wire17[(4'he):(4'hb)]);
  assign wire23 = (wire19[(1'h0):(1'h0)] ?
                      wire22[(3'h5):(2'h3)] : $signed(wire17));
  assign wire24 = ($signed(wire22) ?
                      (!wire22[(1'h0):(1'h0)]) : wire18[(5'h12):(3'h6)]);
  assign wire25 = $unsigned((~^$unsigned(($unsigned(wire19) ~^ $signed(wire19)))));
  assign wire26 = wire17[(3'h5):(1'h1)];
endmodule
