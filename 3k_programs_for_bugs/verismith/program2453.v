module top
#(parameter param14 = (&(~&(((|(8'hb4)) ? ((7'h40) ? (8'ha6) : (7'h43)) : ((8'hb6) ? (8'hac) : (8'hb3))) ? (^((7'h43) <= (8'haa))) : {((8'hae) * (8'hb2)), {(8'ha4)}}))), 
parameter param15 = param14)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire4,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed(((^wire3[(4'ha):(3'h5)]) ?
                     {wire0, wire2} : wire3[(4'ha):(2'h3)]));
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'hf):(4'ha)];
      if ($unsigned((8'ha2)))
        begin
          reg6 <= (~(($unsigned((reg5 >>> wire1)) ?
              $unsigned(wire1) : reg5) << ($signed((wire3 - wire0)) ?
              wire2 : $unsigned($signed((8'hba))))));
          reg7 <= wire3[(4'h8):(3'h7)];
        end
      else
        begin
          reg6 <= (~^({((&wire1) != reg5),
              reg5[(4'ha):(2'h3)]} != (!$unsigned($unsigned(reg5)))));
          reg7 <= ((!$unsigned(({(7'h40)} <= wire1))) & (!reg7[(1'h0):(1'h0)]));
          reg8 <= reg7;
        end
      reg9 <= ($signed($signed(wire0)) ?
          $unsigned(((&$unsigned((8'hae))) ^ (((8'hab) ^ reg7) ?
              {(8'hb0)} : $unsigned(reg7)))) : (~|$unsigned((8'ha6))));
      reg10 <= $unsigned(((((-wire0) ? (&reg7) : wire1) ?
          $unsigned($unsigned(reg9)) : $signed((reg7 ~^ wire4))) == {($unsigned(wire4) + (reg9 != reg7))}));
    end
  assign wire11 = $signed($signed(($unsigned(reg9) || (~^(~|reg9)))));
  assign wire12 = reg7;
  assign wire13 = wire1[(2'h3):(2'h3)];
endmodule
