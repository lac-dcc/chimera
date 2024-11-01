module top
#(parameter param66 = (^(((+{(8'hb4)}) ^ (8'hb2)) >= (~^(((8'hb2) == (8'ha7)) & {(8'hb2), (8'hac)})))), 
parameter param67 = (((~|{(param66 ? param66 : (8'hb0)), (~^param66)}) ? ((param66 > (-param66)) << (^((8'hac) ? param66 : param66))) : (8'ha2)) ? (((((8'hba) ? param66 : param66) >>> (~&param66)) || param66) ? (~&((~^param66) || (param66 - param66))) : (|((param66 * (8'hac)) ^~ (-param66)))) : (param66 ? (((|(8'hb0)) ? (|param66) : (~&param66)) <<< (param66 ? (&(8'hae)) : ((8'ha5) ? param66 : param66))) : (+({(7'h42), param66} ? param66 : (param66 <<< param66))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire65,
                 wire63,
                 wire16,
                 wire15,
                 wire14,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = {wire2, (~&(wire0 || $unsigned(wire3[(3'h7):(1'h1)])))};
  assign wire6 = ($signed($signed($unsigned(wire1[(3'h6):(2'h2)]))) << (~&wire3[(3'h5):(2'h3)]));
  always
    @(posedge clk) begin
      if ($signed(($unsigned((wire6 ~^ wire1)) << ($signed($signed(wire3)) ?
          (wire2[(2'h3):(2'h3)] ?
              {(8'hb5), wire3} : ((7'h41) ?
                  wire4 : wire3)) : ($unsigned(wire5) ?
              wire1[(2'h2):(1'h0)] : $unsigned(wire2))))))
        begin
          reg7 <= wire1;
          if (reg7)
            begin
              reg8 <= (|$unsigned($unsigned((wire5 >> ((8'ha9) ^~ wire0)))));
              reg9 <= ($signed($signed(({wire1} != (wire0 < wire1)))) <= {wire2[(4'hb):(2'h3)],
                  ($unsigned((^~wire2)) ? wire1 : $signed($signed((8'hb9))))});
              reg10 <= reg9;
              reg11 <= $signed((~(^~$unsigned({wire6}))));
            end
          else
            begin
              reg8 <= ($unsigned($signed($signed(wire5[(2'h2):(2'h2)]))) ?
                  reg9[(3'h6):(3'h6)] : $signed(wire0));
              reg9 <= (|reg9[(4'h9):(4'h9)]);
              reg10 <= wire6;
            end
        end
      else
        begin
          if (wire0)
            begin
              reg7 <= ((8'hb1) ?
                  $unsigned((wire0[(3'h6):(3'h4)] ?
                      ($signed((8'ha8)) ?
                          reg9 : reg11[(1'h0):(1'h0)]) : $unsigned($unsigned(reg9)))) : ($unsigned((!(8'hbe))) ?
                      (({wire3} < (7'h41)) > $signed((wire1 ?
                          reg11 : reg11))) : (wire6 ?
                          ({reg7} ?
                              (wire2 ? wire3 : wire4) : ((8'hba) ?
                                  wire5 : wire1)) : (~((8'hb9) != wire5)))));
              reg8 <= (+$unsigned($unsigned((wire2 ?
                  (|wire0) : $unsigned(reg10)))));
              reg9 <= (wire3[(1'h1):(1'h1)] <<< $unsigned(wire1));
              reg10 <= ((wire5 - ((8'ha3) * (~|wire1))) ?
                  (&({(reg8 >> (8'hbc)), reg10} ?
                      $unsigned((~^reg9)) : wire6)) : (|(~$unsigned(((8'hb8) ?
                      (8'ha1) : wire5)))));
            end
          else
            begin
              reg7 <= {($signed($unsigned((wire3 > wire5))) != (^~wire4[(1'h0):(1'h0)]))};
              reg8 <= (~&({$unsigned(wire2[(3'h5):(2'h2)]),
                  ({(8'h9c)} < $signed(wire4))} >>> (|((reg10 < reg11) ?
                  (-reg8) : reg11[(2'h3):(1'h1)]))));
            end
          reg11 <= ($signed((($signed((7'h41)) >= (7'h44)) & {$unsigned((8'hb9))})) ?
              ($signed((+$unsigned(wire4))) ^ $signed(wire5)) : ((8'hb7) >>> ((^~$unsigned(wire5)) ?
                  $unsigned($unsigned(wire3)) : ($signed((8'hab)) ?
                      (wire0 ? reg10 : (8'ha0)) : (wire2 ? (7'h43) : wire2)))));
          reg12 <= $unsigned($signed(reg7));
          reg13 <= $unsigned(reg11);
        end
    end
  assign wire14 = (~^(~wire2));
  assign wire15 = (+(~($unsigned($signed(reg7)) ^ (^$signed(wire5)))));
  assign wire16 = {$signed((-$signed((wire6 ? wire4 : reg12)))), (8'hbb)};
  module17 #() modinst64 (wire63, clk, reg12, wire2, reg9, wire3);
  assign wire65 = $signed(reg12);
endmodule

module module17
#(parameter param62 = {(~(({(8'hae), (8'hb1)} == ((8'haa) ? (8'hb9) : (8'hb8))) ^~ (((8'hab) ? (8'hb4) : (8'ha7)) ? {(8'haa)} : ((7'h40) < (8'hb0))))), ((((~|(8'h9e)) > (~|(7'h43))) != (((7'h42) + (8'hbe)) <= ((8'hb2) - (8'hac)))) <= ((((8'h9f) == (8'ha6)) ^~ (~&(8'hbd))) & {(^~(7'h42)), ((8'ha0) ? (8'hbc) : (8'hbb))}))})
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(3'h6):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire58;
  assign y = {wire61, wire60, wire42, wire22, wire44, wire45, wire58, (1'h0)};
  assign wire22 = wire18[(4'hc):(4'ha)];
  module23 #() modinst43 (wire42, clk, wire22, wire18, wire21, wire19, wire20);
  assign wire44 = $signed(wire42[(4'hb):(3'h7)]);
  assign wire45 = (($unsigned($signed(wire20)) ?
                          (wire19 <= wire42[(4'ha):(3'h6)]) : {($unsigned((8'haf)) ?
                                  $unsigned(wire21) : $unsigned(wire20)),
                              wire18}) ?
                      (wire42 ?
                          wire44[(2'h3):(2'h3)] : {$signed((wire20 > wire42)),
                              $unsigned($signed(wire18))}) : (wire44[(4'hf):(4'hf)] ?
                          wire20 : (^(~&(wire44 ^ wire21)))));
  module46 #() modinst59 (.clk(clk), .y(wire58), .wire51(wire19), .wire48(wire22), .wire50(wire45), .wire49(wire44), .wire47(wire42));
  assign wire60 = ($unsigned(((-{wire21}) ?
                      (~|(wire44 - wire20)) : (&wire42[(4'h9):(2'h3)]))) != (&wire18[(4'hb):(2'h3)]));
  assign wire61 = {(8'hb2)};
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire51;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire49;
  input wire [(4'h8):(1'h0)] wire48;
  input wire signed [(4'h8):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  assign y = {wire57, wire56, wire55, wire54, wire53, wire52, (1'h0)};
  assign wire52 = $signed(wire50);
  assign wire53 = ($signed($signed((~^$signed(wire52)))) >> $signed((wire48 | (wire51 ?
                      (wire48 ? (8'hab) : wire48) : (wire51 ?
                          wire47 : wire51)))));
  assign wire54 = $signed((({wire52[(3'h4):(1'h0)],
                          (wire51 >= wire48)} <= (wire50 < (wire47 >> wire53))) ?
                      $signed((-wire52[(3'h4):(2'h3)])) : {$signed((wire49 >> (7'h44)))}));
  assign wire55 = (8'ha4);
  assign wire56 = $signed(wire48[(3'h4):(1'h0)]);
  assign wire57 = $signed($signed($signed((+wire51[(3'h4):(1'h1)]))));
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire28;
  input wire [(4'he):(1'h0)] wire27;
  input wire signed [(4'h9):(1'h0)] wire26;
  input wire [(5'h14):(1'h0)] wire25;
  input wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire31,
                 wire30,
                 wire29,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire29 = (wire28 | wire24);
  assign wire30 = $unsigned(wire26);
  assign wire31 = ({$signed({(wire30 <= wire25)})} >= wire30);
  always
    @(posedge clk) begin
      reg32 <= (|wire29[(3'h4):(1'h1)]);
      reg33 <= (8'h9f);
      reg34 <= $signed(wire31[(2'h2):(1'h0)]);
      reg35 <= $signed((wire25[(3'h7):(3'h6)] ?
          {((wire31 - wire31) ^ (|wire31)),
              (~&(+(7'h43)))} : $signed(wire30[(3'h5):(3'h5)])));
    end
  assign wire36 = $unsigned((&(wire31[(1'h1):(1'h1)] | wire29)));
  assign wire37 = $signed(((((wire24 ? wire27 : wire24) << $unsigned(reg35)) ?
                      (~|$unsigned(reg33)) : wire29) || wire26[(3'h6):(3'h6)]));
  assign wire38 = $unsigned($unsigned($signed(wire30)));
  assign wire39 = $signed(((($signed(wire26) ?
                              $signed(wire27) : (wire38 <<< wire26)) ?
                          {$signed((8'ha4))} : wire24[(1'h0):(1'h0)]) ?
                      wire29[(4'h9):(1'h0)] : ((^~reg33[(4'hd):(4'ha)]) ?
                          ($unsigned(reg33) ?
                              (|wire36) : {wire26}) : wire30[(4'hc):(4'h8)])));
  assign wire40 = wire27[(2'h2):(1'h1)];
  assign wire41 = ($unsigned(wire30) ?
                      {wire30,
                          $unsigned(((wire29 <<< (8'haf)) ?
                              (wire36 ?
                                  wire29 : wire29) : $signed(wire39)))} : $unsigned((&(wire39 ?
                          $signed(wire26) : (wire36 ~^ (8'ha5))))));
endmodule
