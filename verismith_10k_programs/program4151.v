module top
#(parameter param13 = ({(-(((8'ha7) < (8'ha7)) ? (&(8'ha3)) : ((8'ha0) ? (8'ha7) : (8'ha9))))} ? ({(((8'hab) ? (8'hac) : (8'hbe)) ~^ ((8'hab) ? (8'hb2) : (8'hbf)))} & ((((8'hb9) ? (8'h9f) : (8'h9c)) ? ((8'hba) > (8'ha3)) : ((8'ha3) >>> (8'ha9))) ~^ ((-(8'hb7)) ? {(8'hac), (8'hb1)} : {(8'hb6), (7'h43)}))) : (((+{(8'ha4)}) ? {((8'hb5) && (8'ha5)), ((8'ha4) == (8'hb8))} : ((~|(8'hbb)) ? ((8'hbb) ~^ (8'ha5)) : (+(8'hb6)))) ^~ (((^(8'hbc)) ? (!(7'h41)) : {(8'ha2), (8'hb9)}) ? ((8'hac) || (!(8'had))) : (+((8'haf) ? (8'h9c) : (8'ha5)))))), 
parameter param14 = (-(!((^~(7'h41)) >> ((param13 ? param13 : param13) ? (^~param13) : param13)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (8'hb1);
  assign wire6 = $signed(wire4[(3'h7):(1'h0)]);
  assign wire7 = ($unsigned(((-wire6) + $unsigned({wire3, wire3}))) || (8'hb2));
  always
    @(posedge clk) begin
      reg8 <= ((!(8'hbf)) ? wire2 : wire2[(4'h9):(4'h9)]);
      reg9 <= (~|$signed($signed(wire3[(3'h5):(2'h3)])));
      reg10 <= {$unsigned($unsigned((reg8 <<< reg8))),
          $unsigned(((wire5[(2'h3):(2'h3)] > $signed(wire6)) ?
              $signed((wire7 ? wire7 : wire1)) : $unsigned($signed((7'h41)))))};
    end
  always
    @(posedge clk) begin
      reg11 <= $signed(wire4[(2'h3):(1'h0)]);
      reg12 <= reg10;
    end
endmodule
