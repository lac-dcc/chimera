module top
#(parameter param23 = (({(((8'hbc) ? (8'haa) : (8'hbf)) <<< (~^(8'hb6)))} << {{{(7'h44)}}}) ? ((^((~&(8'h9f)) ~^ ((8'hb8) ? (7'h43) : (7'h41)))) << (^~((|(8'hbc)) > ((8'hb3) ? (7'h43) : (8'haf))))) : (8'hbe)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg20,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = $signed(wire2[(5'h10):(2'h3)]);
  assign wire6 = $unsigned($unsigned(((&$signed(wire0)) != wire3[(2'h2):(1'h1)])));
  assign wire7 = $unsigned(wire5);
  assign wire8 = $signed({$signed(wire6[(5'h14):(2'h2)]),
                     (((~^wire0) ? wire5[(2'h3):(1'h1)] : (8'hbb)) ?
                         wire3[(3'h6):(3'h5)] : ($signed(wire2) ?
                             $unsigned(wire0) : (wire5 || (8'hb7))))});
  assign wire9 = $signed($unsigned((wire7 <= wire1[(5'h12):(4'ha)])));
  always
    @(posedge clk) begin
      if ((-wire0[(4'hd):(4'hd)]))
        begin
          reg10 <= $signed(wire9);
        end
      else
        begin
          reg10 <= ((~&$unsigned($signed((~|reg10)))) & wire5);
          reg11 <= ({wire5} ?
              {$signed(wire0),
                  ((wire9 ? wire0[(3'h5):(2'h3)] : $unsigned(wire1)) ?
                      wire2 : $signed((wire7 != wire1)))} : (|((&$signed(wire7)) ?
                  ((wire3 >> wire7) >= (wire0 ? wire2 : wire5)) : ((&(8'ha7)) ?
                      $unsigned((8'hab)) : (wire1 ? wire0 : wire7)))));
          reg12 <= ($unsigned($unsigned((wire4 ~^ (wire5 || wire7)))) >> wire1[(2'h3):(1'h0)]);
          if (wire4)
            begin
              reg13 <= (^~{(-(wire1[(4'h8):(2'h3)] ?
                      reg10 : (reg11 << wire2)))});
            end
          else
            begin
              reg13 <= (!wire5);
              reg14 <= (8'hba);
              reg15 <= ((($unsigned((wire7 ? wire4 : wire7)) ?
                      $unsigned($unsigned(wire8)) : wire3) ?
                  (~wire8[(3'h5):(1'h0)]) : (~{wire1[(5'h13):(5'h12)]})) == (8'ha0));
              reg16 <= $unsigned((reg12 ? wire3 : reg14[(3'h6):(1'h0)]));
            end
        end
    end
  assign wire17 = wire0;
  assign wire18 = wire6[(4'h8):(3'h5)];
  assign wire19 = $signed($signed((^~{wire0[(3'h6):(3'h6)]})));
  always
    @(posedge clk) begin
      reg20 <= wire18[(1'h0):(1'h0)];
    end
  assign wire21 = {$signed($unsigned(reg14[(5'h11):(4'h8)]))};
  assign wire22 = (8'h9d);
endmodule
