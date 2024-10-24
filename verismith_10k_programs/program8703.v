module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 reg20,
                 reg19,
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
  assign wire5 = (wire4 ?
                     $signed($signed(((+wire1) ?
                         (wire4 ?
                             wire3 : wire2) : (~wire0)))) : ($unsigned(wire4) ?
                         $signed(wire3) : wire1[(4'h8):(3'h5)]));
  assign wire6 = (~&(^~$unsigned($signed(wire4))));
  always
    @(posedge clk) begin
      reg7 <= $signed($signed(((-(wire4 ?
          wire6 : (8'hba))) || $unsigned(wire6[(1'h0):(1'h0)]))));
      reg8 <= wire0;
      if ((wire0 ? wire6[(2'h2):(2'h2)] : (~^((7'h42) != reg7[(4'ha):(3'h4)]))))
        begin
          reg9 <= wire5;
        end
      else
        begin
          reg9 <= (~&({(!wire5)} <<< wire5[(3'h7):(1'h1)]));
        end
      reg10 <= $unsigned($unsigned(((7'h41) ?
          wire6[(2'h2):(1'h0)] : ((wire1 << reg7) ?
              wire4 : $unsigned((8'haa))))));
    end
  always
    @(posedge clk) begin
      reg11 <= (reg9 || ((8'hb6) != $signed(wire1[(1'h1):(1'h0)])));
      if ((wire3 ?
          ($unsigned((reg9 ?
              {wire4,
                  wire0} : wire0[(1'h0):(1'h0)])) >= (~^$signed((|wire5)))) : ({(wire5 ?
                      $signed(wire4) : wire5),
                  $unsigned((reg10 == reg8))} ?
              $signed(($signed(wire4) == (reg9 ?
                  reg10 : (8'hab)))) : (((+wire2) ? {wire4} : reg11) - wire2))))
        begin
          reg12 <= $signed((~|(wire0[(1'h1):(1'h1)] ?
              reg7 : (-$unsigned(reg7)))));
          if (reg11[(3'h4):(1'h1)])
            begin
              reg13 <= ($signed(wire0) >= (wire5 << (((reg8 ?
                  reg7 : wire4) ^~ (wire5 ^~ reg8)) || wire4)));
              reg14 <= {((+reg12) ?
                      ((&wire5[(4'hc):(4'hc)]) ?
                          wire5 : (8'hb8)) : $unsigned(wire1)),
                  (^~wire2[(2'h3):(2'h2)])};
              reg15 <= {({(-(&wire5)),
                      (~|(wire1 >= wire4))} & wire4[(4'h8):(1'h0)])};
              reg16 <= (^~wire6[(1'h1):(1'h1)]);
              reg17 <= wire6;
            end
          else
            begin
              reg13 <= wire6[(2'h2):(2'h2)];
            end
          reg18 <= {(({$signed(reg15),
                  (~^wire2)} <= (reg17 >>> reg11[(3'h5):(3'h4)])) ^ {$unsigned(((8'haf) - reg12))}),
              reg8[(1'h1):(1'h1)]};
          reg19 <= {$signed(((!reg9[(2'h2):(2'h2)]) & ({reg15} | ((8'h9d) >>> reg8))))};
          reg20 <= reg9;
        end
      else
        begin
          if ($signed(wire3))
            begin
              reg12 <= ((^~$unsigned($signed((reg9 ^~ wire3)))) * (($unsigned(reg19[(4'ha):(2'h3)]) ?
                      reg18 : ($unsigned(reg12) && $signed((8'had)))) ?
                  (8'hb3) : reg16[(2'h2):(2'h2)]));
            end
          else
            begin
              reg12 <= (+wire1);
              reg13 <= wire1[(4'h9):(2'h3)];
            end
          reg14 <= {$signed($unsigned($signed((wire2 ? reg10 : reg13))))};
          reg15 <= reg11[(2'h2):(2'h2)];
          reg16 <= (8'ha9);
          reg17 <= $signed(wire4);
        end
    end
endmodule
