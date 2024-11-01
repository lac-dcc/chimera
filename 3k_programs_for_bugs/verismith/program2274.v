module top
#(parameter param26 = ((((((8'hb4) ? (8'hba) : (8'hb6)) < ((8'h9f) ? (8'ha4) : (8'haa))) ? (8'hb5) : ({(8'ha3)} ? (^(8'ha8)) : (~(8'h9d)))) + {({(8'h9f), (8'ha6)} ^ ((8'had) ? (7'h41) : (8'hbb)))}) || (~|(+(^((8'hab) + (8'hb5)))))), 
parameter param27 = ({({param26, param26} >>> {param26, param26})} * ((^~(&(param26 && param26))) ^~ (|{(param26 ? param26 : param26)}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire25,
                 wire19,
                 wire18,
                 wire17,
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
                 wire5,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed($unsigned({(wire3 ?
                         (wire0 ? wire3 : wire4) : wire2[(4'ha):(4'ha)]),
                     (!$unsigned(wire1))}));
  always
    @(posedge clk) begin
      reg6 <= (wire3[(3'h5):(1'h1)] >= wire0[(2'h3):(2'h3)]);
    end
  assign wire7 = (wire0[(5'h11):(2'h2)] >= wire1);
  assign wire8 = ($signed($signed(wire0[(4'h8):(1'h0)])) ?
                     wire0 : ($unsigned({(8'hb1)}) ?
                         ({(wire1 ?
                                 wire7 : wire3)} | wire0[(5'h11):(4'h8)]) : {wire2}));
  assign wire9 = wire2;
  assign wire10 = ($unsigned(wire1) ?
                      (($signed($signed(wire9)) & {(wire9 | wire4)}) ?
                          {$signed(wire0[(4'ha):(3'h5)])} : (wire2 ?
                              ((wire3 != wire5) < wire4[(3'h4):(3'h4)]) : {wire3})) : ($unsigned(({(8'hae),
                          wire2} - (wire9 > wire3))) >= $signed(wire1[(3'h6):(3'h6)])));
  assign wire11 = wire4;
  assign wire12 = wire8[(3'h5):(1'h0)];
  assign wire13 = wire5[(2'h2):(2'h2)];
  assign wire14 = wire5[(3'h5):(3'h4)];
  assign wire15 = (|{wire2});
  assign wire16 = $signed(($unsigned((wire9 << wire3)) < $unsigned((wire0 ?
                      (wire12 ~^ wire7) : {wire0}))));
  assign wire17 = (wire11[(2'h2):(1'h0)] ?
                      (8'ha0) : ((&$signed(wire12[(2'h3):(2'h2)])) << (((wire10 ?
                              wire15 : wire16) ?
                          $signed(reg6) : (wire3 ? wire13 : wire13)) != {wire15,
                          $signed((8'ha3))})));
  assign wire18 = $unsigned((wire7 ?
                      (($signed((8'ha0)) >> $unsigned(wire13)) << wire2) : (~^{$unsigned(reg6),
                          (~wire5)})));
  assign wire19 = (8'ha8);
  always
    @(posedge clk) begin
      if (wire11)
        begin
          reg20 <= (((-$unsigned(wire14[(4'hb):(4'ha)])) ?
              (7'h44) : ($unsigned($unsigned((7'h40))) ?
                  (8'ha2) : (((8'h9f) ? wire7 : wire13) ?
                      {wire12,
                          wire3} : (wire8 && wire17)))) << {$unsigned((8'hbe)),
              (wire8[(3'h5):(3'h4)] < wire14[(4'hf):(1'h0)])});
          reg21 <= (8'h9d);
          reg22 <= wire11;
          reg23 <= (wire15[(2'h2):(1'h0)] != ((!wire3) ?
              (~|{(^~wire8)}) : $unsigned($signed((~|wire8)))));
          reg24 <= $unsigned(wire11[(4'h9):(3'h6)]);
        end
      else
        begin
          reg20 <= $unsigned((((|reg22[(2'h3):(1'h1)]) ?
              $unsigned({(7'h40)}) : $unsigned(wire4)) << (~&wire18[(3'h5):(1'h0)])));
        end
    end
  assign wire25 = {($unsigned(((~&(8'ha3)) || wire7[(1'h0):(1'h0)])) ?
                          $unsigned(((wire14 ?
                              wire10 : (8'ha5)) == (~^(8'hba)))) : {(wire18 <= $unsigned(wire11)),
                              $signed($unsigned(wire4))}),
                      $unsigned(wire16)};
endmodule
