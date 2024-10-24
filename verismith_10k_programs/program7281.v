module top
#(parameter param19 = ({(8'hb1), ({((8'h9d) < (8'hb1))} ? ((~&(7'h44)) <<< (+(7'h42))) : ((8'hb9) ? (^(8'ha9)) : {(8'ha8)}))} || (((~&((8'hab) ? (8'ha2) : (8'h9e))) <= (&{(7'h40), (8'ha8)})) ? ((((8'hbb) | (8'haf)) ? ((8'haf) ? (8'ha2) : (8'hb6)) : ((7'h41) && (8'hbd))) ? (((8'hb3) + (8'hb0)) <= (!(8'ha3))) : (~&((8'hb5) ? (8'ha4) : (8'hb3)))) : ({((8'h9c) ? (8'ha4) : (8'hb0)), {(8'hb7)}} ? {{(8'had)}} : ((|(8'hb3)) ? ((7'h44) >>> (8'ha8)) : (-(8'hba)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg4 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(wire3);
      reg5 <= $unsigned($unsigned((^~$signed((+wire3)))));
      if ({($signed((~(wire0 << wire3))) ?
              {({wire1} ? (reg5 ? wire3 : wire2) : $signed(wire1))} : (-{{wire3,
                      reg5},
                  (^wire2)}))})
        begin
          reg6 <= (^$signed($unsigned((^(reg4 + wire2)))));
          if ((-reg6))
            begin
              reg7 <= ((&$signed(wire2)) * $signed((~|($signed(reg6) * (^~wire2)))));
            end
          else
            begin
              reg7 <= $signed((!wire0[(2'h3):(2'h3)]));
              reg8 <= (~&$unsigned((!($signed((7'h43)) ^ {reg7}))));
            end
          reg9 <= wire1;
          if ($signed($signed(wire2)))
            begin
              reg10 <= ((8'had) << $unsigned($unsigned(({wire1} ?
                  (reg4 >> wire0) : reg6))));
              reg11 <= ($signed((~|reg6[(2'h3):(1'h1)])) >>> $unsigned(($signed(wire0) >> {{reg5}})));
              reg12 <= reg5;
              reg13 <= reg5;
              reg14 <= $unsigned(wire1);
            end
          else
            begin
              reg10 <= $signed(($signed(wire0) ?
                  $unsigned(reg8) : ((~^(wire1 ?
                      reg8 : (8'haf))) | reg4[(3'h4):(1'h0)])));
              reg11 <= (~|(|{reg7}));
            end
        end
      else
        begin
          reg6 <= reg11[(4'ha):(3'h7)];
          reg7 <= reg10[(4'hf):(4'hb)];
          reg8 <= reg6;
          reg9 <= $unsigned(($signed((-(~&(8'hb5)))) - $signed(($signed(wire2) ?
              $signed(reg6) : (wire3 ? wire3 : reg8)))));
          reg10 <= ($signed($unsigned(reg14[(3'h5):(2'h3)])) != $signed((wire2[(4'ha):(4'h8)] ?
              reg5 : reg5[(4'ha):(4'h8)])));
        end
      reg15 <= (8'hbe);
    end
  assign wire16 = $unsigned((&$signed({$signed(reg10)})));
  assign wire17 = (wire1[(4'h9):(3'h5)] && (^~$unsigned($signed({reg4}))));
  assign wire18 = wire16[(1'h1):(1'h1)];
endmodule
