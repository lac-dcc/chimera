module top
#(parameter param29 = (((^~(((8'hb2) & (7'h41)) > ((8'hbc) ~^ (8'ha2)))) ~^ (!{(^(8'h9f)), ((8'hbe) ? (8'hb9) : (8'ha3))})) ? (((8'hab) <<< (~&((8'ha5) & (8'haa)))) - ((&((7'h43) ~^ (8'ha7))) ? ((8'hb4) | ((8'ha4) ? (8'hbe) : (8'ha8))) : (7'h40))) : {(((!(7'h42)) != ((8'hb4) ? (8'hb7) : (8'ha7))) ? ((~&(8'hb5)) ? ((8'h9d) ? (8'ha6) : (8'hbc)) : {(8'hb9)}) : {((7'h43) >> (8'ha1))}), (^({(8'h9c), (8'hb3)} ? ((8'hbb) ? (7'h42) : (8'hab)) : {(8'hb6)}))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire15;
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  assign y = {wire28,
                 wire18,
                 wire17,
                 wire15,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  module5 #() modinst16 (.clk(clk), .wire6(wire4), .wire9(wire2), .y(wire15), .wire8(wire1), .wire7(wire3));
  assign wire17 = (wire1 ? wire1 : wire2);
  assign wire18 = wire15;
  always
    @(posedge clk) begin
      reg19 <= wire17;
      if (($signed((&(8'hbe))) ?
          reg19 : $unsigned($unsigned(reg19[(4'h8):(1'h1)]))))
        begin
          reg20 <= $unsigned({$unsigned($unsigned(reg19))});
          reg21 <= ((~$signed((reg20 >= (+wire4)))) ?
              (^({$signed(wire1), $unsigned((8'hb8))} ?
                  (|((8'hbf) ? (8'hbf) : wire18)) : wire17)) : (8'hbd));
          reg22 <= $signed(wire15[(4'h9):(2'h2)]);
          reg23 <= reg22[(3'h7):(3'h7)];
          reg24 <= (~$unsigned($signed(wire18[(3'h6):(3'h6)])));
        end
      else
        begin
          reg20 <= wire3;
        end
      reg25 <= {(wire4 - (!(wire2 ? $signed(wire4) : (8'hb9))))};
      reg26 <= (&((reg21[(4'hd):(4'ha)] - wire4[(3'h5):(3'h5)]) ?
          (reg19[(4'h8):(2'h3)] ?
              {wire15} : ({reg21} || (reg25 ?
                  reg20 : wire1))) : $unsigned({((8'ha4) & wire17)})));
      reg27 <= (reg26 ?
          (|($unsigned((wire0 ? wire2 : (8'hbc))) ?
              $unsigned($signed(wire2)) : $signed((wire15 ?
                  reg25 : wire1)))) : (wire2 ?
              ({$signed(wire1), (reg23 ? wire4 : wire17)} ?
                  reg19 : wire4[(3'h7):(2'h2)]) : $unsigned((&wire2))));
    end
  assign wire28 = wire2;
endmodule

module module5
#(parameter param14 = (&(~|({((8'hbd) ? (8'h9d) : (8'hbb)), ((8'h9c) ? (8'hb7) : (8'ha6))} ^ (((8'ha0) >>> (8'hab)) ~^ {(8'ha9), (8'hba)})))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  assign y = {wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = wire7[(2'h3):(1'h1)];
  assign wire11 = ($signed({$unsigned($unsigned(wire6))}) ^ (8'hb9));
  assign wire12 = $signed(((&$unsigned((!wire7))) >>> (8'hb4)));
  assign wire13 = ($unsigned((-$unsigned(wire11[(2'h2):(1'h0)]))) ^ $unsigned(wire7));
endmodule
