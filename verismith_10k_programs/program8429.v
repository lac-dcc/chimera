module top
#(parameter param17 = ({((|((8'hb8) ? (8'hb2) : (8'hbc))) ? ({(8'hb1)} ^ (7'h43)) : (&{(8'haf), (8'hba)})), (|(((8'h9c) ? (8'hb9) : (8'hab)) ? (!(7'h44)) : ((8'ha8) ? (8'hab) : (7'h43))))} ? {({{(8'hb4)}} * {((8'hb1) <= (8'ha7))}), ((((8'hb7) | (8'h9d)) ? ((8'hb1) ? (7'h43) : (8'ha6)) : {(7'h44)}) ? {(8'hbf)} : (((7'h41) ? (8'hab) : (8'h9c)) ? ((7'h44) <<< (8'h9c)) : (~(7'h43))))} : ((((~|(7'h40)) > (-(8'hb2))) ^ (((8'hb6) <= (8'haa)) ^ ((8'hb3) ? (8'hb4) : (8'ha9)))) ? ((^~((8'hba) ? (7'h43) : (8'ha7))) >>> {((8'hb1) == (8'h9d)), ((7'h44) - (7'h41))}) : (((+(8'hb5)) ? (~^(8'hb7)) : ((7'h44) * (8'h9d))) ? {{(8'ha5)}} : (~|((8'ha8) >>> (8'hba)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned({(8'hbd)}) - (-(^$unsigned((wire4 ^~ wire4)))));
      if ($signed(wire1[(2'h2):(2'h2)]))
        begin
          reg6 <= (8'ha3);
        end
      else
        begin
          reg6 <= (wire3[(1'h0):(1'h0)] & wire1);
          if ((+wire2[(3'h6):(2'h3)]))
            begin
              reg7 <= $signed((^~((+(wire3 <= reg5)) == (-$unsigned(reg5)))));
            end
          else
            begin
              reg7 <= $unsigned((+(wire2[(1'h1):(1'h1)] & {((8'hb5) << reg5)})));
              reg8 <= wire4[(3'h5):(3'h5)];
              reg9 <= (($signed(reg6) == ((~&$signed((8'h9d))) ?
                      wire1[(1'h1):(1'h0)] : reg8[(2'h3):(2'h3)])) ?
                  (wire4 == ($signed($signed(wire4)) ^~ $unsigned($signed(wire3)))) : {reg8,
                      wire2});
              reg10 <= $signed(wire4[(1'h1):(1'h0)]);
            end
        end
      reg11 <= (wire0[(4'he):(1'h0)] ?
          (($signed($signed(wire0)) ?
              {{wire1}} : ((reg7 ?
                  (8'ha3) : wire2) || wire1[(2'h2):(2'h2)])) < ($unsigned((reg7 ?
                  reg8 : wire1)) ?
              ((wire2 + (8'hbd)) ?
                  (reg7 ?
                      (8'h9f) : reg6) : $unsigned(reg5)) : ($unsigned((8'ha7)) != wire3))) : reg9);
      reg12 <= $unsigned((~|((~(wire2 ? reg10 : wire2)) - {{reg10, reg7},
          {wire4, reg7}})));
      reg13 <= ((~|$signed(reg6[(4'hc):(4'ha)])) ?
          (&(&(+(!wire2)))) : $unsigned($unsigned((8'hb7))));
    end
  assign wire14 = (~wire3[(1'h1):(1'h1)]);
  assign wire15 = (((((reg5 ? reg10 : wire3) ?
                      (reg6 - reg5) : (^~(8'ha2))) >= (!(^~wire4))) ^~ ($signed((reg12 <<< reg8)) <= wire4)) - $signed(wire0[(3'h7):(3'h4)]));
  assign wire16 = $signed($signed(((-reg10) >> (wire3[(1'h0):(1'h0)] + reg8[(4'he):(3'h5)]))));
endmodule
