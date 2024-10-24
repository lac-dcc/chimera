module top
#(parameter param22 = {(((((7'h44) != (8'haf)) <<< ((8'hb4) >= (8'hba))) ? {((8'hb6) ^~ (8'h9c)), ((8'h9c) << (8'hb5))} : ((~(8'h9c)) ? {(8'hb4), (8'haa)} : ((8'ha2) ? (8'ha2) : (8'h9f)))) ? (({(8'ha4)} == (8'ha9)) || ({(8'ha2), (8'h9d)} && ((8'hba) ? (8'hac) : (8'h9f)))) : {(((8'hac) ? (8'hba) : (8'ha0)) ? (~&(8'hae)) : (&(7'h43)))}), (((((8'ha5) ? (8'hbc) : (8'h9f)) ^~ ((8'hac) ? (8'ha5) : (8'hbf))) < ((~|(8'hbf)) || ((8'hb8) ? (7'h40) : (8'hb4)))) ? ((((8'h9f) ? (8'ha6) : (8'hac)) >>> ((8'hbf) ? (8'h9e) : (8'h9d))) ? (^(~(8'hae))) : (8'ha7)) : (~{((8'hb5) <<< (7'h41)), ((8'h9d) ? (8'hbf) : (8'hb5))}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
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
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire3[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg5 <= wire0[(4'hf):(1'h0)];
      if (wire3[(4'h8):(3'h5)])
        begin
          reg6 <= wire0[(4'h9):(3'h6)];
          reg7 <= ($signed($signed(($unsigned(wire2) ?
              (wire1 ? wire0 : reg6) : {reg5, reg5}))) || reg6[(4'h8):(3'h6)]);
          reg8 <= (wire1 ?
              wire1[(1'h1):(1'h1)] : (-{(reg6 ?
                      wire0[(4'hd):(4'h8)] : {(8'hb8)}),
                  $unsigned((8'ha1))}));
        end
      else
        begin
          if ((~{wire1[(3'h5):(2'h3)],
              ($unsigned((reg7 ? (7'h42) : (8'hbd))) ?
                  (^reg7[(2'h2):(1'h0)]) : ((+(8'ha3)) | (8'hb9)))}))
            begin
              reg6 <= {{reg8,
                      ((~wire1[(3'h7):(3'h4)]) ?
                          {(8'ha5), reg7} : $unsigned(wire2))}};
              reg7 <= $unsigned($unsigned(wire3[(4'h9):(2'h2)]));
              reg8 <= ((wire0[(2'h3):(2'h2)] | reg7[(2'h2):(1'h1)]) ?
                  ((reg6[(3'h7):(1'h1)] ?
                          ($signed(wire0) * reg5[(3'h5):(2'h3)]) : (|(~^wire4))) ?
                      $signed(reg5[(2'h3):(2'h3)]) : $unsigned(wire4[(1'h1):(1'h0)])) : ($unsigned(reg5) ?
                      (+(-(wire0 | wire3))) : reg5[(3'h7):(3'h6)]));
            end
          else
            begin
              reg6 <= (|($unsigned($unsigned((8'ha0))) && $signed($signed(wire4[(4'he):(4'hb)]))));
            end
          if ($signed($unsigned((($signed((8'hae)) - wire4) ?
              reg8[(3'h4):(1'h1)] : $unsigned(((8'ha3) ? reg7 : wire3))))))
            begin
              reg9 <= $unsigned(wire1[(3'h7):(3'h6)]);
            end
          else
            begin
              reg9 <= (reg6[(1'h1):(1'h0)] ?
                  (((~$unsigned(reg7)) ?
                      wire4[(4'hf):(4'hd)] : reg9) & reg6) : (!(wire4[(3'h5):(1'h1)] ?
                      $unsigned($unsigned(wire4)) : $unsigned(((8'hbe) << wire4)))));
              reg10 <= (((~|wire3) ?
                  ((((8'ha0) ? wire2 : wire3) >> (|wire2)) ~^ {((8'ha6) ?
                          wire0 : wire3),
                      (reg8 > (8'hb8))}) : reg6) << $signed({reg6[(4'h8):(4'h8)],
                  {wire3, wire2}}));
              reg11 <= (|$signed((((wire0 ~^ reg8) ?
                  $signed(wire1) : $signed(wire4)) && $unsigned(reg8[(4'h9):(2'h3)]))));
              reg12 <= reg7[(4'h9):(2'h3)];
            end
          reg13 <= $signed(wire2[(4'hc):(3'h4)]);
        end
      if (reg10)
        begin
          reg14 <= {wire4[(5'h10):(1'h0)]};
          reg15 <= (~^(8'ha7));
        end
      else
        begin
          reg14 <= wire2;
          reg15 <= $unsigned($unsigned((~^wire1[(3'h4):(3'h4)])));
          reg16 <= (reg11 ?
              $signed((($unsigned(reg15) != (~|(8'h9f))) >= wire2[(3'h5):(2'h2)])) : {(!wire1[(3'h6):(3'h6)]),
                  (reg8[(3'h7):(1'h0)] ?
                      $signed(((8'ha8) ? wire0 : reg11)) : ((reg7 ?
                              reg10 : reg11) ?
                          reg9 : {reg5, wire2}))});
          reg17 <= (~|reg13[(1'h0):(1'h0)]);
          reg18 <= (~^((((reg8 ? reg17 : reg14) < (reg14 * (8'ha0))) && reg9) ?
              (~&$signed($unsigned(reg17))) : wire2));
        end
    end
  assign wire19 = ($signed((!wire4)) ?
                      ($unsigned(reg8) - ($unsigned((reg10 ?
                          reg18 : (8'had))) ^~ reg5[(4'hd):(2'h2)])) : wire0);
  assign wire20 = ({($signed($unsigned(wire1)) ?
                          $unsigned($unsigned((8'hbb))) : reg15[(2'h3):(2'h2)]),
                      wire1} == (!wire3[(4'h8):(3'h7)]));
  assign wire21 = (+$signed(reg13[(1'h0):(1'h0)]));
endmodule
