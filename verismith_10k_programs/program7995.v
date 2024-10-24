module top
#(parameter param17 = (((8'hba) - ((((8'hb8) > (8'hbb)) ^ ((8'h9f) ? (8'haf) : (8'ha7))) != (((8'h9e) << (8'hbf)) + ((8'hbb) == (7'h41))))) ? {(7'h42), (~|(((8'hb6) != (7'h42)) ? {(8'hae)} : (^(8'h9f))))} : (({((8'haa) != (8'hb5))} ? (((8'hb4) ? (8'hae) : (8'hbc)) ? ((8'ha5) >= (8'hab)) : ((8'haf) | (8'haf))) : ((~^(8'hbb)) + ((8'hb2) < (8'hbd)))) || ({((7'h44) < (7'h44))} ? (((8'hba) & (8'hba)) ? {(8'ha6), (8'ha3)} : ((8'hb2) ? (8'haf) : (8'hac))) : ((~(8'ha0)) >> ((8'ha9) ? (8'hba) : (8'ha9)))))), 
parameter param18 = {{(((param17 ? param17 : param17) ? param17 : param17) * ((param17 ? param17 : param17) <<< {param17})), ((~(param17 ? (8'h9c) : param17)) ? ((param17 ? param17 : param17) >> (+param17)) : ((param17 ? param17 : param17) ^~ param17))}, (8'hb0)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 reg16,
                 reg15,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire3[(2'h2):(1'h0)] ?
          ((~|$signed($unsigned(wire3))) ?
              (~|(wire0 ?
                  $signed(wire3) : wire1)) : wire3[(1'h0):(1'h0)]) : (~&$unsigned(((8'hb8) == ((8'h9f) ?
              wire3 : wire0))))))
        begin
          reg4 <= $unsigned((wire0 != $signed(($unsigned(wire2) ?
              $signed((8'hb5)) : (8'ha5)))));
          reg5 <= wire3[(3'h4):(2'h2)];
          if ((!{(({wire0, wire1} ? $unsigned(wire1) : (wire3 << reg4)) ?
                  wire2[(4'h9):(2'h2)] : ({wire0} ?
                      {(8'hb4), wire0} : (wire1 > wire3))),
              $signed($signed((reg5 ? (7'h42) : wire0)))}))
            begin
              reg6 <= ((^~$unsigned((^reg5[(3'h6):(3'h6)]))) ? wire1 : (8'ha1));
            end
          else
            begin
              reg6 <= {$signed((wire3 ?
                      $signed($signed(wire2)) : ($signed(wire0) && reg6[(2'h2):(2'h2)])))};
              reg7 <= ($signed(wire3[(2'h3):(2'h3)]) ?
                  reg6 : $signed(((~|((8'hb1) ? reg5 : reg5)) ?
                      {(~^reg6),
                          (wire1 ? reg5 : reg4)} : wire1[(4'h8):(1'h1)])));
              reg8 <= (((((reg4 ? wire3 : wire3) | (reg6 | reg6)) ?
                      $signed($signed(reg4)) : (~^(|reg5))) ?
                  ($unsigned(wire0) <= $unsigned(reg5[(3'h7):(3'h7)])) : (wire3[(3'h7):(3'h6)] ?
                      reg7 : (~|$unsigned(wire1)))) || wire1);
              reg9 <= wire2;
            end
        end
      else
        begin
          reg4 <= (~wire3);
          reg5 <= (+reg5);
        end
      reg10 <= reg5[(1'h1):(1'h1)];
      reg11 <= (($signed(wire3) <= (^~wire0[(1'h0):(1'h0)])) >> $unsigned((+(|(~^wire2)))));
    end
  assign wire12 = ((-wire0[(2'h2):(1'h0)]) ^ ((^~$unsigned({reg8, wire1})) ?
                      (reg8[(2'h2):(1'h0)] ^~ wire1) : ({$signed(reg4)} > (wire2[(4'ha):(3'h5)] < wire2[(2'h3):(2'h3)]))));
  assign wire13 = $unsigned((wire3[(1'h1):(1'h0)] ?
                      (^~reg8) : (reg5 >>> $signed((wire1 ? reg6 : wire3)))));
  assign wire14 = reg11[(4'hf):(1'h1)];
  always
    @(posedge clk) begin
      reg15 <= reg7;
      reg16 <= (8'ha6);
    end
endmodule
