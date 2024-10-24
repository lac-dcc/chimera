module top
#(parameter param24 = (^(8'ha2)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire8;
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire8,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3[(5'h15):(4'h8)];
      if ($unsigned((wire2 * (($signed(reg4) ?
          $signed(wire0) : wire2) * reg4[(3'h5):(3'h5)]))))
        begin
          if ((~|wire1[(3'h7):(3'h5)]))
            begin
              reg5 <= $unsigned($signed($signed((!(wire0 ? wire2 : wire2)))));
              reg6 <= $signed(wire1[(3'h4):(1'h0)]);
            end
          else
            begin
              reg5 <= (wire3 ?
                  $signed($unsigned(((wire0 ^~ reg4) ~^ (wire3 ?
                      (8'h9d) : wire0)))) : (^(wire2[(4'hc):(4'h9)] ?
                      $signed({wire1}) : $unsigned((wire0 ? (8'hb1) : reg5)))));
            end
        end
      else
        begin
          reg5 <= $signed(reg6[(3'h5):(2'h2)]);
        end
      reg7 <= reg6;
    end
  assign wire8 = (~^reg5[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      reg9 <= reg4[(3'h5):(3'h4)];
      reg10 <= $signed(($unsigned((reg9[(1'h0):(1'h0)] ?
          $signed(wire2) : (reg6 ?
              reg6 : (8'ha3)))) <= $signed((reg6[(1'h1):(1'h1)] - reg9))));
    end
  assign wire11 = ($unsigned((+{$signed((8'ha6))})) ?
                      $signed($signed(reg6[(3'h4):(1'h1)])) : ((~|(&(wire0 ?
                              wire1 : reg7))) ?
                          ($unsigned((wire1 ? reg9 : (7'h44))) ?
                              reg6[(2'h2):(2'h2)] : reg6[(1'h0):(1'h0)]) : ($unsigned($signed(reg5)) ^ reg5[(1'h0):(1'h0)])));
  assign wire12 = wire8[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if ((+reg5))
        begin
          reg13 <= $unsigned(($unsigned({(8'ha2),
              wire8[(3'h4):(2'h2)]}) | ((8'hbc) ~^ {$unsigned((8'hbc)),
              reg7})));
          reg14 <= wire11;
          reg15 <= (!(~&reg13[(3'h4):(1'h0)]));
          if (reg4)
            begin
              reg16 <= {($signed($unsigned((~^reg4))) ?
                      ($unsigned(wire8[(3'h5):(2'h2)]) ?
                          (reg14[(1'h0):(1'h0)] ~^ {(8'hae)}) : ((wire11 ?
                              wire1 : wire12) & wire0)) : ((^(^~reg10)) ?
                          {reg5[(3'h5):(2'h2)], $unsigned(wire3)} : {(|reg5)})),
                  reg10[(3'h5):(2'h2)]};
              reg17 <= (-(({$unsigned(wire12)} * $signed((8'hb4))) ?
                  (~^((&reg10) ?
                      (wire3 >> reg7) : $unsigned(reg6))) : ($signed({wire0}) ?
                      $signed(reg15[(3'h6):(3'h6)]) : $unsigned({reg6}))));
            end
          else
            begin
              reg16 <= (-$signed(reg10[(3'h7):(3'h7)]));
              reg17 <= $unsigned($unsigned({{reg15}}));
              reg18 <= (^$unsigned($unsigned(((^~reg10) ? wire3 : {wire12}))));
              reg19 <= wire8;
            end
          reg20 <= (~^(~|wire8[(3'h4):(3'h4)]));
        end
      else
        begin
          reg13 <= (-wire0[(4'ha):(3'h6)]);
        end
      reg21 <= wire2;
      reg22 <= $unsigned($signed(($unsigned((7'h41)) > (reg14[(1'h0):(1'h0)] ?
          ((8'h9c) * reg20) : {reg10}))));
      reg23 <= reg19[(3'h7):(3'h7)];
    end
endmodule
