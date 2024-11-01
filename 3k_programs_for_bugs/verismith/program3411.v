module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire31;
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire5,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire31,
                 reg6,
                 (1'h0)};
  assign wire5 = {wire4[(1'h1):(1'h0)]};
  always
    @(posedge clk) begin
      reg6 <= {($signed((^$signed(wire2))) << $signed((^(-wire0)))),
          (-(&(wire5[(4'h9):(3'h6)] ? $signed(wire4) : wire1)))};
    end
  assign wire7 = {$unsigned($signed((wire0[(3'h4):(2'h2)] ?
                         wire3 : $unsigned(wire4))))};
  assign wire8 = $signed(wire5[(3'h5):(3'h4)]);
  assign wire9 = $signed($unsigned($signed($unsigned(((8'h9f) ?
                     wire0 : reg6)))));
  assign wire10 = $signed((~^$unsigned((&$signed(wire3)))));
  assign wire11 = wire0[(4'hc):(3'h6)];
  module12 #() modinst32 (wire31, clk, wire1, wire2, wire9, wire10, wire11);
  assign wire33 = wire9[(5'h13):(1'h0)];
  assign wire34 = {wire1[(1'h0):(1'h0)],
                      (((!(wire4 + wire2)) ^ $signed((8'ha0))) << ({wire33[(5'h11):(3'h6)],
                              (wire9 ? wire33 : wire8)} ?
                          $unsigned((~^wire10)) : wire10[(3'h5):(1'h0)]))};
  assign wire35 = wire4[(1'h1):(1'h0)];
  assign wire36 = (wire3[(4'ha):(4'ha)] & (+$unsigned((wire1[(2'h3):(2'h2)] >>> (wire4 > (8'hbc))))));
  assign wire37 = {wire2};
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire18;
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire18,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = (({({(8'ha5),
                          wire17} ^ ((8'haa) & wire14))} & (-wire14)) + wire15);
  always
    @(posedge clk) begin
      if (wire17)
        begin
          reg19 <= $signed($unsigned(wire18));
          reg20 <= (wire18[(3'h4):(1'h1)] ?
              $unsigned((wire17 ?
                  reg19 : (reg19 ?
                      $signed(wire17) : $unsigned(wire15)))) : ((reg19 - (~wire18[(2'h3):(2'h2)])) << ((+(+(8'hb6))) ?
                  (~&{(8'h9e), wire15}) : ((wire18 ? wire14 : wire18) ?
                      wire16 : $unsigned((8'hb0))))));
          reg21 <= wire14[(3'h7):(2'h3)];
          reg22 <= {(($unsigned(((8'hb6) ? wire18 : reg21)) ?
                  (~$unsigned((7'h44))) : ((reg21 ~^ wire16) || (wire13 ?
                      wire17 : wire15))) ^ (~$signed($unsigned((8'hb9)))))};
        end
      else
        begin
          reg19 <= wire18;
          reg20 <= reg22;
          if ((~^wire18))
            begin
              reg21 <= (~^wire15);
              reg22 <= ((~&{(wire17[(4'h9):(1'h1)] ?
                          (reg21 ? reg22 : wire14) : {reg22, (8'hb7)}),
                      {{wire18, wire18}}}) ?
                  ((~$unsigned({reg21,
                      (8'ha1)})) ~^ $signed($signed((8'hb4)))) : (+wire15));
            end
          else
            begin
              reg21 <= $unsigned((((^~$unsigned(reg21)) ^ $signed(wire14[(5'h12):(3'h4)])) ?
                  $unsigned({(wire17 ?
                          (8'hb0) : reg22)}) : $unsigned(($signed(wire17) ^ $signed((8'hbf))))));
              reg22 <= ((reg21[(4'hd):(4'h8)] ^ {wire13,
                  ($signed(wire15) >= wire13[(3'h5):(3'h5)])}) >>> $unsigned(reg19));
              reg23 <= $unsigned((wire17 ?
                  wire17 : ((8'hb1) == (&((8'h9f) ? wire15 : reg19)))));
            end
          if ($unsigned(reg23))
            begin
              reg24 <= $signed(wire18[(1'h1):(1'h1)]);
              reg25 <= reg20;
              reg26 <= {$signed(reg23),
                  ({(8'ha5),
                      ((wire18 ~^ wire17) ?
                          (reg23 ?
                              (8'haf) : reg23) : $unsigned(wire18))} >= ((8'hbf) ?
                      reg25 : reg22[(3'h7):(2'h3)]))};
              reg27 <= reg23[(3'h4):(1'h0)];
            end
          else
            begin
              reg24 <= (8'hb1);
              reg25 <= reg19;
            end
        end
      reg28 <= (8'h9e);
    end
  assign wire29 = (($signed($unsigned($signed((7'h44)))) ?
                          $unsigned(reg22) : reg25) ?
                      ($unsigned(wire13) != reg19[(3'h4):(1'h1)]) : (({(!reg25),
                              reg21} ?
                          (^reg20) : (((7'h41) ?
                              reg28 : (8'ha6)) != (~^reg20))) & $unsigned($unsigned({(8'hbe)}))));
  assign wire30 = reg22;
endmodule
