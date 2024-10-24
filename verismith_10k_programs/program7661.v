module top
#(parameter param13 = ((-((((8'hbd) * (8'hb2)) < ((8'ha3) ? (8'hab) : (8'haa))) ? {(~&(8'hb6))} : ((~^(8'ha6)) > {(8'ha3)}))) <= (((&{(8'hba)}) ? (((8'hba) ? (8'hac) : (8'ha1)) > ((8'haa) != (8'hbd))) : (((8'ha8) < (8'hab)) - ((8'ha8) <<< (8'hb2)))) ? ({(|(7'h40)), (|(8'hbc))} ? ((^(8'hbb)) >>> ((8'haf) <<< (8'hbd))) : {(8'hae), ((8'ha1) ? (8'h9d) : (8'hb9))}) : {(((8'hb2) ? (8'ha0) : (8'hb3)) ? ((8'hac) + (8'ha3)) : {(7'h40)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire3;
  always
    @(posedge clk) begin
      reg5 <= (|(^~(!$signed((~^wire0)))));
      reg6 <= wire4[(4'h9):(3'h6)];
      reg7 <= wire0[(1'h0):(1'h0)];
      reg8 <= $unsigned((~wire0));
      reg9 <= ($signed(reg6) && $signed((($unsigned(reg5) - $signed(reg6)) ?
          $signed(wire4) : ($signed(wire3) - (~reg7)))));
    end
  assign wire10 = {$unsigned((~|($unsigned((8'ha8)) ?
                          {reg8} : $signed(reg7))))};
  assign wire11 = (+({$unsigned($unsigned(wire4)),
                          $unsigned(reg8[(1'h0):(1'h0)])} ?
                      $unsigned(((reg6 >= (8'hb4)) >> ((8'h9e) >> (8'ha3)))) : $signed($unsigned((wire10 != wire2)))));
  assign wire12 = ({(!(^~wire0[(2'h2):(2'h2)])),
                      $unsigned($unsigned(((8'hb3) ?
                          wire11 : reg9)))} && wire1[(3'h4):(2'h3)]);
endmodule
