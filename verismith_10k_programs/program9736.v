module top
#(parameter param17 = (|((((7'h43) != {(8'hbd)}) | (((8'hb0) ^ (8'hb8)) <= {(8'h9c)})) ? ((8'hbb) && {((8'had) ? (8'hb8) : (8'haa)), (~^(8'h9d))}) : {(&((8'hb6) - (8'ha4)))})), 
parameter param18 = (-param17))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed((-wire3));
  assign wire5 = (((wire0 ?
                     wire3 : ($unsigned(wire4) + (8'ha1))) ^~ wire2[(2'h3):(2'h2)]) ^ (8'hac));
  always
    @(posedge clk) begin
      reg6 <= wire0;
      reg7 <= ({$signed((^~$unsigned(wire5))),
          (^~(~(+wire2)))} <= {($unsigned($unsigned(wire1)) + wire0[(3'h6):(2'h3)])});
      reg8 <= $unsigned($signed($signed(wire5[(4'ha):(3'h5)])));
      if (wire1[(4'hb):(3'h6)])
        begin
          reg9 <= (($unsigned($unsigned((^wire0))) <= $signed(wire4[(1'h0):(1'h0)])) ?
              reg8 : (reg6 ?
                  $unsigned({(8'ha8), wire5[(3'h5):(1'h1)]}) : wire3));
        end
      else
        begin
          reg9 <= ((!$unsigned(wire2[(1'h1):(1'h0)])) * $signed((wire0[(3'h4):(2'h2)] ?
              wire4[(3'h5):(3'h4)] : {(~&wire4), $unsigned(wire2)})));
          reg10 <= {{$unsigned((8'ha6)), (-$unsigned(wire1))},
              (~|(+$unsigned($unsigned(reg9))))};
          reg11 <= reg10;
          reg12 <= $signed($signed((7'h40)));
          reg13 <= wire1;
        end
    end
  assign wire14 = (&((($signed((8'ha9)) >> wire4[(1'h0):(1'h0)]) ?
                      $signed((wire0 || reg12)) : wire5) >> (($unsigned(reg6) ?
                          (+(8'h9e)) : $signed(reg7)) ?
                      {$signed((8'ha2))} : ((8'hae) ? (~(8'hb7)) : wire2))));
  assign wire15 = $signed($signed((^~$unsigned($signed(reg8)))));
  assign wire16 = $signed($signed($unsigned((8'hbe))));
endmodule
