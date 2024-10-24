module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire8,
                 wire7,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned({wire1[(3'h6):(1'h1)]});
  always
    @(posedge clk) begin
      reg5 <= (~&(wire4 ?
          wire2[(2'h3):(2'h3)] : (((wire2 <<< wire4) ?
                  wire4[(4'ha):(3'h5)] : {(8'h9c)}) ?
              ((wire2 - wire3) ? (~wire2) : $unsigned(wire0)) : (8'ha5))));
      reg6 <= wire3[(5'h12):(5'h12)];
    end
  assign wire7 = $unsigned(reg6[(3'h7):(3'h7)]);
  assign wire8 = (~(~^($signed({wire2}) ?
                     $signed($unsigned(reg5)) : (reg5 <<< (wire2 <<< reg6)))));
  always
    @(posedge clk) begin
      reg9 <= wire7[(1'h1):(1'h0)];
      reg10 <= (reg9 ?
          (!wire8) : $unsigned(({(~|wire7), (wire2 > wire0)} ?
              $unsigned($unsigned((8'ha5))) : $unsigned((&wire4)))));
      reg11 <= wire2[(2'h3):(2'h2)];
      reg12 <= (($signed((!reg6)) ?
          {((!wire8) ? (wire2 ? reg10 : reg9) : wire7[(3'h5):(3'h5)]),
              wire0[(4'h8):(1'h0)]} : wire1) | ((&(((8'h9e) > wire7) ?
              wire7 : $signed(wire1))) ?
          wire8 : (((~wire1) ^~ wire7[(2'h2):(1'h0)]) >= reg5)));
    end
  assign wire13 = ($signed((reg11[(2'h2):(1'h0)] ?
                          {reg12[(4'h8):(1'h1)]} : $unsigned($signed(reg12)))) ?
                      $unsigned($unsigned(($signed(wire3) < $signed(wire0)))) : (((~wire4) && {(wire4 ?
                              wire4 : wire7),
                          (wire4 ?
                              reg12 : wire2)}) == $unsigned($unsigned((reg5 && (8'hb8))))));
  assign wire14 = (8'had);
  assign wire15 = ({($signed(reg6) ? wire14 : reg9),
                      $signed(((reg9 ? reg12 : wire3) ?
                          $signed((8'hb0)) : {reg10,
                              (8'h9e)}))} >>> reg11[(3'h4):(1'h1)]);
endmodule
