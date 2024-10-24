module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire18,
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
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(($signed(wire1) ?
          (($signed(wire4) | (7'h41)) <= {(wire1 ? wire1 : wire4),
              (wire1 ?
                  wire1 : wire1)}) : (^~($unsigned(wire1) || (wire1 - (8'h9e))))));
      reg6 <= (((8'hb4) < (+wire1[(4'hb):(4'h9)])) * (wire1 >> ($signed((wire2 ?
          reg5 : wire4)) >>> wire3[(2'h3):(2'h2)])));
    end
  assign wire7 = $unsigned(wire3[(5'h12):(3'h7)]);
  assign wire8 = {wire2,
                     (wire2[(3'h5):(2'h3)] >> $signed((~^(reg6 ^~ wire1))))};
  assign wire9 = ({((7'h40) ? reg6 : (&$unsigned(wire7)))} ?
                     ($unsigned((~^(wire4 ?
                         wire8 : (7'h44)))) ~^ $unsigned(wire3[(4'he):(4'ha)])) : reg5[(4'ha):(4'h9)]);
  assign wire10 = (wire9[(3'h6):(2'h3)] ? (~|reg5) : wire9);
  assign wire11 = ((+(~^(~^$unsigned(wire8)))) ?
                      $unsigned({({(8'hb5), (8'hb8)} ?
                              wire9 : $signed(wire10))}) : ((&{((8'hbc) ~^ wire1)}) >> (!wire10[(3'h6):(3'h6)])));
  assign wire12 = (((wire7[(4'h9):(4'h8)] & $signed(wire3[(5'h10):(4'hc)])) ?
                      (8'hb0) : ($signed(((7'h43) ?
                          (8'hb7) : wire9)) || wire9)) ^~ $unsigned(((wire8[(2'h3):(1'h1)] <= (^wire8)) ?
                      (^(wire1 ^~ wire3)) : ($signed(wire1) ?
                          $signed((8'hb2)) : $signed(wire9)))));
  assign wire13 = ({$signed((~&$signed(reg6))),
                      wire11[(1'h0):(1'h0)]} && (-(reg6[(3'h7):(3'h6)] ?
                      ($signed(wire11) ?
                          $signed(wire3) : wire9[(3'h7):(1'h1)]) : (wire10[(3'h4):(1'h0)] <<< (~^wire8)))));
  assign wire14 = ($signed((|(^~wire11[(3'h7):(3'h5)]))) + wire0[(2'h3):(2'h2)]);
  assign wire15 = {(&$unsigned($unsigned($signed(wire9))))};
  assign wire16 = wire12;
  assign wire17 = wire12[(3'h7):(3'h6)];
  assign wire18 = $signed(({(^$signed((8'hb2))),
                      (wire9[(3'h6):(2'h2)] <= $unsigned(wire3))} >> (wire9[(4'he):(3'h5)] ?
                      ($unsigned(reg5) ?
                          wire1 : $signed(wire4)) : $signed($signed((7'h43))))));
endmodule
