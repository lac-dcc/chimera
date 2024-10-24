module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire9,
                 wire5,
                 wire4,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ($unsigned($signed((!$unsigned(wire0)))) ?
                     $unsigned({(^~wire0[(3'h4):(3'h4)]),
                         (^~(wire1 ? (8'haf) : (8'had)))}) : wire2);
  assign wire5 = {$unsigned($signed($unsigned(wire3))),
                     (wire1 ?
                         {$signed((~wire2)),
                             $unsigned((wire1 ?
                                 (8'ha9) : wire0))} : $unsigned({(wire4 ?
                                 (8'hb9) : (7'h40))}))};
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire0);
      reg7 <= wire1;
      reg8 <= $unsigned(wire1[(4'hc):(1'h1)]);
    end
  assign wire9 = wire4;
  module10 #() modinst48 (.clk(clk), .wire13(wire3), .y(wire47), .wire11(wire1), .wire14(wire5), .wire12(wire9));
  assign wire49 = $unsigned(wire5);
  assign wire50 = (reg8 > $signed($signed(((~^wire5) ?
                      $signed(wire0) : (wire0 | (8'ha2))))));
  assign wire51 = (+(($unsigned($unsigned(reg8)) ?
                      $unsigned($signed((8'hb7))) : (reg6[(3'h7):(2'h2)] != wire1[(4'ha):(4'h8)])) < reg6));
  assign wire52 = {{((~&(reg8 ? (8'hbb) : (7'h43))) ?
                              ((wire1 ? (8'hb1) : wire2) ?
                                  (8'hb3) : $unsigned(wire47)) : wire51),
                          ($signed($unsigned(wire1)) ?
                              wire50 : $signed($signed(wire3)))},
                      ((~|($unsigned(wire50) ^ ((8'hb3) ? wire4 : wire4))) ?
                          wire51[(1'h1):(1'h0)] : ((~^$unsigned(reg6)) ?
                              {(^~wire2)} : ((wire2 ? reg6 : wire3) ?
                                  $signed(wire1) : wire47)))};
  assign wire53 = (({(wire3[(3'h4):(2'h2)] ?
                              wire52[(1'h0):(1'h0)] : $unsigned(wire5)),
                          $unsigned(wire0)} > $unsigned($unsigned($signed(reg8)))) ?
                      $signed(($signed((reg7 ?
                          wire49 : (8'ha5))) >> ((wire5 * reg7) < wire1[(5'h14):(5'h13)]))) : wire9);
  assign wire54 = ($signed(((~|(&wire5)) + $unsigned((wire5 ?
                      reg7 : reg7)))) ^~ wire9[(3'h5):(3'h5)]);
endmodule

module module10
#(parameter param46 = (-(((((8'hbc) ? (8'ha0) : (8'haa)) ? (~|(8'hbf)) : ((8'hab) && (8'hae))) ? (((8'hb6) < (7'h40)) ? (|(8'h9e)) : (^~(8'hac))) : (8'hba)) >= ((((8'hb3) ? (8'ha6) : (8'hbd)) != (~(8'h9f))) ^~ (((8'ha7) ? (8'hbf) : (8'haf)) ? ((8'hac) ? (7'h43) : (8'had)) : {(7'h40), (8'ha6)})))))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire36;
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  assign y = {wire45,
                 wire38,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire36,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire15 = $signed((8'ha9));
  assign wire16 = $signed((+$unsigned($unsigned($unsigned(wire13)))));
  assign wire17 = wire16[(2'h2):(1'h1)];
  assign wire18 = ($signed(wire15[(3'h6):(3'h4)]) == (~&wire15[(3'h5):(2'h2)]));
  module19 #() modinst37 (.y(wire36), .wire20(wire11), .clk(clk), .wire22(wire13), .wire24(wire14), .wire23(wire15), .wire21(wire17));
  assign wire38 = wire13;
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(($unsigned(wire11) ?
          {(8'haa), wire13} : $signed(wire15)))) + {wire38}))
        begin
          reg39 <= {(wire15[(4'hb):(3'h5)] ?
                  $unsigned((!(wire11 ?
                      wire36 : (8'ha7)))) : (~^(-$signed(wire12))))};
          reg40 <= $signed(((8'hb0) ?
              wire15[(2'h2):(2'h2)] : $unsigned({$unsigned((8'ha4))})));
          reg41 <= wire11[(5'h13):(5'h10)];
          reg42 <= $unsigned((~^wire11));
        end
      else
        begin
          reg39 <= {($unsigned($unsigned((wire13 ?
                  wire38 : (8'hb5)))) << reg42),
              {wire13[(3'h7):(1'h1)],
                  ($unsigned(wire17[(5'h10):(2'h3)]) >> wire15[(3'h6):(3'h5)])}};
          if ($signed(wire15[(1'h0):(1'h0)]))
            begin
              reg40 <= $signed($unsigned($signed((wire38 ?
                  {wire13, reg40} : wire12[(4'hb):(2'h2)]))));
              reg41 <= $signed({(~|$unsigned((reg41 * reg40)))});
            end
          else
            begin
              reg40 <= wire38;
              reg41 <= $signed(wire38[(1'h0):(1'h0)]);
              reg42 <= $signed(($unsigned(wire38[(1'h1):(1'h0)]) ?
                  ((~(reg41 >= wire17)) ?
                      $signed($signed(wire16)) : ($unsigned(wire11) && (wire13 ?
                          wire11 : wire38))) : (wire13[(4'h9):(4'h9)] >>> $unsigned($unsigned(reg41)))));
            end
        end
      reg43 <= (&$signed((~^reg41[(3'h6):(1'h1)])));
      reg44 <= $unsigned($signed($signed((-wire36[(4'ha):(2'h2)]))));
    end
  assign wire45 = wire16;
endmodule

module module19
#(parameter param34 = ((~({((8'haa) == (7'h41))} <<< (((8'hb8) * (8'ha6)) && {(8'hb8), (8'ha2)}))) ? ((~(~^(8'h9e))) ? {{((8'ha0) ? (8'ha4) : (8'ha4)), ((8'h9f) > (8'ha1))}} : (8'ha7)) : (~&((+((8'hbf) ^~ (8'hb1))) + ({(8'hbb), (8'hbd)} ? ((8'hbd) & (8'ha1)) : ((8'hb8) ~^ (8'hb9)))))), 
parameter param35 = (param34 ? (-param34) : param34))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire24;
  input wire [(4'hc):(1'h0)] wire23;
  input wire signed [(4'h9):(1'h0)] wire22;
  input wire [(5'h14):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg25 <= (wire21[(5'h12):(4'he)] + {wire24[(3'h5):(3'h4)],
          (((wire20 ? wire21 : wire21) <<< (wire20 ^~ wire23)) ?
              wire21 : $unsigned((^wire21)))});
      reg26 <= {{reg25[(4'hb):(4'h8)], wire24},
          $signed($unsigned((-(~&reg25))))};
      reg27 <= ({(~|(+(8'ha8))),
          wire22[(2'h3):(2'h3)]} <= wire21[(4'hd):(4'h8)]);
    end
  assign wire28 = (((~^wire21) ?
                          {$unsigned(wire20[(2'h2):(1'h1)])} : ($signed(((8'h9c) ?
                              reg26 : reg27)) ^~ {(wire22 << reg27),
                              (wire21 ? wire24 : wire22)})) ?
                      (reg25 + (8'h9e)) : $signed($signed((~&{wire23,
                          (8'ha1)}))));
  assign wire29 = wire28[(4'h8):(1'h1)];
  assign wire30 = (($signed($unsigned(reg25[(4'hb):(1'h0)])) != (8'had)) == reg27[(4'h8):(1'h0)]);
  assign wire31 = wire21[(2'h3):(2'h2)];
  assign wire32 = wire23;
  assign wire33 = $signed($signed((~wire32[(3'h4):(2'h2)])));
endmodule
