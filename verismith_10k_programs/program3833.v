module top
#(parameter param19 = (~&(~((~|{(8'hb3), (8'hae)}) ? {((8'hab) ? (8'ha3) : (8'hb0))} : (-{(8'hbb), (8'hb3)})))), 
parameter param20 = param19)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (~(($signed((wire0 ? wire3 : wire4)) ?
                     ($unsigned(wire1) + $unsigned((8'ha1))) : wire0[(4'h8):(3'h4)]) ~^ ((wire2[(2'h2):(1'h1)] + wire4[(2'h3):(1'h0)]) > ($unsigned(wire0) ?
                     $signed((8'hb1)) : (|(8'h9d))))));
  always
    @(posedge clk) begin
      if (($signed(wire0) ? (8'had) : (wire2 * wire1[(1'h0):(1'h0)])))
        begin
          reg6 <= (+{wire0, {(&wire5[(4'ha):(1'h0)]), wire3[(3'h7):(3'h5)]}});
          if (wire0[(3'h4):(2'h3)])
            begin
              reg7 <= (8'h9e);
              reg8 <= $unsigned(({wire2[(1'h0):(1'h0)],
                      {$unsigned(wire2), $signed(reg6)}} ?
                  (8'ha3) : reg7[(5'h11):(3'h4)]));
            end
          else
            begin
              reg7 <= ($signed((|(wire2[(2'h2):(2'h2)] == $signed(wire0)))) | wire4);
              reg8 <= (~((reg6[(4'h9):(1'h1)] >> wire4) ?
                  reg7[(4'hf):(3'h4)] : $unsigned($signed($unsigned((8'ha8))))));
            end
        end
      else
        begin
          reg6 <= (($unsigned(wire0) - ($signed((8'ha3)) ?
                  wire3 : (!(8'haf)))) ?
              wire2 : wire3);
          reg7 <= ($unsigned((($signed(reg6) ?
                  (wire5 ? wire0 : wire3) : {wire3}) ?
              reg6 : $unsigned({reg6}))) == wire3[(4'hc):(4'h8)]);
          if (((wire5[(4'hf):(3'h7)] ?
                  reg7 : ({{reg7}} | $unsigned((~^wire0)))) ?
              $signed((7'h42)) : (wire5[(4'hd):(3'h5)] ?
                  ($signed($signed(wire3)) ?
                      $unsigned($signed(reg7)) : (^~reg6[(5'h15):(2'h3)])) : wire4)))
            begin
              reg8 <= {(^((~^$unsigned(wire5)) ? wire4 : (8'hbb)))};
            end
          else
            begin
              reg8 <= {({((&reg7) ? (~|(7'h43)) : (reg8 ? wire4 : wire2)),
                          {$signed((8'hb3))}} ?
                      (~($unsigned((8'ha3)) ^ $signed(wire5))) : reg7[(1'h1):(1'h0)]),
                  reg6[(1'h0):(1'h0)]};
            end
        end
    end
  assign wire9 = wire0;
  assign wire10 = (~^(wire2[(1'h1):(1'h1)] <<< (8'haa)));
  assign wire11 = wire10[(1'h1):(1'h0)];
  assign wire12 = $unsigned($signed($unsigned(wire10)));
  assign wire13 = (wire12[(2'h2):(1'h0)] ?
                      (wire4[(2'h2):(1'h0)] - $unsigned(wire1[(4'h8):(1'h1)])) : (((&$signed(reg6)) ?
                              (&(reg6 ? reg8 : wire2)) : (((8'h9f) ?
                                      reg8 : (8'ha8)) ?
                                  reg6[(4'he):(2'h2)] : $unsigned((8'ha1)))) ?
                          (|$signed((reg8 <= reg8))) : $unsigned((wire2 ?
                              wire1[(4'h8):(3'h7)] : ((8'hba) <<< wire3)))));
  always
    @(posedge clk) begin
      reg14 <= wire0;
      reg15 <= wire13;
      if ((~|$signed((((reg7 ? wire3 : reg7) | wire4) & (7'h42)))))
        begin
          reg16 <= reg15;
        end
      else
        begin
          reg16 <= wire11;
          reg17 <= reg14;
        end
      reg18 <= (wire2[(1'h1):(1'h1)] - wire4[(2'h2):(2'h2)]);
    end
endmodule
