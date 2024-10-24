module top
#(parameter param18 = (((((~&(7'h40)) ~^ ((8'hba) ? (8'had) : (8'ha8))) ? (8'haf) : ((~(8'hbf)) > ((8'hb6) != (8'ha6)))) ? ((!((8'hb5) + (7'h40))) > (((8'hbb) || (8'ha9)) && {(8'hb9)})) : {(((8'ha6) + (8'hb4)) ? (|(8'hbb)) : ((8'hac) ? (8'ha9) : (8'hbd)))}) ? ((~{(~(8'had))}) <= (8'ha7)) : (({((8'ha4) ? (8'had) : (8'hae))} << (((8'hb1) ? (8'hb3) : (8'hb9)) ? (~&(8'ha7)) : ((8'ha4) >= (8'hb9)))) << (|{((7'h44) ? (8'ha3) : (8'haf))}))), 
parameter param19 = (~(~&param18)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (~|wire0);
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= wire3[(1'h0):(1'h0)];
      if (((~&($signed((~&(8'hac))) ?
          wire3[(1'h1):(1'h0)] : wire3)) - $signed((8'ha3))))
        begin
          if (wire0)
            begin
              reg8 <= (^$unsigned($unsigned(reg7[(1'h0):(1'h0)])));
              reg9 <= {(+$unsigned(wire6[(2'h2):(1'h1)])),
                  (wire5 <<< $unsigned(wire2[(2'h2):(2'h2)]))};
              reg10 <= wire1[(4'ha):(3'h7)];
              reg11 <= wire4[(4'hc):(1'h1)];
            end
          else
            begin
              reg8 <= $signed(((reg9[(4'hd):(3'h5)] ?
                      reg8[(1'h1):(1'h0)] : (8'hb5)) ?
                  (($signed(wire6) ?
                      {(8'hbf),
                          wire6} : $unsigned(reg10)) || $unsigned(wire0[(4'hf):(2'h2)])) : (wire0[(4'ha):(2'h2)] ?
                      ($signed(wire5) * $signed(reg9)) : $signed(wire1))));
            end
          reg12 <= (8'had);
          reg13 <= (8'h9c);
        end
      else
        begin
          reg8 <= ((((~&(~^wire0)) ?
              reg10[(3'h6):(1'h0)] : $signed({wire6,
                  wire1})) << reg11[(4'hb):(4'h9)]) << (($signed(reg9) ?
                  $signed($signed(wire1)) : $signed($unsigned(wire3))) ?
              (((reg7 ? wire4 : (8'ha1)) ?
                  (+wire2) : $unsigned((8'haf))) != wire2) : wire5[(4'hd):(4'hc)]));
          if ($unsigned((&(8'hae))))
            begin
              reg9 <= reg9[(1'h1):(1'h0)];
              reg10 <= wire3[(1'h0):(1'h0)];
            end
          else
            begin
              reg9 <= ((wire0[(3'h7):(1'h1)] ?
                  $signed((^~(8'hb1))) : (+(~(~^reg7)))) * (({(!(8'ha6)),
                      (&reg10)} >= reg7) ?
                  $signed(wire5) : reg7));
              reg10 <= $unsigned(wire3[(1'h1):(1'h0)]);
              reg11 <= (~^($unsigned(wire0) & wire6));
            end
          reg12 <= ($signed((wire4 ? (~^$unsigned(reg13)) : wire6)) ?
              (((8'haf) ?
                  ($signed(reg10) ?
                      (&(8'ha0)) : {reg7}) : (^~(reg9 >> wire0))) << (reg7[(3'h7):(3'h5)] ^~ ($signed(wire6) ?
                  wire2[(1'h0):(1'h0)] : $unsigned(wire3)))) : wire0[(4'h9):(2'h2)]);
        end
      reg14 <= wire0;
      reg15 <= (~|reg7);
    end
  assign wire16 = wire6;
  assign wire17 = reg15[(1'h0):(1'h0)];
endmodule
