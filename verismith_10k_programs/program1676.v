module top
#(parameter param15 = ({(~|({(8'ha8)} <= ((8'hac) ? (8'hb2) : (8'haa)))), (~^(!((8'ha1) - (8'ha0))))} | (~&{((~&(8'hab)) ? ((7'h44) & (8'hbb)) : {(8'hb5)})})), 
parameter param16 = (~|((((8'hb5) ? (param15 ? param15 : (8'h9d)) : (param15 >>> param15)) ? (8'ha4) : (~|{param15})) <= (~|(7'h42)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ({(($signed(wire0) << wire2) * $unsigned(wire2[(4'h8):(3'h5)])),
                     $signed(wire1[(3'h6):(2'h2)])} >= (wire2[(3'h6):(2'h3)] << (^~(8'hb9))));
  assign wire5 = $signed((&(8'ha8)));
  assign wire6 = ($unsigned(wire3) ?
                     ($unsigned(($signed(wire0) ?
                         $unsigned(wire0) : {wire1})) | $unsigned(wire2[(1'h0):(1'h0)])) : (~^$signed(($signed(wire0) ?
                         (^wire1) : (~wire3)))));
  assign wire7 = $unsigned(wire1[(3'h4):(2'h3)]);
  assign wire8 = ({$unsigned((&$unsigned(wire3)))} >= (+wire4));
  always
    @(posedge clk) begin
      reg9 <= $unsigned((8'ha6));
    end
  always
    @(posedge clk) begin
      if ((wire6 ?
          ((~wire8) ?
              $signed($signed((wire3 + wire4))) : $signed(wire1[(4'h8):(3'h6)])) : $signed($signed(($unsigned(wire2) ?
              $unsigned(wire3) : ((8'ha6) ? wire0 : wire8))))))
        begin
          reg10 <= wire0[(2'h2):(1'h1)];
          reg11 <= wire7[(1'h1):(1'h0)];
        end
      else
        begin
          reg10 <= (!(wire3 ~^ ($signed($unsigned((8'ha9))) ^~ {wire7[(1'h1):(1'h0)],
              $unsigned(wire2)})));
        end
      reg12 <= {wire2[(2'h2):(1'h1)], $signed(wire3)};
      reg13 <= {wire8[(4'h8):(3'h4)],
          ($unsigned(((reg10 ? (7'h42) : wire1) ?
              $signed(reg10) : wire5)) * (~$unsigned($signed(reg10))))};
      reg14 <= (~|(~&$unsigned(wire0[(3'h4):(3'h4)])));
    end
endmodule
