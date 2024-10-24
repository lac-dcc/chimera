module top
#(parameter param49 = (-((!{{(8'hb2), (7'h44)}}) >> ((&((8'ha2) ? (8'hba) : (8'hab))) << (((8'hbb) ? (7'h41) : (8'hb0)) > ((8'haa) == (8'h9d)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire44;
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire48, wire47, wire46, wire7, wire8, wire44, reg5, reg6, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (8'hb6);
      reg6 <= ((^~$signed(((!(8'ha2)) > (wire4 ~^ wire0)))) ?
          (|$signed((8'haa))) : $unsigned({(8'ha0), $signed(reg5)}));
    end
  assign wire7 = $signed(reg5[(3'h6):(2'h2)]);
  assign wire8 = ($unsigned((+$signed($signed(wire2)))) ?
                     reg6 : (wire2 << $signed($unsigned((!wire0)))));
  module9 #() modinst45 (.wire11(reg6), .wire13(wire0), .wire12(wire2), .clk(clk), .wire10(wire3), .y(wire44));
  assign wire46 = $signed({$signed($unsigned((^~reg6))),
                      $unsigned($unsigned((wire1 ? reg6 : wire7)))});
  assign wire47 = (^~(($signed($signed((7'h43))) - ((wire44 ? wire3 : wire44) ?
                      (&wire46) : (wire3 ^~ reg6))) ^~ ($signed(wire44[(3'h6):(1'h1)]) > $unsigned((wire4 ?
                      wire44 : reg5)))));
  assign wire48 = (wire4[(3'h7):(3'h4)] * ($signed(wire0[(3'h7):(3'h4)]) ?
                      $unsigned(($unsigned(wire47) < wire47[(1'h1):(1'h0)])) : wire1));
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  assign y = {wire42, wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = $unsigned((~wire11));
  assign wire15 = ((^{({(8'hab), (8'hac)} ?
                              ((8'haa) ?
                                  wire13 : wire10) : wire10[(1'h0):(1'h0)])}) ?
                      $unsigned(wire12[(4'hc):(3'h4)]) : $signed((($unsigned(wire13) ?
                              wire14[(5'h13):(4'he)] : (^wire13)) ?
                          (!wire14[(4'hb):(1'h1)]) : ($unsigned(wire14) >> $signed(wire14)))));
  assign wire16 = wire11;
  assign wire17 = (($unsigned($signed((~wire12))) || (wire12[(3'h7):(3'h5)] ?
                          (wire12[(1'h0):(1'h0)] ?
                              wire11 : (wire14 ^~ wire14)) : {wire15})) ?
                      {wire13, wire13[(4'hf):(4'h8)]} : $signed(wire13));
  module18 #() modinst43 (wire42, clk, wire15, wire17, wire12, wire10);
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire signed [(4'h9):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire [(4'hb):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
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
                 (1'h0)};
  assign wire23 = $signed(wire21[(2'h2):(1'h0)]);
  assign wire24 = ($signed((wire19 ? $signed($signed(wire19)) : wire20)) ?
                      (wire20 | $unsigned(((!wire23) ?
                          (wire21 && wire20) : (+wire20)))) : wire23);
  assign wire25 = (~&wire22);
  assign wire26 = (^~wire25);
  assign wire27 = {(&(($signed(wire21) ? wire25 : wire21[(3'h7):(1'h1)]) ?
                          wire24 : (^wire25[(3'h5):(3'h4)]))),
                      ($unsigned({(7'h42),
                          (^~wire25)}) | (wire23[(1'h1):(1'h0)] && {(wire21 + wire20)}))};
  assign wire28 = wire21[(3'h6):(2'h3)];
  assign wire29 = wire28[(4'hc):(3'h6)];
  assign wire30 = (8'hac);
  assign wire31 = ((^~wire21) & $unsigned(($unsigned(wire22[(3'h6):(1'h0)]) ?
                      $unsigned((~^wire29)) : $unsigned((wire21 ?
                          wire21 : wire27)))));
  always
    @(posedge clk) begin
      reg32 <= $signed($unsigned((($unsigned(wire26) ?
              wire22 : (wire29 ? wire19 : (8'ha5))) ?
          (wire23 ?
              wire20[(3'h4):(1'h1)] : $unsigned(wire20)) : (^~{wire22}))));
      if (((wire28 ?
          (wire28[(4'ha):(3'h4)] << $signed((reg32 & reg32))) : {(^~$unsigned(wire21))}) != {$signed(wire25)}))
        begin
          if (wire23[(4'h9):(2'h3)])
            begin
              reg33 <= $signed(((7'h42) ?
                  {($unsigned(wire20) ? (wire23 >>> wire21) : reg32),
                      (wire31 << (wire31 <<< (8'ha0)))} : $signed((wire20 ?
                      $unsigned(wire27) : (reg32 ^~ wire29)))));
            end
          else
            begin
              reg33 <= (wire23[(2'h2):(1'h0)] ?
                  $signed(reg33) : reg32[(2'h2):(1'h1)]);
              reg34 <= (wire19[(2'h2):(2'h2)] <<< ($signed($unsigned(((8'hbd) + wire19))) | (wire30 >> ({(8'haa),
                  wire30} != wire20[(4'h8):(3'h4)]))));
              reg35 <= (-(wire29 ?
                  $unsigned($signed((8'ha5))) : wire24[(4'h9):(2'h2)]));
              reg36 <= (wire24 >>> wire25[(4'hc):(2'h3)]);
            end
          reg37 <= wire21[(3'h6):(2'h2)];
          reg38 <= (($signed($signed((reg37 ?
              (7'h43) : (8'hb8)))) ^~ $signed($signed(wire20))) - $signed((^~(8'haf))));
          reg39 <= wire30[(4'h9):(2'h3)];
          reg40 <= reg36[(2'h2):(2'h2)];
        end
      else
        begin
          if (wire30[(3'h5):(3'h4)])
            begin
              reg33 <= reg35[(5'h11):(4'h8)];
              reg34 <= {($signed((reg33 <<< $unsigned(wire21))) && ($unsigned($unsigned(wire19)) ?
                      ((reg35 ?
                          wire25 : (8'ha0)) + $signed(wire19)) : $signed($unsigned(reg38)))),
                  reg37[(4'hb):(3'h6)]};
              reg35 <= (((~&((wire20 ? wire29 : (8'hb0)) != (!reg39))) ?
                      wire30[(4'h8):(3'h5)] : ((-reg40[(4'h8):(1'h0)]) + (&$signed(wire26)))) ?
                  $unsigned((wire27 * wire24)) : (~$unsigned((|$signed(wire30)))));
            end
          else
            begin
              reg33 <= (8'haa);
            end
          reg36 <= ((($signed($unsigned((8'ha1))) ?
              (-(reg37 >= wire19)) : (reg34 | $unsigned(wire30))) < ((wire27[(3'h5):(3'h4)] & (wire27 ?
                  (8'hbd) : reg39)) ?
              wire24[(2'h2):(1'h0)] : (reg35 ?
                  reg38[(1'h0):(1'h0)] : (wire20 ?
                      reg38 : reg36)))) && $unsigned((+wire24)));
          reg37 <= wire25[(4'hf):(4'he)];
        end
      reg41 <= $unsigned(((+{reg40[(4'hc):(2'h2)], wire29}) && {reg34}));
    end
endmodule
