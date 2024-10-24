module top
#(parameter param24 = ({(((~|(8'h9c)) ? (~^(7'h44)) : ((8'ha4) ? (8'hbf) : (8'hb9))) ? (((8'haa) * (8'ha3)) ^ (~(8'had))) : (~(~&(7'h41)))), {((8'hac) ^~ (|(8'ha1))), {(|(8'h9e))}}} ? ({(~&((8'ha1) >= (7'h43)))} ? (~|{(^~(8'hbd)), (+(8'hb8))}) : ((~^((8'ha4) & (8'hb0))) <= ({(8'ha5), (7'h44)} ? ((7'h43) ? (8'hb4) : (8'hb4)) : ((8'ha2) != (8'ha4))))) : ((((!(8'haf)) ? ((8'h9d) ? (7'h41) : (7'h43)) : ((8'hb5) <= (8'h9c))) ? (~|((8'hb8) ? (8'hb7) : (7'h44))) : (8'hb7)) ? ((^(~^(8'hbb))) ^~ ((~(8'hb0)) ? (~&(8'h9f)) : ((7'h40) + (8'h9f)))) : ((^{(8'had)}) ? (~&(+(8'hba))) : ({(8'h9c)} ? ((8'hb2) ? (8'hbd) : (8'hbd)) : ((8'hae) ? (8'ha8) : (8'hac)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($signed($unsigned({wire1})) ^~ (((8'had) ?
              wire3 : wire4[(2'h3):(1'h1)]) ?
          wire1[(1'h1):(1'h0)] : (~^((+wire3) ?
              (8'hb2) : (wire4 ? wire0 : wire0)))));
    end
  assign wire6 = {(&$signed((((8'hbe) ? wire2 : wire3) ?
                         (wire1 ^ wire4) : $unsigned(wire0))))};
  assign wire7 = (reg5 ?
                     (reg5 >> wire4[(3'h4):(2'h3)]) : (wire2[(5'h10):(3'h4)] ?
                         wire3[(4'he):(4'hc)] : (-(wire4[(3'h4):(2'h3)] >>> $signed(reg5)))));
  assign wire8 = $signed(({wire3[(4'h9):(4'h9)]} ?
                     ($signed((|wire7)) ?
                         $unsigned((wire1 * wire0)) : ($signed(reg5) + $signed(wire3))) : $signed($unsigned((8'ha4)))));
  assign wire9 = (|wire3);
  assign wire10 = wire6[(3'h7):(3'h4)];
  assign wire11 = $signed($signed(($signed((wire0 < wire1)) ?
                      ((wire3 ? wire10 : (8'h9e)) ?
                          wire9 : wire1[(1'h0):(1'h0)]) : wire0)));
  assign wire12 = reg5[(4'h8):(2'h3)];
  assign wire13 = ($signed(wire7[(3'h7):(3'h4)]) != (!(($signed(wire9) | (wire3 ?
                          wire11 : (8'hac))) ?
                      (-(wire11 >> wire1)) : {wire2, $unsigned(wire11)})));
  assign wire14 = wire3;
  assign wire15 = (+wire6);
  assign wire16 = wire11[(4'he):(2'h2)];
  always
    @(posedge clk) begin
      reg17 <= ({(8'h9c),
          (|((wire6 && (7'h40)) ?
              ((8'haa) ?
                  wire0 : wire3) : wire14[(1'h0):(1'h0)]))} - (^~$unsigned((~|(reg5 == wire4)))));
      reg18 <= ($signed({wire11[(3'h4):(2'h3)],
              {wire8[(1'h1):(1'h1)], $signed(wire16)}}) ?
          $signed(wire9) : wire3);
      reg19 <= wire10;
      reg20 <= $signed(reg17[(2'h2):(1'h0)]);
      reg21 <= $signed($unsigned($unsigned($signed($signed(wire2)))));
    end
  assign wire22 = wire14[(2'h2):(2'h2)];
  assign wire23 = (reg5[(4'hd):(2'h3)] <= $signed($signed($unsigned(wire3))));
endmodule
