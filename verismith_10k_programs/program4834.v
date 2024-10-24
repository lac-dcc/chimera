module top
#(parameter param20 = ((+({((8'hba) ? (8'hab) : (8'hbe)), (~|(8'h9e))} ? (~^(^~(8'ha7))) : {((8'hbd) ~^ (8'ha3))})) ? (~|(({(7'h40)} || {(8'hbe), (8'ha6)}) < (((8'h9f) || (8'hb6)) ? {(8'hbc), (7'h40)} : (+(8'h9d))))) : (8'ha8)), 
parameter param21 = {(~^((~^((8'ha3) ? (8'hb5) : param20)) ? (~^(&param20)) : {((8'hb8) <= param20)})), (param20 ? (((7'h40) == (param20 ? param20 : param20)) ? param20 : ((+param20) < param20)) : param20)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = wire3[(4'hf):(4'hb)];
  assign wire5 = $unsigned(wire4);
  assign wire6 = wire1[(5'h11):(5'h11)];
  assign wire7 = ((~|(((wire5 ? wire2 : wire1) << (~wire4)) ?
                         (~((8'hb2) ?
                             wire4 : wire0)) : $unsigned($unsigned(wire3)))) ?
                     {(wire3 >> (~^$unsigned(wire6))),
                         (($unsigned(wire1) ? wire0 : wire4[(1'h0):(1'h0)]) ?
                             (wire0[(4'hc):(2'h2)] ?
                                 (wire3 ^ wire2) : ((8'hbf) >= wire6)) : wire1[(1'h0):(1'h0)])} : $unsigned((wire4 <<< ($unsigned(wire1) >> $signed(wire4)))));
  assign wire8 = (-$signed($signed(wire4)));
  always
    @(posedge clk) begin
      reg9 <= (&(-(^~wire3)));
      if ($unsigned(({wire4[(1'h0):(1'h0)], wire5[(1'h0):(1'h0)]} ?
          $signed(wire7[(3'h4):(1'h0)]) : wire0[(4'ha):(4'h8)])))
        begin
          reg10 <= (8'hbb);
          reg11 <= {(wire8 + $signed($unsigned($unsigned(wire4)))),
              $unsigned((&{(reg10 ? wire1 : wire6)}))};
          reg12 <= ((8'ha4) ?
              (+(wire8[(3'h4):(2'h2)] ^~ reg9)) : {$signed(((reg11 ?
                          wire6 : reg10) ?
                      wire8 : (-wire0))),
                  (8'hae)});
        end
      else
        begin
          reg10 <= ($signed({(~^{wire8}),
              $signed(wire8)}) >> (reg10 >= (&reg9)));
          reg11 <= $unsigned((-$signed($signed(reg9[(1'h0):(1'h0)]))));
        end
      reg13 <= $signed(wire4);
    end
  assign wire14 = ($signed({{wire3[(1'h1):(1'h0)]}}) ?
                      $unsigned(wire7[(1'h0):(1'h0)]) : reg10[(3'h6):(3'h6)]);
  assign wire15 = (-{reg10[(2'h2):(1'h1)], wire14});
  assign wire16 = $signed(wire7);
  assign wire17 = ($unsigned($unsigned((reg13[(4'hd):(3'h4)] ?
                      wire4[(1'h0):(1'h0)] : (8'h9c)))) || (((~|wire0) ?
                      (((8'haa) ? wire8 : reg12) ?
                          $signed(reg10) : (~reg9)) : ((reg11 || wire7) ?
                          wire2[(2'h2):(2'h2)] : (+wire7))) * ($unsigned((wire1 >= wire0)) ?
                      (&{reg10}) : $unsigned((+wire6)))));
  assign wire18 = {(wire4[(1'h1):(1'h0)] ?
                          (((wire1 ?
                              (8'hb0) : reg13) ^ wire1) <= ((wire3 * (8'hb3)) ~^ wire16[(4'hb):(3'h4)])) : (^$signed($unsigned(wire7))))};
  assign wire19 = $signed(($signed((&(wire17 == wire6))) >> ({(wire0 ?
                              wire17 : wire18)} ?
                      (wire7[(3'h4):(1'h0)] << (~^wire0)) : ((wire17 > reg12) || wire8))));
endmodule
