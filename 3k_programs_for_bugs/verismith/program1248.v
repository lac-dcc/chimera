module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire2[(4'h8):(3'h4)];
  assign wire5 = $unsigned(wire3[(3'h7):(3'h6)]);
  always
    @(posedge clk) begin
      if (((~wire1) <= $signed($signed((+(&wire1))))))
        begin
          reg6 <= (wire0 > wire3[(3'h6):(2'h2)]);
          reg7 <= (^~wire3[(3'h7):(2'h3)]);
          if ($unsigned(((($unsigned(reg7) * (~&reg7)) ?
              wire2[(4'h8):(4'h8)] : ($signed(wire3) ?
                  ((8'ha9) ^ wire0) : reg7[(4'hb):(1'h0)])) ^~ wire1)))
            begin
              reg8 <= ($signed($unsigned(wire3[(3'h4):(1'h0)])) * (wire5[(4'ha):(3'h5)] ?
                  {($unsigned(wire1) >>> $signed((8'hb0)))} : reg6[(4'h9):(3'h5)]));
              reg9 <= (^($unsigned((|(8'ha4))) || $signed(reg8[(1'h1):(1'h1)])));
              reg10 <= ((&(^~$unsigned($unsigned(reg8)))) ?
                  (8'hb6) : wire2[(1'h0):(1'h0)]);
            end
          else
            begin
              reg8 <= ($signed(($unsigned({wire2,
                      wire2}) << wire2[(2'h2):(2'h2)])) ?
                  $unsigned((^$signed(wire0[(2'h3):(1'h0)]))) : $signed((({(8'haf),
                              wire2} ?
                          wire5[(5'h13):(4'h9)] : reg9) ?
                      ($signed((8'hba)) ?
                          (&reg8) : reg9) : $unsigned($signed((8'h9c))))));
            end
          reg11 <= (wire0[(4'h9):(2'h3)] ?
              {(reg10[(3'h4):(3'h4)] ? reg8 : {(reg10 << wire4)}),
                  (wire3 ?
                      $signed((wire5 <<< reg8)) : (8'hb9))} : $unsigned(((reg6[(1'h0):(1'h0)] ?
                  reg9 : (reg10 < (8'ha3))) | (wire3[(4'ha):(1'h1)] ^ reg9[(4'hc):(3'h4)]))));
        end
      else
        begin
          reg6 <= reg10[(4'hc):(3'h5)];
          reg7 <= reg10;
          if ($signed({wire1}))
            begin
              reg8 <= $signed((reg6 ? $unsigned(wire1[(4'ha):(4'h9)]) : wire0));
              reg9 <= wire2[(4'hd):(4'h9)];
            end
          else
            begin
              reg8 <= (+$signed((|reg10)));
              reg9 <= (!$signed(wire4[(4'he):(3'h7)]));
              reg10 <= {reg9};
            end
          if (((8'hb7) ?
              {$signed($unsigned({(8'h9c)}))} : wire2[(2'h2):(1'h1)]))
            begin
              reg11 <= $unsigned(reg8[(5'h12):(4'he)]);
              reg12 <= $signed(reg8[(3'h6):(3'h4)]);
              reg13 <= $signed(((reg12[(1'h1):(1'h1)] ?
                  reg11[(4'h8):(3'h7)] : (reg10 ?
                      reg11 : $unsigned(reg12))) <<< {(~&(reg8 ?
                      reg10 : (8'h9e)))}));
              reg14 <= (($unsigned(($unsigned(reg8) >= (~|(8'ha8)))) ?
                  (reg10[(3'h4):(3'h4)] | {(~&reg10)}) : wire1[(4'h8):(2'h3)]) >= reg9[(5'h14):(1'h1)]);
              reg15 <= $unsigned(reg9[(5'h15):(3'h4)]);
            end
          else
            begin
              reg11 <= {$signed($signed((reg15 | reg10)))};
              reg12 <= (8'ha6);
            end
        end
      reg16 <= {{(^$unsigned(reg15[(4'h9):(3'h7)]))}};
    end
  assign wire17 = ({wire2} <<< $unsigned(wire0[(1'h1):(1'h0)]));
  assign wire18 = reg16;
endmodule
