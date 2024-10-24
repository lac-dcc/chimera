module top
#(parameter param23 = (((8'haf) >>> {{(~(8'ha8))}, (((8'hab) == (8'hb1)) ? {(8'haa)} : ((7'h44) ? (8'hb3) : (8'hb5)))}) ? ((((-(8'ha6)) ^ ((8'hab) | (8'hb6))) ? {(~&(8'h9d)), ((7'h41) | (8'hb3))} : (~((8'hb0) + (8'ha9)))) ? {(((8'ha1) ? (8'hac) : (8'hbc)) != (~^(8'hb0))), (~&(!(8'ha1)))} : (({(8'had), (8'ha5)} ? ((8'h9c) >> (8'ha8)) : (7'h43)) ^~ (7'h40))) : {((((8'had) <= (7'h43)) != ((8'hab) | (8'hbe))) ^ (((8'h9c) ? (8'hab) : (8'hbe)) - (|(8'had)))), {(((8'hbb) & (8'h9e)) ? ((8'hbd) ? (8'ha6) : (8'hbd)) : {(8'had), (8'ha8)}), ((~|(8'hb0)) ? ((8'ha6) ? (7'h43) : (8'ha8)) : {(8'hbd)})}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ($signed((|wire0[(2'h3):(2'h2)])) <<< $unsigned(wire1[(5'h11):(3'h5)]));
  assign wire5 = (wire2[(3'h4):(3'h4)] && ($signed($unsigned($signed((8'hae)))) ?
                     (wire3[(2'h3):(1'h1)] >>> $unsigned((~wire3))) : (~(8'ha6))));
  assign wire6 = wire3;
  assign wire7 = wire3;
  assign wire8 = wire4;
  always
    @(posedge clk) begin
      reg9 <= ((~^$signed($unsigned((wire1 ? (8'ha0) : wire0)))) ?
          $signed((wire0 ^ ({wire8, wire2} ?
              (wire5 ?
                  wire3 : wire0) : wire5[(3'h4):(3'h4)]))) : (&(($unsigned(wire7) && wire0[(3'h6):(3'h5)]) ?
              wire7 : {$signed(wire7)})));
      reg10 <= {wire7[(2'h2):(2'h2)],
          (($signed(((8'hb5) <<< (8'h9c))) | $signed(reg9)) ?
              (~^{(wire4 ? wire5 : wire8)}) : wire7[(1'h0):(1'h0)])};
      if ($signed(reg10))
        begin
          reg11 <= wire4;
          reg12 <= (wire8[(4'ha):(4'ha)] ? wire6 : wire4[(5'h13):(5'h12)]);
          reg13 <= wire8;
          if (wire1[(2'h2):(1'h1)])
            begin
              reg14 <= ($unsigned((((reg13 - wire0) | (-reg9)) <<< ($unsigned(wire0) << ((8'hbb) ?
                      wire5 : wire6)))) ?
                  reg13 : wire7);
              reg15 <= ($signed((($signed(reg9) || {wire3}) <<< $unsigned(wire1[(4'hd):(3'h6)]))) >>> wire4[(4'h9):(2'h2)]);
              reg16 <= reg13;
              reg17 <= $unsigned((($signed((reg10 == (8'ha3))) ?
                  $unsigned((reg14 ?
                      wire6 : wire0)) : wire1) >>> (wire5[(3'h7):(3'h4)] == (~|(~&(8'haf))))));
            end
          else
            begin
              reg14 <= reg9[(3'h4):(2'h3)];
            end
        end
      else
        begin
          reg11 <= ((((^~$signed(wire7)) ?
                  ($signed(wire7) ?
                      wire4[(2'h2):(1'h1)] : $signed(reg11)) : ($signed(reg15) ?
                      reg10 : (reg12 ?
                          wire8 : wire5))) ^~ ((8'h9c) == ({(8'ha5), (8'hb0)} ?
                  (~^reg16) : (wire0 - reg16)))) ?
              reg14 : $unsigned((7'h41)));
        end
      reg18 <= wire4[(4'hf):(4'h9)];
    end
  assign wire19 = $signed(wire2);
  assign wire20 = ((~((|reg9[(4'hf):(1'h0)]) || $unsigned((~|wire8)))) ^~ $unsigned((~$unsigned((reg9 && reg14)))));
  assign wire21 = (((|$signed(wire7[(1'h0):(1'h0)])) ?
                          (((^~(8'ha7)) >>> wire2[(2'h3):(2'h3)]) ^~ $unsigned($unsigned(wire4))) : reg9[(5'h11):(4'h8)]) ?
                      $unsigned((~&$unsigned((wire0 == reg18)))) : {(&wire4[(5'h13):(4'hb)])});
  assign wire22 = {wire19};
endmodule
