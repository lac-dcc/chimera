module top
#(parameter param10 = ({(^~((^~(8'ha0)) < {(7'h40), (8'hb7)}))} || ((({(7'h41), (8'h9f)} ? (~&(8'ha0)) : {(7'h40), (8'hb2)}) ? (((8'had) || (8'ha2)) <<< (~&(8'hbf))) : (-((8'ha9) - (8'ha4)))) ? (({(8'hb5), (8'hb2)} ? ((8'hb1) + (8'hba)) : (~&(8'hbd))) ? (&(8'hb8)) : (~((8'ha1) || (8'ha2)))) : (~|(8'hab)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, wire4, reg9, reg8, (1'h0)};
  assign wire4 = ((wire3[(4'ha):(3'h6)] & ($signed(wire0) ^ ($signed(wire3) || $signed(wire3)))) ?
                     ((~|((wire2 ? wire2 : wire1) >> (wire1 ?
                         wire3 : wire1))) == $unsigned(wire1)) : $signed((|{wire3[(2'h3):(2'h3)],
                         (+(8'hb2))})));
  assign wire5 = $unsigned({($signed((wire3 ? wire0 : wire1)) ?
                         wire0 : ($unsigned((8'hb8)) & (wire2 ?
                             wire1 : wire2)))});
  assign wire6 = $signed($signed(wire2[(3'h4):(2'h2)]));
  assign wire7 = (wire2 ? wire4 : {(^~$unsigned($signed(wire6)))});
  always
    @(posedge clk) begin
      reg8 <= ($unsigned((!({wire7, wire1} ? (wire0 | wire6) : (8'haf)))) ?
          wire6[(1'h0):(1'h0)] : $unsigned(($unsigned((wire5 ?
              wire5 : wire2)) <= wire0)));
      reg9 <= (wire5 ?
          (~$unsigned(($unsigned(wire5) || $unsigned(wire5)))) : wire1[(3'h4):(1'h0)]);
    end
endmodule
