module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire4,
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
  assign wire4 = ({(7'h41)} ?
                     $unsigned(wire0[(3'h4):(1'h1)]) : wire0[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ($unsigned((8'ha6)))
        begin
          reg5 <= ({wire3[(3'h4):(3'h4)]} ? wire1 : wire0[(1'h0):(1'h0)]);
          reg6 <= $unsigned((wire2 ?
              wire0[(2'h3):(1'h0)] : wire1[(2'h2):(1'h1)]));
        end
      else
        begin
          reg5 <= (wire0 ?
              reg6[(1'h0):(1'h0)] : ($unsigned($unsigned((wire4 ?
                      reg6 : wire1))) ?
                  wire4 : ((~|(~&wire4)) ?
                      $signed(wire1[(1'h0):(1'h0)]) : (~^reg5[(1'h1):(1'h1)]))));
          reg6 <= ((+wire0) == (($signed(reg5) ~^ wire1[(2'h3):(1'h1)]) >> ($signed($signed(reg6)) >>> (wire4 ?
              wire2 : wire1[(3'h4):(3'h4)]))));
          reg7 <= reg6[(3'h5):(3'h5)];
          if ((+wire3))
            begin
              reg8 <= ($signed(wire3) ? (~^$signed(reg7)) : reg6);
            end
          else
            begin
              reg8 <= (reg7[(4'h8):(3'h7)] >>> wire4[(3'h4):(2'h3)]);
              reg9 <= reg7[(2'h3):(2'h2)];
            end
          reg10 <= ($signed(($signed({wire3}) ?
              (reg8[(4'h8):(1'h0)] ?
                  wire0[(1'h0):(1'h0)] : wire4) : ($signed(wire4) ?
                  $unsigned(wire1) : $signed((7'h40))))) >> wire1[(1'h1):(1'h0)]);
        end
      reg11 <= $signed((-wire4[(2'h3):(2'h2)]));
      if (((|reg8[(2'h3):(2'h2)]) <<< wire3[(3'h4):(1'h0)]))
        begin
          if ((8'hac))
            begin
              reg12 <= {(8'hb8)};
              reg13 <= wire4;
              reg14 <= reg13[(1'h1):(1'h1)];
            end
          else
            begin
              reg12 <= ($signed($unsigned(($unsigned(reg13) ?
                  $signed(reg11) : reg14[(2'h3):(2'h3)]))) - ($unsigned(wire2[(1'h1):(1'h0)]) ?
                  (^~reg10) : reg8));
            end
        end
      else
        begin
          reg12 <= (((($signed(wire4) ?
              wire4 : {reg6,
                  reg13}) >= $signed(reg6[(3'h6):(3'h6)])) ~^ ((reg10 ~^ (reg6 ?
              reg14 : wire4)) << (wire1[(1'h0):(1'h0)] || (reg10 != wire2)))) >> ($unsigned({{reg14}}) ?
              {{$signed((8'ha3)), (~|reg11)}} : $signed(reg10[(3'h6):(1'h1)])));
          reg13 <= (~&$signed((-reg14[(4'h9):(1'h0)])));
          reg14 <= reg14[(1'h0):(1'h0)];
        end
    end
  assign wire15 = $unsigned(reg9[(3'h7):(3'h6)]);
  assign wire16 = $unsigned(({{wire2}} ?
                      (^reg13[(3'h7):(2'h3)]) : (^$unsigned($unsigned(wire15)))));
  assign wire17 = ((reg7[(4'he):(4'h8)] ?
                      (^reg12) : $signed($signed($unsigned(reg13)))) ~^ (reg6 >> $signed((~^(wire16 > (7'h43))))));
  assign wire18 = ($unsigned(wire3[(4'h9):(3'h7)]) == reg13[(4'hb):(3'h7)]);
  assign wire19 = $signed($signed((~{reg14[(3'h6):(1'h1)], (-wire2)})));
  assign wire20 = $signed($unsigned(reg8));
  assign wire21 = {(~|reg11[(4'hd):(3'h4)])};
endmodule
