module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire41;
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire15,
                 wire20,
                 wire41,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = ({({(wire4 ^ wire3), (wire0 ? wire0 : wire2)} ?
                         wire0[(3'h5):(2'h2)] : $signed($signed(wire4))),
                     wire2[(1'h1):(1'h0)]} >= ((~|($unsigned(wire2) ^ wire3)) ~^ (((wire4 ^ wire2) >= (wire1 ?
                         wire3 : wire3)) ?
                     wire0 : $signed(((8'ha5) ? wire3 : (8'ha6))))));
  assign wire6 = $unsigned(((^~$unsigned($signed(wire5))) | wire2));
  assign wire7 = wire5[(4'hd):(2'h2)];
  assign wire8 = wire6[(2'h3):(1'h0)];
  assign wire9 = wire0[(3'h5):(2'h3)];
  assign wire10 = $unsigned($unsigned({wire1[(1'h0):(1'h0)]}));
  assign wire11 = $unsigned((($signed(wire1) >> $signed(wire1[(4'h9):(1'h0)])) ?
                      ($unsigned((wire2 >>> wire8)) + $signed((^wire2))) : wire9));
  assign wire12 = (!$signed(wire7[(4'h9):(3'h6)]));
  always
    @(posedge clk) begin
      reg13 <= wire5;
      reg14 <= $signed(($unsigned((wire6[(3'h5):(3'h5)] ? wire9 : (~&wire10))) ?
          wire5[(3'h5):(2'h3)] : $signed(((+wire2) != wire3))));
    end
  assign wire15 = $signed($signed(({wire11[(4'he):(1'h0)]} ?
                      $unsigned((wire12 ?
                          wire6 : reg13)) : (~((8'hab) - wire3)))));
  always
    @(posedge clk) begin
      reg16 <= (|((((-wire12) ? wire8[(3'h7):(2'h2)] : wire8[(4'ha):(4'h9)]) ?
          (wire11 >= wire4[(1'h0):(1'h0)]) : $unsigned({(8'hb8)})) ^~ $signed(({wire2,
              wire12} ?
          {wire5, wire9} : (!wire8)))));
      reg17 <= $unsigned((reg16 ?
          $unsigned(wire15[(2'h3):(2'h3)]) : (|(wire11 ?
              (wire0 * wire1) : wire6))));
      reg18 <= ($unsigned(reg13) ?
          ((~|wire8) * (~(~^{wire11}))) : ($signed(wire4) & {((&wire4) ?
                  $signed(reg17) : (wire2 ? (8'hb0) : wire11))}));
      reg19 <= $unsigned({$unsigned({(^wire5)}),
          $unsigned(($signed(wire2) ?
              (wire15 + wire12) : wire15[(1'h0):(1'h0)]))});
    end
  assign wire20 = wire1[(4'hc):(3'h5)];
  module21 #() modinst42 (wire41, clk, reg19, wire20, reg18, wire6, wire9);
endmodule

module module21
#(parameter param40 = ((((((8'h9e) ^ (8'hbd)) ? ((8'hab) ^ (8'hbe)) : (~|(7'h41))) ? (8'ha5) : (^~((8'ha7) ? (8'hac) : (8'hb0)))) + ((~(7'h44)) || ({(8'hb0)} ? (^(8'hb6)) : {(8'hb3), (8'ha1)}))) << (^(+{((8'h9d) ? (8'ha1) : (8'hbb))}))))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire26;
  input wire signed [(4'ha):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(4'h9):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire31;
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 wire31,
                 reg35,
                 reg33,
                 reg32,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg27 <= wire24;
      reg28 <= wire24[(3'h6):(2'h2)];
      reg29 <= (($unsigned($unsigned($unsigned(wire22))) <<< (wire24[(3'h6):(1'h1)] + $signed((!wire22)))) || $unsigned($signed((|$unsigned(wire26)))));
      reg30 <= {(({(wire24 ?
                  (8'ha4) : (7'h43))} ^ $unsigned((reg29 <= reg29))) && $signed(reg29)),
          (8'hb1)};
    end
  assign wire31 = wire24;
  always
    @(posedge clk) begin
      reg32 <= wire24[(1'h0):(1'h0)];
      reg33 <= $unsigned(reg32[(4'ha):(4'h8)]);
    end
  assign wire34 = {((8'ha9) ?
                          (reg33[(2'h3):(2'h2)] >>> (7'h44)) : $unsigned(wire24[(4'h9):(1'h0)]))};
  always
    @(posedge clk) begin
      reg35 <= (8'hb5);
    end
  assign wire36 = reg27;
  assign wire37 = (((+((wire23 ? reg35 : reg29) ? reg32 : {wire24, (8'ha0)})) ?
                      $unsigned($signed(wire22[(2'h3):(1'h0)])) : $signed($signed(wire31))) | ({($signed((8'hbc)) >>> (~wire34)),
                          reg29} ?
                      ((-(wire31 * wire34)) | reg28) : (~|(reg35[(3'h5):(3'h4)] ?
                          wire25 : (wire26 >= wire25)))));
  assign wire38 = (reg33[(3'h4):(2'h3)] || wire31[(1'h1):(1'h1)]);
  assign wire39 = wire25[(3'h5):(3'h4)];
endmodule
