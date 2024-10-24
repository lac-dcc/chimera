module top
#(parameter param23 = ((!(~|({(8'hb7)} ? (8'hb2) : {(8'had), (8'hbc)}))) ? (~|(^~(+((8'hb6) ? (8'hb6) : (8'ha5))))) : ({(((8'hba) * (8'ha4)) && (^(8'hb2)))} > {{(&(8'ha0))}, (|((8'ha9) < (8'hb4)))})), 
parameter param24 = (~&(+param23)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg22,
                 reg21,
                 reg20,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned(($unsigned(wire3[(4'h8):(1'h1)]) | wire1[(4'hc):(3'h6)])));
  assign wire6 = (wire2[(2'h3):(1'h0)] ?
                     (wire4[(1'h1):(1'h1)] >>> (|$signed($unsigned((8'ha0))))) : wire4);
  assign wire7 = $unsigned({$unsigned({(wire2 - wire1),
                         (wire6 ? (8'hb6) : wire0)}),
                     ($signed(wire0) ? (!$unsigned(wire0)) : {wire3})});
  assign wire8 = wire7[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg9 <= (&($unsigned((~(~^(8'hb8)))) ?
          $signed((8'hbf)) : $unsigned($signed($unsigned(wire5)))));
      reg10 <= $unsigned(((($unsigned(wire8) ?
              $unsigned(wire8) : (wire7 * (8'ha6))) ?
          $unsigned($unsigned(wire5)) : $signed($signed(wire6))) << ($signed((wire4 ?
          wire5 : wire7)) + ($unsigned(wire7) ~^ wire2[(2'h2):(1'h0)]))));
    end
  assign wire11 = (~(!$signed($signed($signed(reg9)))));
  assign wire12 = $signed({(+$unsigned(wire6[(5'h15):(3'h4)]))});
  assign wire13 = (^($unsigned(((wire6 ? wire1 : wire4) + $unsigned(wire4))) ?
                      (~|($signed(wire7) <= (wire6 ?
                          (8'hbf) : wire5))) : (&(^(~wire4)))));
  assign wire14 = $unsigned(((~({wire6, (8'hb5)} || reg9)) >> $signed(wire1)));
  assign wire15 = (^~wire3[(3'h4):(1'h1)]);
  assign wire16 = {reg10, $signed(wire14[(3'h5):(3'h4)])};
  assign wire17 = ($unsigned((((wire3 ? wire0 : wire1) ?
                              (wire2 ? wire4 : wire4) : (wire2 || wire7)) ?
                          wire12[(2'h2):(2'h2)] : ((!wire5) ?
                              (wire16 ?
                                  reg9 : (8'hb0)) : reg10[(3'h6):(2'h2)]))) ?
                      ((wire7[(1'h0):(1'h0)] ?
                          wire15[(2'h3):(2'h3)] : wire11[(4'ha):(4'h8)]) == $signed((+wire12))) : (~^(($unsigned(wire7) != $signed(reg10)) ~^ ((!wire6) <<< wire3[(4'hb):(4'ha)]))));
  assign wire18 = $unsigned($signed(($signed($signed((8'haa))) || reg9)));
  assign wire19 = (|$signed({($signed((7'h40)) != reg9)}));
  always
    @(posedge clk) begin
      reg20 <= {(^$unsigned(wire1[(3'h6):(1'h0)])),
          $signed($signed(($signed(wire15) & (wire6 ? (8'hbf) : wire3))))};
      reg21 <= (wire2 & (!wire17[(1'h1):(1'h0)]));
      reg22 <= $signed({(reg9 + $signed((reg9 >>> wire8)))});
    end
endmodule
