module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned((~^($signed(wire2) ?
                     (((7'h44) != wire3) ?
                         ((7'h42) ?
                             wire3 : (8'hba)) : $signed(wire1)) : $signed(wire4))));
  always
    @(posedge clk) begin
      reg6 <= $signed((~|$unsigned(wire5[(2'h2):(2'h2)])));
      reg7 <= $unsigned((-{wire4[(3'h4):(2'h3)],
          (~^(wire5 ? wire2 : (8'hac)))}));
      reg8 <= ((~(((~^reg7) >= wire3[(4'he):(3'h4)]) <= $signed(wire2[(3'h6):(1'h0)]))) <= wire2);
    end
  assign wire9 = ($signed(wire0) ^~ $signed(((wire1[(1'h0):(1'h0)] <= wire3[(2'h2):(1'h1)]) ?
                     $unsigned(wire3[(5'h13):(1'h0)]) : $signed($unsigned(wire1)))));
  assign wire10 = (~&(-(wire0 == $unsigned((wire4 ? (8'hb1) : wire5)))));
  assign wire11 = $signed((~&$unsigned({$signed(wire1)})));
  assign wire12 = $unsigned(wire2[(3'h4):(1'h0)]);
  assign wire13 = {{{$unsigned(((7'h44) ? wire1 : wire0)),
                              {$unsigned(reg6), (~|wire10)}},
                          (8'hb1)}};
  assign wire14 = ($signed((wire11 | $signed($signed(reg6)))) ^~ reg8[(1'h0):(1'h0)]);
  assign wire15 = reg8;
  assign wire16 = (8'ha8);
  assign wire17 = ((~^$unsigned(wire2)) <<< ((~&$signed((^~wire13))) << ($unsigned($signed(wire2)) >= $signed((wire13 != wire5)))));
  always
    @(posedge clk) begin
      reg18 <= (8'hb4);
      reg19 <= (-(|$signed($signed($signed(wire5)))));
      reg20 <= reg19[(2'h2):(1'h0)];
      reg21 <= wire11;
    end
  assign wire22 = reg8;
  assign wire23 = {(({(wire14 >= reg21), {reg18, (8'hb8)}} + (reg20 ?
                              (8'hbc) : $signed(wire12))) ?
                          $unsigned($signed((~|wire22))) : reg6[(3'h4):(1'h1)])};
  assign wire24 = ({(($unsigned(wire22) ?
                          $signed(wire10) : $unsigned((7'h42))) ^ (reg7[(3'h6):(3'h6)] ?
                          $signed(reg8) : (wire9 ? wire1 : (7'h43)))),
                      $signed((~^(+wire16)))} << (|(($unsigned(wire17) ?
                      wire2 : (reg19 ? (8'hbb) : reg21)) || reg6)));
endmodule
