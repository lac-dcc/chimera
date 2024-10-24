module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire51;
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire58, wire57, wire51, reg56, reg55, reg54, reg53, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
    end
  module5 #() modinst52 (wire51, clk, wire3, wire2, reg4, wire0, wire1);
  always
    @(posedge clk) begin
      reg53 <= ($unsigned((!($signed(wire3) ?
              wire2[(2'h2):(1'h1)] : $signed(wire0)))) ?
          $unsigned((-(^~(reg4 ? (8'hbf) : (8'hb8))))) : wire51);
      reg54 <= (~|$unsigned(($signed((wire51 ? wire1 : wire2)) ?
          (~|((8'had) ? wire3 : wire0)) : wire1)));
      reg55 <= wire51[(4'h8):(2'h2)];
      reg56 <= $unsigned(wire1);
    end
  assign wire57 = reg54;
  assign wire58 = wire2[(4'h8):(3'h4)];
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire26;
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire11,
                 wire26,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire11 = $signed(wire8[(1'h0):(1'h0)]);
  module12 #() modinst27 (.wire17(wire11), .wire14(wire10), .wire15(wire9), .wire13(wire8), .wire16(wire7), .clk(clk), .y(wire26));
  always
    @(posedge clk) begin
      reg28 <= wire8[(1'h0):(1'h0)];
      if (($unsigned((((wire9 ? wire8 : wire6) ?
                  $unsigned(wire10) : (reg28 ? wire8 : wire10)) ?
              ($unsigned(wire9) && $unsigned((8'ha9))) : wire26)) ?
          ({(~|wire8), wire26[(1'h1):(1'h0)]} ?
              (~(~^(&wire10))) : wire7) : wire11[(3'h6):(3'h4)]))
        begin
          reg29 <= ($unsigned(wire6) <= {$signed((wire26[(4'h9):(2'h2)] ?
                  (8'hb8) : wire11[(3'h6):(1'h0)])),
              wire26});
          reg30 <= $signed($unsigned(($unsigned((reg28 ?
              wire9 : reg29)) <<< {(^~wire9)})));
          reg31 <= $signed((8'hbb));
          reg32 <= $unsigned({($signed(wire11[(3'h4):(2'h3)]) == {reg28[(3'h5):(2'h3)],
                  (7'h43)})});
          reg33 <= (!$signed($signed(wire8[(4'hc):(3'h6)])));
        end
      else
        begin
          reg29 <= $unsigned((~|$signed((~&reg30[(2'h3):(2'h2)]))));
        end
      reg34 <= wire10[(5'h13):(4'h9)];
      reg35 <= ($unsigned((8'h9d)) < ((($signed(reg34) & $unsigned(wire8)) ?
              {wire6, wire11} : (~$unsigned(reg32))) ?
          $signed(wire26) : reg34[(4'h8):(2'h2)]));
    end
  assign wire36 = (8'ha6);
  assign wire37 = ($unsigned(wire8) ? (&(8'hbe)) : $signed((8'hbd)));
  assign wire38 = $signed((~|$signed(($unsigned((8'h9e)) ^ $signed(reg34)))));
  assign wire39 = reg29;
  assign wire40 = $signed(($unsigned(wire11) ? reg29 : reg32));
  assign wire41 = (reg29 + wire37[(4'he):(3'h7)]);
  assign wire42 = reg35;
  always
    @(posedge clk) begin
      if ((~{wire39, $signed(wire8)}))
        begin
          if ($signed(wire42))
            begin
              reg43 <= reg28;
              reg44 <= $unsigned($unsigned(wire8));
              reg45 <= reg29[(2'h3):(2'h3)];
              reg46 <= $signed((($signed((reg30 == wire11)) ?
                      (~&(~^wire37)) : ($signed((7'h44)) ?
                          wire10[(3'h5):(3'h4)] : (reg31 ? wire8 : wire36))) ?
                  (-(~^$signed(wire9))) : $unsigned((~reg35[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg43 <= (!reg45);
              reg44 <= ((($unsigned(wire6) ?
                      wire6 : {wire41[(3'h7):(3'h4)],
                          (+reg28)}) ^~ ((reg35[(1'h1):(1'h0)] < $signed(wire39)) ?
                      (+$unsigned(wire36)) : $unsigned({reg43, reg34}))) ?
                  (8'hba) : (({wire40} != (~&$unsigned((8'ha3)))) ?
                      (((-wire40) ?
                              (wire37 ? wire7 : wire26) : $signed(reg32)) ?
                          wire26 : wire37[(1'h1):(1'h0)]) : reg46));
            end
        end
      else
        begin
          reg43 <= {wire36,
              (&$signed((reg29[(4'hd):(3'h6)] ? wire39 : (8'hbe))))};
        end
      reg47 <= wire39;
      reg48 <= wire10;
      if ((wire41 ^~ (|($unsigned((!wire7)) ^~ (~$unsigned(wire42))))))
        begin
          reg49 <= $unsigned($signed($unsigned((8'hb4))));
        end
      else
        begin
          reg49 <= $signed((((~&(reg33 ?
              wire39 : (8'hbb))) > $unsigned(wire7)) | reg44));
        end
      reg50 <= wire41[(3'h6):(1'h1)];
    end
endmodule

module module12
#(parameter param24 = ((~^((~&((8'h9d) - (8'hbe))) >= ({(8'hb9), (8'hb8)} < (-(8'hb0))))) ? (8'hb2) : {(8'haf)}), 
parameter param25 = {(((|param24) <= ((param24 >= param24) <<< ((8'hb1) >= param24))) != {(((8'haf) >= (8'hb5)) ? param24 : (~^(8'hb5))), (~^(~^param24))}), param24})
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire18;
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  assign y = {wire23, wire22, wire21, wire18, reg20, reg19, (1'h0)};
  assign wire18 = $unsigned(wire13[(4'hc):(4'h9)]);
  always
    @(posedge clk) begin
      reg19 <= $unsigned((~($signed((wire13 * wire14)) ?
          $signed($unsigned((8'hbd))) : $signed(wire15[(1'h0):(1'h0)]))));
      reg20 <= $unsigned((|reg19[(4'ha):(3'h6)]));
    end
  assign wire21 = (8'hb0);
  assign wire22 = reg20[(1'h1):(1'h0)];
  assign wire23 = $unsigned($signed($signed({wire13})));
endmodule
