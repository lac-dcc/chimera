module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed(wire2[(5'h10):(3'h4)]);
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg5 <= ((-$signed($signed(wire2))) || ({$unsigned((wire2 && (8'haf)))} && $signed((+((8'hb4) == wire4)))));
          if ((^((wire1[(3'h5):(3'h5)] ?
                  $unsigned(reg5[(5'h12):(5'h11)]) : ((^wire2) <= ((8'hb6) < reg5))) ?
              {$unsigned(((8'hbb) ? wire3 : wire4)),
                  $signed($signed(wire4))} : (($unsigned(wire0) ?
                  $signed(wire0) : wire4) > $signed($signed(wire4))))))
            begin
              reg6 <= $signed($unsigned((reg5 < ((reg5 ? (8'ha1) : wire3) ?
                  (~wire0) : $signed(wire0)))));
              reg7 <= $unsigned($signed(($unsigned((wire0 ?
                  wire3 : reg5)) >= $signed(reg5))));
            end
          else
            begin
              reg6 <= ({$signed($unsigned(wire3)),
                  $signed({$unsigned(wire2)})} >> $signed((wire0 | $signed($unsigned((7'h40))))));
              reg7 <= reg5;
            end
        end
      else
        begin
          if ({wire4,
              (~&((!(reg7 ? reg7 : wire2)) ?
                  wire1[(4'hb):(4'ha)] : $signed($signed((8'hb3)))))})
            begin
              reg5 <= ((+($unsigned((reg7 ~^ wire0)) ~^ $signed($signed(wire4)))) ?
                  reg7[(5'h15):(3'h6)] : (wire1[(4'ha):(4'h8)] ?
                      $unsigned($unsigned(wire3[(3'h5):(3'h5)])) : wire0));
              reg6 <= (($unsigned((wire0[(4'h9):(3'h4)] ?
                      $signed(wire4) : (8'hb0))) || ((wire2 + {wire4, reg5}) ?
                      {(wire4 << wire1), $signed(wire2)} : (wire4 && {wire0,
                          reg6}))) ?
                  $signed(wire2[(4'h9):(4'h8)]) : wire2);
              reg7 <= wire4;
            end
          else
            begin
              reg5 <= $unsigned(wire4);
              reg6 <= (($signed(wire3[(4'hd):(2'h3)]) != $signed(wire4[(4'ha):(3'h5)])) >>> $signed($unsigned($unsigned((wire0 >>> wire0)))));
              reg7 <= (8'h9c);
            end
          reg8 <= $signed((reg7 ?
              wire1 : (reg6 ?
                  reg7[(5'h12):(3'h5)] : ((~|reg6) ?
                      $unsigned(reg6) : (^reg5)))));
          reg9 <= (($unsigned(($unsigned(reg5) <<< $unsigned(wire3))) ?
              $signed(((reg5 & wire1) > $unsigned((7'h41)))) : reg8[(4'h8):(2'h2)]) >= $signed(($unsigned($unsigned(wire2)) >> ((+wire3) + $signed(reg8)))));
        end
    end
  assign wire10 = reg6[(1'h1):(1'h0)];
  assign wire11 = ({$unsigned(($signed(reg9) == {wire4}))} ?
                      $unsigned(wire1[(5'h12):(2'h2)]) : $signed(((!(wire4 ?
                          reg9 : (8'hbe))) <= ($signed(wire2) || ((8'hb1) ?
                          reg7 : wire10)))));
  assign wire12 = reg9[(1'h1):(1'h1)];
endmodule
