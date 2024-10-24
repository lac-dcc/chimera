module top
#(parameter param23 = (~&((^~{((7'h41) ? (8'hbe) : (8'had))}) <= ((((7'h43) <<< (8'ha0)) | {(8'hb2)}) && (~&(^~(8'ha7)))))), 
parameter param24 = param23)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire10,
                 wire9,
                 wire8,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire2[(3'h6):(1'h0)];
  assign wire5 = $unsigned((&$unsigned(wire1)));
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned($signed($unsigned(wire5))));
      reg7 <= $signed((~&(&(wire1 >>> wire5[(2'h3):(1'h0)]))));
    end
  assign wire8 = $signed($signed((-wire4[(1'h0):(1'h0)])));
  assign wire9 = wire4[(2'h3):(1'h0)];
  assign wire10 = $signed($signed($unsigned($signed($unsigned(wire4)))));
  always
    @(posedge clk) begin
      reg11 <= ((^~((^~{wire9}) < (+(wire5 ?
          wire9 : wire8)))) >= $signed((((wire3 ? wire3 : (8'hba)) ?
              {wire8, wire3} : (wire8 ? wire5 : reg6)) ?
          ({reg7, (8'hb5)} ? $signed(wire0) : wire3) : $unsigned((8'hae)))));
      if ($unsigned($unsigned({(^~$unsigned(wire5)), $unsigned(reg11)})))
        begin
          reg12 <= $signed(({(&$unsigned((8'hb0)))} ?
              (7'h42) : {(-reg6), $unsigned((|reg6))}));
          reg13 <= ($unsigned($unsigned(({reg11} ?
              (wire4 && wire10) : {reg11}))) && (|(reg6[(5'h12):(5'h11)] ?
              (^~$unsigned(reg12)) : $unsigned($signed(reg11)))));
          reg14 <= ($signed((((wire8 ^ (7'h41)) <<< (reg12 - wire8)) <= {reg7,
              reg7})) != wire5[(3'h7):(3'h5)]);
          reg15 <= $signed($unsigned({wire3}));
          reg16 <= (~&({(~|{reg11}), reg7[(2'h3):(2'h2)]} ?
              $signed($unsigned((~wire0))) : (^({(8'hb0)} ?
                  wire0[(5'h10):(2'h2)] : (wire4 ? reg11 : reg6)))));
        end
      else
        begin
          reg12 <= $unsigned((8'hac));
          reg13 <= wire4;
          if ($unsigned($unsigned($unsigned((~|(~|reg12))))))
            begin
              reg14 <= $signed(reg7[(1'h1):(1'h0)]);
              reg15 <= wire0[(5'h11):(3'h7)];
              reg16 <= (~&(8'h9c));
            end
          else
            begin
              reg14 <= (wire0[(4'h8):(2'h3)] ?
                  (^wire9) : $signed(reg15[(3'h5):(1'h0)]));
              reg15 <= reg6[(5'h10):(4'h9)];
            end
          reg17 <= ((8'h9f) ? $unsigned(wire0[(4'hc):(3'h4)]) : $signed(reg7));
          reg18 <= (wire5 > ((reg14[(3'h4):(3'h4)] <<< {wire5[(3'h6):(2'h3)],
                  (+(8'had))}) ?
              $signed(reg7[(1'h1):(1'h1)]) : wire10[(3'h7):(3'h5)]));
        end
    end
  assign wire19 = reg12;
  assign wire20 = reg17;
  assign wire21 = (($unsigned($signed(((7'h44) ?
                          (8'h9d) : wire4))) >= $signed((wire0 ^~ (&reg18)))) ?
                      $unsigned($signed((8'hae))) : wire3[(3'h7):(3'h7)]);
  assign wire22 = wire0[(1'h0):(1'h0)];
endmodule
