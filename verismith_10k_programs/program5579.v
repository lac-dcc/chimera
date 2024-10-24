module top #(parameter param70 = (8'h9c)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire52,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg65,
                 reg64,
                 reg63,
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
  assign wire4 = wire1;
  assign wire5 = $unsigned(wire0[(3'h7):(2'h3)]);
  assign wire6 = ((^(~^{$unsigned(wire5), (+wire3)})) || {wire0[(3'h5):(1'h1)],
                     {(+(wire4 ? wire2 : wire0))}});
  assign wire7 = (~|$signed(wire1[(1'h1):(1'h0)]));
  assign wire8 = wire3;
  module9 #() modinst53 (.wire10(wire0), .wire11(wire2), .clk(clk), .wire13(wire7), .y(wire52), .wire12(wire5));
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg54 <= $signed($unsigned(wire8[(2'h3):(2'h2)]));
          if ((~|wire0))
            begin
              reg55 <= (~^($signed($unsigned((reg54 ? (8'ha2) : wire52))) ?
                  {$signed($unsigned(wire7)),
                      wire1[(2'h3):(2'h3)]} : wire5[(5'h11):(4'hd)]));
              reg56 <= wire6;
            end
          else
            begin
              reg55 <= $signed(wire3);
            end
          if (((!(~(-wire6[(3'h4):(1'h0)]))) >> $signed((~&wire3[(1'h1):(1'h0)]))))
            begin
              reg57 <= wire3;
              reg58 <= (~&{$unsigned(wire6[(2'h3):(1'h0)]),
                  ({(8'hbb), (reg55 <<< wire3)} <<< (wire1 ?
                      (~wire7) : (8'hb3)))});
              reg59 <= (~reg56);
              reg60 <= ((((~wire2) ?
                      (reg58 && (^~wire5)) : (reg58[(3'h4):(1'h0)] ?
                          (wire6 && reg59) : (~^wire7))) ?
                  ((wire0 ?
                      $unsigned((8'ha6)) : (wire8 > reg55)) + (reg56[(4'hc):(4'h9)] ?
                      reg59[(4'h9):(1'h0)] : {wire6,
                          reg57})) : $signed((~^wire52[(3'h4):(2'h2)]))) ^~ {wire52,
                  wire52[(4'hc):(1'h0)]});
              reg61 <= wire5[(1'h0):(1'h0)];
            end
          else
            begin
              reg57 <= reg58[(3'h5):(1'h0)];
              reg58 <= ($unsigned(wire6[(3'h4):(3'h4)]) || (8'ha7));
              reg59 <= ((-{$signed((wire7 >>> reg55))}) ?
                  (((((8'haf) ? (8'hba) : (8'hb5)) ?
                              wire5[(3'h7):(3'h7)] : $signed(reg57)) ?
                          (~|$signed((8'hba))) : $signed($signed(wire3))) ?
                      reg59 : $unsigned((reg61 + (wire7 == (8'hb6))))) : wire1[(3'h5):(2'h3)]);
              reg60 <= $unsigned((($unsigned(((8'hb6) >>> (8'ha2))) && reg60) >= reg56[(4'he):(3'h5)]));
            end
          reg62 <= $signed((|wire6[(3'h7):(2'h3)]));
        end
      else
        begin
          reg54 <= $signed($signed(reg59[(2'h2):(2'h2)]));
          reg55 <= ((!$unsigned((-(wire2 || reg57)))) << ($signed((+$unsigned((8'hb8)))) ?
              ($signed((reg56 || wire0)) ?
                  (wire1[(1'h0):(1'h0)] + wire8[(4'he):(2'h2)]) : wire0) : (8'hb4)));
        end
      reg63 <= (~^$unsigned(reg60[(3'h7):(1'h0)]));
      reg64 <= $signed($unsigned(({wire4[(2'h2):(1'h1)],
          (reg59 ? reg59 : wire2)} - (~^reg57[(1'h1):(1'h0)]))));
      reg65 <= wire0[(4'h9):(4'h9)];
    end
  assign wire66 = $unsigned(reg59);
  assign wire67 = reg61[(1'h0):(1'h0)];
  assign wire68 = $unsigned($unsigned(wire8[(4'hc):(3'h7)]));
  assign wire69 = ({(($signed((8'ha5)) & wire0[(4'h8):(2'h2)]) ?
                          $signed((reg57 ?
                              reg59 : (8'hb8))) : (!$unsigned(wire8)))} == {(wire68[(2'h3):(1'h1)] ^ ((wire7 ?
                              wire4 : (8'hb3)) ?
                          $signed((8'hb9)) : wire1[(2'h2):(1'h1)]))});
endmodule

module module9
#(parameter param51 = ({{((&(8'ha8)) > (~(8'hb1))), ({(8'ha5), (8'had)} ? ((8'hbc) ? (8'ha6) : (8'hb4)) : ((8'h9e) ? (8'h9c) : (8'hbf)))}} ? (({((8'hb7) & (8'hb3)), (|(8'hb7))} ? (((8'ha0) ? (8'hab) : (8'h9d)) ? (~^(8'hbf)) : ((8'hbb) ? (8'hbc) : (8'ha6))) : (((8'h9f) ? (7'h41) : (8'hb8)) ? ((8'ha8) ^ (8'hbb)) : {(8'hbf)})) >>> (~&((8'hb5) > (^~(8'h9c))))) : (8'haa)))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire14;
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  assign y = {wire50, wire49, wire47, wire16, wire14, reg15, (1'h0)};
  assign wire14 = ($unsigned((8'hae)) ^ ((~^wire13) ?
                      ((wire12 >>> (wire10 ?
                          wire10 : (8'hb2))) ^ wire12) : (8'h9c)));
  always
    @(posedge clk) begin
      reg15 <= $signed(wire11[(2'h2):(2'h2)]);
    end
  assign wire16 = (^~$signed((reg15[(3'h7):(3'h4)] + $unsigned(wire14[(4'h8):(1'h1)]))));
  module17 #() modinst48 (.clk(clk), .wire19(wire16), .y(wire47), .wire21(wire11), .wire20(wire14), .wire18(wire12));
  assign wire49 = $signed(((8'hbe) ?
                      $unsigned(($signed(wire11) ^ (^~wire16))) : $unsigned((wire12[(4'h9):(2'h2)] ?
                          (wire47 ? (8'hb0) : wire47) : (wire12 > reg15)))));
  assign wire50 = ((wire13 >> wire11[(4'hb):(2'h2)]) + wire13[(3'h4):(2'h2)]);
endmodule

module module17
#(parameter param46 = {(~|{((8'ha1) ? ((8'hb5) && (8'hbe)) : ((8'hb3) ~^ (8'hbd))), (((8'had) | (8'hb4)) ? ((8'hae) || (8'hb5)) : ((8'hb9) & (8'ha7)))})})
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire signed [(3'h6):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  assign y = {wire45,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg44,
                 reg43,
                 reg42,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire22 = wire21[(1'h1):(1'h0)];
  assign wire23 = ($signed(((~|wire20) ?
                      wire18 : wire20[(5'h13):(5'h12)])) <= (-$unsigned($unsigned($unsigned(wire20)))));
  assign wire24 = ({(wire22[(2'h2):(2'h2)] >= (!(wire21 ? wire18 : (8'hb0)))),
                          (wire19[(1'h1):(1'h1)] ?
                              (~^$signed(wire23)) : {wire23})} ?
                      (wire19[(2'h2):(1'h0)] == $unsigned((~^(wire18 >> wire22)))) : $signed((~|wire23)));
  assign wire25 = ((~&{$unsigned($signed(wire24))}) ?
                      wire21[(4'h9):(4'h9)] : (^{{wire22, (+wire19)}}));
  assign wire26 = $signed(((~|($signed(wire24) ? (^wire18) : $signed(wire25))) ?
                      wire25[(2'h2):(1'h1)] : $signed((&wire25[(3'h4):(2'h3)]))));
  assign wire27 = wire20;
  always
    @(posedge clk) begin
      reg28 <= (wire20 ?
          wire18[(4'h9):(2'h3)] : (((^~wire27[(3'h6):(3'h5)]) ?
              $unsigned(((8'hb4) > wire27)) : wire22) >> ($signed((wire18 ?
                  wire20 : wire26)) ?
              ((wire24 != wire24) || {wire25, wire25}) : wire25)));
      reg29 <= (^(wire27 <<< (~^(8'hb4))));
    end
  assign wire30 = (wire27 ?
                      {({$signed((8'hbe))} | wire20),
                          (wire19 ?
                              wire18 : {$unsigned(wire23),
                                  (wire19 ?
                                      wire26 : (8'hba))})} : $signed($signed(wire26[(1'h1):(1'h0)])));
  assign wire31 = ($unsigned(($unsigned((wire27 ?
                      wire30 : reg28)) || $signed($unsigned(reg28)))) ~^ $signed((~^wire27[(4'h8):(1'h0)])));
  assign wire32 = wire19;
  assign wire33 = $unsigned({(reg29[(2'h2):(2'h2)] ?
                          $signed(((8'hbe) << wire24)) : (wire24 <<< wire27)),
                      (((~reg28) ~^ reg28[(3'h7):(1'h1)]) ?
                          ({wire19, wire19} * {wire19}) : ($unsigned(wire24) ?
                              ((8'hb6) >>> (8'haa)) : wire30[(3'h7):(3'h5)]))});
  assign wire34 = (((~wire24[(4'h8):(4'h8)]) ? wire26 : (|wire20)) ?
                      wire21[(1'h0):(1'h0)] : $signed($unsigned(wire21[(3'h4):(1'h0)])));
  assign wire35 = ((-($unsigned((wire23 ? wire31 : (7'h44))) ?
                          $unsigned(wire21) : (reg29 ~^ ((8'hb1) ?
                              wire33 : wire26)))) ?
                      $signed($unsigned({wire24[(1'h1):(1'h1)]})) : wire18);
  assign wire36 = (8'hb2);
  assign wire37 = {(8'ha5), wire21};
  assign wire38 = ({(wire21[(4'hc):(4'h8)] || wire30)} ?
                      {$signed({wire26[(3'h6):(1'h1)],
                              (|(7'h40))})} : {($unsigned($unsigned(wire24)) >> (~(~^(8'hbe))))});
  assign wire39 = (~$unsigned(reg29));
  assign wire40 = (-$signed($signed((7'h40))));
  assign wire41 = (reg28 | wire31);
  always
    @(posedge clk) begin
      reg42 <= ($unsigned(({$signed(wire27)} == wire32)) >> (8'hb6));
      reg43 <= ($unsigned(wire38) ?
          $signed($unsigned(((wire35 && wire35) || (reg42 ?
              (8'hb5) : wire27)))) : wire39);
      reg44 <= $unsigned({$signed($signed((|wire34))),
          ($unsigned($signed((8'hab))) ~^ (^~$unsigned((8'hab))))});
    end
  assign wire45 = wire33[(4'hb):(4'hb)];
endmodule
