module top
#(parameter param17 = (((((+(8'ha8)) ~^ {(8'h9c), (8'h9c)}) ? ({(8'ha2), (8'hbd)} ? ((8'hb0) == (8'hb8)) : (7'h44)) : ((~|(8'ha0)) | (8'ha5))) == ((((8'had) >> (8'hb6)) << ((8'hbd) ? (8'h9c) : (8'hbb))) + (&((8'hb9) ? (8'hbf) : (8'hb1))))) - (~^((((8'hb5) <<< (8'haa)) ? (-(8'hb6)) : (8'hb4)) | (((8'ha7) ? (8'hbf) : (8'hb8)) < ((8'hb0) <<< (8'hb3)))))), 
parameter param18 = (param17 & param17))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $signed({(|wire0[(4'ha):(2'h2)]),
                     $signed(wire3[(3'h5):(3'h5)])});
  assign wire5 = $signed((((~^$signed(wire4)) ?
                     $signed($unsigned(wire3)) : wire1) ^ wire3[(4'h8):(3'h6)]));
  assign wire6 = (~^wire4[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      if ((({($unsigned((8'ha0)) ?
                  ((8'ha5) ? wire1 : wire5) : (|(8'hb1)))} ^ $unsigned(wire0)) ?
          wire0[(4'hc):(3'h7)] : ({(~&(wire0 ? wire1 : (8'ha2)))} ?
              {(~|(wire2 << wire0))} : wire5[(3'h6):(3'h5)])))
        begin
          if ($signed((((^~(~|wire2)) ^~ (wire6[(3'h6):(1'h1)] ?
                  (8'hbe) : wire4[(4'he):(1'h0)])) ?
              ({$signed((8'hb3))} ^ ($unsigned((8'ha5)) & (wire3 <= wire4))) : (wire1[(5'h13):(4'hd)] ?
                  wire2 : $signed(wire0[(5'h10):(4'ha)])))))
            begin
              reg7 <= wire5[(2'h3):(2'h2)];
              reg8 <= (8'hae);
            end
          else
            begin
              reg7 <= {reg7};
              reg8 <= reg7[(4'hb):(3'h6)];
              reg9 <= reg8;
              reg10 <= (reg7[(4'hc):(1'h1)] ?
                  $unsigned((8'had)) : (~^(&$signed((wire1 ? reg8 : wire1)))));
              reg11 <= reg9[(3'h6):(1'h1)];
            end
        end
      else
        begin
          reg7 <= ($unsigned(wire1) ?
              wire3 : (wire5 < $signed($signed((reg11 ? (7'h43) : wire5)))));
          reg8 <= $signed(wire1);
        end
    end
  assign wire12 = ($unsigned($signed($signed($unsigned(wire2)))) || (~&{$signed($signed((8'ha7)))}));
  assign wire13 = {(wire1 ?
                          wire0[(4'hc):(1'h0)] : (reg8 ?
                              (~&(wire6 ~^ reg9)) : (8'hbd)))};
  assign wire14 = $unsigned(wire5);
  assign wire15 = {((wire1[(5'h12):(5'h12)] && (8'h9c)) ?
                          ((~^(7'h44)) ?
                              $unsigned(((8'hbb) <<< (8'hb4))) : $signed(wire13[(2'h3):(2'h3)])) : (&reg8[(4'hb):(4'h9)]))};
  assign wire16 = wire5;
endmodule
