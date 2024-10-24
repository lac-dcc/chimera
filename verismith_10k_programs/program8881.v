module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire13,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = (&(wire1 ?
                     $unsigned(wire0[(4'h9):(2'h2)]) : $unsigned(wire3[(4'hc):(4'hc)])));
  assign wire5 = ($unsigned($unsigned($signed((~|(8'hb5))))) & $unsigned((wire0[(4'h8):(3'h4)] ?
                     $unsigned(wire4[(2'h2):(1'h0)]) : ((wire0 >= (8'hb1)) ~^ {wire2,
                         wire1}))));
  assign wire6 = ($unsigned((-$signed(wire3[(2'h2):(1'h0)]))) << $signed((({wire0,
                         wire1} ?
                     (wire5 ?
                         wire4 : wire1) : (wire0 << (7'h40))) ^ $signed((wire2 != wire0)))));
  assign wire7 = (wire1[(3'h6):(3'h6)] ^ (wire1[(5'h12):(4'h8)] >= (~wire4)));
  assign wire8 = $unsigned($unsigned($unsigned((&$unsigned(wire7)))));
  assign wire9 = (~&(wire5[(2'h3):(1'h0)] ^~ (^~(wire7[(5'h11):(4'h9)] ?
                     (wire1 ? (8'hb9) : wire8) : (wire7 || (8'hb5))))));
  always
    @(posedge clk) begin
      reg10 <= (($signed(((wire8 ? wire0 : wire2) < (|wire6))) ?
              $signed($unsigned((wire8 || wire6))) : $signed($signed($signed(wire5)))) ?
          wire2[(2'h3):(2'h2)] : ((({(8'hb4)} ?
                  (+wire4) : (wire8 == wire3)) && $unsigned($signed(wire3))) ?
              $signed(((wire5 == wire7) ?
                  wire2[(4'hc):(3'h4)] : (^wire7))) : (wire1[(1'h0):(1'h0)] ~^ wire3[(3'h5):(1'h1)])));
      reg11 <= $unsigned(reg10);
      reg12 <= reg11[(3'h7):(3'h5)];
    end
  assign wire13 = ((8'hae) ?
                      $unsigned((($signed((8'hb7)) ?
                          {wire7,
                              wire9} : $signed(reg10)) ~^ wire6[(1'h1):(1'h0)])) : {{$signed(wire2[(4'ha):(1'h0)]),
                              wire2[(1'h0):(1'h0)]}});
  always
    @(posedge clk) begin
      reg14 <= $signed(wire7);
      reg15 <= (($signed({(wire0 ? reg14 : wire8), wire9[(1'h1):(1'h0)]}) ?
          $unsigned(reg12) : $unsigned((reg10 ?
              $signed(wire3) : wire6[(1'h0):(1'h0)]))) * (+((+(wire0 && reg11)) ?
          (^(^wire8)) : (wire3[(5'h11):(4'hd)] ?
              wire0[(3'h5):(1'h0)] : wire2))));
    end
  assign wire16 = $signed({$signed(((-reg11) ?
                          (reg15 ^ wire7) : $signed(reg12))),
                      ($unsigned({(8'hb0), wire7}) + (~&wire1))});
  assign wire17 = $signed((!reg14));
  assign wire18 = (($unsigned((+reg12[(3'h5):(3'h4)])) <= $unsigned(($unsigned(wire3) | $signed((8'ha9))))) ?
                      (!reg11[(1'h1):(1'h0)]) : $signed(($unsigned(reg14[(2'h2):(1'h1)]) ?
                          {{reg14}, {wire7, wire5}} : (~(~&wire4)))));
  assign wire19 = $signed($unsigned($signed($signed($unsigned((8'h9c))))));
  always
    @(posedge clk) begin
      reg20 <= wire19;
    end
endmodule
