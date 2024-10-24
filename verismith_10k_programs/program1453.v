module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire4,
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
  assign wire4 = wire0[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= ($unsigned((wire0 ?
              (((8'h9e) << wire0) ?
                  $signed(wire4) : wire4[(4'hd):(1'h0)]) : ($unsigned(wire4) >> (wire2 || wire4)))) ?
          $signed(wire3[(2'h2):(1'h0)]) : ((8'had) ~^ wire0));
      reg6 <= (8'hb3);
      if ($signed((((wire1 | wire3[(3'h4):(1'h0)]) ?
              ((wire4 << reg6) ?
                  (wire3 * wire2) : $unsigned((8'hb9))) : wire3) ?
          wire4 : {$unsigned(reg5),
              ((~reg6) ? wire2[(4'hf):(4'h9)] : {wire2})})))
        begin
          reg7 <= $unsigned($unsigned($signed(wire2[(4'he):(1'h1)])));
        end
      else
        begin
          reg7 <= (^~({$unsigned(((8'ha2) ? reg5 : wire1))} ?
              wire2[(5'h10):(3'h7)] : wire1[(4'hb):(3'h7)]));
          if ($signed((+{reg6, reg7[(3'h7):(3'h5)]})))
            begin
              reg8 <= $unsigned(((wire4 ? reg5 : (+(~&reg6))) ?
                  (^~(&(reg5 ^~ wire0))) : wire4[(4'hc):(4'ha)]));
              reg9 <= (reg7 <<< ({wire0} ^~ (~&(^~{wire4, wire1}))));
              reg10 <= reg9[(3'h5):(1'h1)];
            end
          else
            begin
              reg8 <= $unsigned(wire4[(3'h4):(1'h1)]);
              reg9 <= (&(7'h40));
              reg10 <= $signed((~|{(reg10[(4'h9):(3'h7)] ?
                      {wire0} : {wire2, reg10}),
                  (~|reg8)}));
              reg11 <= {$unsigned($signed($signed($unsigned(wire2))))};
              reg12 <= $signed((reg7 ?
                  (&(+$signed(wire1))) : wire2[(3'h4):(1'h0)]));
            end
          reg13 <= reg8;
          reg14 <= ($unsigned({$signed((^wire4)),
                  ({reg13} ? (reg9 ^~ reg5) : wire1[(1'h1):(1'h0)])}) ?
              (8'ha0) : (7'h41));
          reg15 <= $unsigned((($signed((reg11 ^~ wire1)) >>> reg5) ~^ ($unsigned((reg5 * wire1)) >> reg13[(4'he):(2'h3)])));
        end
    end
  assign wire16 = {{$unsigned($unsigned((~wire1))), reg14},
                      $unsigned($signed(reg13))};
  assign wire17 = $signed((($signed(reg13[(4'hb):(3'h5)]) * $unsigned($unsigned(reg9))) ?
                      reg5 : (((wire16 ? (8'ha5) : reg13) ^~ reg12) ?
                          $unsigned((~^wire2)) : wire3[(2'h3):(2'h2)])));
  assign wire18 = ($unsigned($unsigned($signed($signed(reg10)))) >= ((((reg7 ?
                              wire3 : reg12) != $signed(reg14)) ?
                          {wire4} : (|reg10[(4'hd):(2'h2)])) ?
                      wire3[(3'h5):(1'h1)] : $unsigned(wire17)));
endmodule
