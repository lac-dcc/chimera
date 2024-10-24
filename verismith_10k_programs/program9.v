module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire10,
                 wire9,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = {wire3[(2'h3):(2'h3)], $unsigned({wire1[(4'hf):(4'h8)]})};
  always
    @(posedge clk) begin
      reg6 <= (((-$unsigned((wire5 ?
              wire4 : (8'ha2)))) + wire5[(3'h4):(3'h4)]) ?
          ($unsigned($signed((-wire1))) < ($signed((wire0 ?
              (8'hbc) : wire2)) >>> wire1[(3'h4):(3'h4)])) : (~|{$unsigned($signed(wire1)),
              $unsigned($unsigned(wire0))}));
      reg7 <= (~|$signed($unsigned($unsigned(wire2[(4'hd):(4'hd)]))));
    end
  always
    @(posedge clk) begin
      reg8 <= (^reg7[(4'hd):(3'h4)]);
    end
  assign wire9 = (~&($signed(($signed(reg8) ~^ (wire2 ?
                     (8'ha2) : (8'hba)))) >= ({(~|(8'ha3)), $signed(wire2)} ?
                     reg7 : wire5)));
  assign wire10 = reg8[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg11 <= wire5;
      reg12 <= (&($unsigned((wire2 ?
          reg11[(3'h4):(1'h0)] : $signed(wire2))) * wire10));
      if ((^~(~&reg6[(2'h2):(1'h0)])))
        begin
          reg13 <= wire10;
        end
      else
        begin
          reg13 <= (^($signed(reg12) == (!reg7)));
          if (({wire4[(3'h4):(1'h1)]} ? reg6[(3'h4):(1'h0)] : (~^wire0)))
            begin
              reg14 <= ($signed((((|reg13) ? reg11 : (wire4 >= wire9)) ?
                      $unsigned(reg7) : ((wire1 ? reg6 : reg12) ?
                          wire10 : (+reg7)))) ?
                  reg13[(4'hf):(3'h7)] : ({(|$unsigned(wire2)),
                      (((8'hb7) ? wire0 : wire9) ?
                          $unsigned(wire0) : $unsigned(reg8))} != wire9));
            end
          else
            begin
              reg14 <= $unsigned((wire10 ?
                  ($unsigned(wire1[(5'h10):(4'hf)]) ?
                      ((wire4 ?
                          wire0 : wire2) <= reg13[(5'h10):(2'h2)]) : wire10[(1'h0):(1'h0)]) : (|($unsigned(wire5) ^~ $signed(reg14)))));
              reg15 <= $unsigned($unsigned(((((8'h9e) != wire2) ^~ $signed(reg6)) ?
                  $signed({wire5, wire9}) : wire5)));
              reg16 <= {$signed($signed((-(8'h9f))))};
              reg17 <= $signed($unsigned(((~|((8'ha9) + wire2)) + ({wire4} ?
                  (wire4 ? (8'hb2) : wire5) : (reg14 > wire3)))));
            end
        end
    end
  assign wire18 = ({reg11[(3'h6):(1'h0)], $unsigned(reg12)} ?
                      (($unsigned($signed(reg13)) * (~(reg6 ?
                          reg16 : reg15))) < $signed(reg12[(3'h5):(2'h3)])) : (+reg12));
  assign wire19 = ({wire0, $signed((!(reg12 ? (8'ha1) : reg7)))} ?
                      wire18 : reg13);
endmodule
