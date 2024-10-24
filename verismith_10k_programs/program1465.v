module top
#(parameter param22 = (({({(8'hab), (8'ha6)} ? (~^(8'hb8)) : {(8'ha9), (8'ha8)})} ? (~&(((8'hbe) || (8'haf)) ? (!(8'haf)) : (~|(7'h43)))) : {(~|(^~(8'ha9)))}) && (-((^~((8'hb8) ? (7'h41) : (8'hbb))) <<< (&((8'ha6) ? (8'hb6) : (8'hb0)))))), 
parameter param23 = (~|(param22 ? ((~|param22) ? param22 : (-{param22, param22})) : (8'ha5))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
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
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (!wire2);
  assign wire5 = wire0[(4'hb):(1'h0)];
  assign wire6 = {{$unsigned(wire0)}};
  always
    @(posedge clk) begin
      reg7 <= $unsigned((~|((8'h9d) * $unsigned(wire2[(3'h4):(3'h4)]))));
      reg8 <= $signed(($signed(reg7) - {($signed(wire2) - $unsigned(wire6))}));
      if (((~^(-$signed(wire1))) << wire5[(4'ha):(3'h5)]))
        begin
          reg9 <= $signed((~|wire2));
          reg10 <= {$signed((({wire1,
                  (7'h40)} <= wire6[(4'ha):(4'ha)]) * (((8'hac) ?
                  reg7 : reg7) >= {wire4, (8'hb2)})))};
          reg11 <= $unsigned(reg9[(3'h6):(1'h1)]);
        end
      else
        begin
          reg9 <= (~reg11);
          if (wire0)
            begin
              reg10 <= wire6;
            end
          else
            begin
              reg10 <= (-((wire0[(4'hb):(4'h8)] ?
                  $signed({reg9}) : wire6[(4'h8):(3'h4)]) ~^ $signed((|wire5))));
              reg11 <= wire2[(3'h4):(1'h1)];
              reg12 <= (^~(8'hb3));
              reg13 <= (+{wire6[(2'h2):(1'h1)]});
              reg14 <= (!reg13[(2'h3):(2'h3)]);
            end
          if ((reg10 ^ (wire6 ?
              (({wire2} ? reg10 : wire0[(3'h5):(3'h5)]) ?
                  $signed(((8'hb8) != wire6)) : ((~^reg12) + (reg8 >= reg10))) : (wire0[(3'h4):(3'h4)] + ($unsigned((8'hbc)) < (wire3 >= reg14))))))
            begin
              reg15 <= wire6;
            end
          else
            begin
              reg15 <= (~$unsigned(wire3));
              reg16 <= ($signed(wire6[(3'h6):(1'h0)]) < ((&(!$signed(reg7))) ?
                  (wire0 ?
                      ($unsigned(reg15) <<< (reg13 >= reg15)) : $signed((+wire6))) : reg14));
              reg17 <= (wire2[(3'h4):(1'h1)] ?
                  {(8'hac), reg15} : $signed($signed(wire1)));
              reg18 <= $signed($unsigned($signed(($unsigned(reg8) << reg10[(2'h3):(2'h2)]))));
            end
        end
    end
  assign wire19 = (((($signed(reg17) ? (+reg15) : wire0[(4'hd):(2'h2)]) ?
                              (+((8'hba) != wire2)) : $unsigned($signed(reg16))) ?
                          (^~$signed((|reg15))) : $signed(reg8)) ?
                      (((8'had) ?
                          wire1 : $unsigned((wire0 ?
                              reg11 : wire2))) >>> reg11[(5'h13):(3'h7)]) : wire6[(4'h8):(3'h4)]);
  assign wire20 = $signed((reg12[(2'h3):(1'h0)] <<< (+((7'h41) || (reg11 ~^ wire3)))));
  assign wire21 = reg18[(3'h4):(1'h0)];
endmodule
