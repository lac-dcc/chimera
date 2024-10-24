module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire6,
                 wire5,
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
  assign wire5 = ((!wire0) == wire1[(1'h1):(1'h1)]);
  assign wire6 = (($unsigned(($signed(wire4) ^~ (~wire0))) ^~ (wire2[(2'h2):(1'h0)] ?
                         ((~|wire5) > $unsigned(wire0)) : $unsigned(wire3))) ?
                     ($signed(wire3[(4'he):(1'h1)]) ?
                         (~&$signed(wire5[(5'h14):(5'h13)])) : $signed(($signed((8'hac)) <= wire3))) : (wire0 ?
                         ($signed(((8'hae) >> wire1)) ^~ $unsigned((~wire5))) : wire5[(3'h5):(1'h0)]));
  always
    @(posedge clk) begin
      reg7 <= wire5[(4'ha):(3'h7)];
      if ((((8'hae) ?
              $signed((((8'hb3) | wire0) ?
                  (!wire4) : ((8'haf) && reg7))) : $signed(wire1)) ?
          $unsigned(reg7) : $unsigned(wire2[(4'h8):(4'h8)])))
        begin
          reg8 <= $signed(($unsigned(wire1[(3'h6):(1'h1)]) < (wire4[(3'h6):(3'h5)] && ((reg7 << reg7) ?
              ((8'hbc) ? wire3 : wire4) : $signed(wire1)))));
          reg9 <= $signed((!reg8));
        end
      else
        begin
          if ((reg7[(3'h6):(1'h0)] ?
              $unsigned($unsigned(((&(8'hb5)) ?
                  $signed(wire6) : {wire5,
                      (8'ha6)}))) : $signed((reg7[(4'hb):(4'hb)] ?
                  $unsigned((~(8'ha0))) : $unsigned($signed((7'h42)))))))
            begin
              reg8 <= $unsigned((~^wire1));
              reg9 <= $signed(wire6);
              reg10 <= $signed($unsigned($signed(((reg9 ?
                  (8'hba) : wire3) <= $unsigned(reg9)))));
            end
          else
            begin
              reg8 <= wire6[(1'h0):(1'h0)];
              reg9 <= $signed({wire2[(4'h9):(4'h8)], wire1});
              reg10 <= {$signed({{$unsigned((8'ha0)), (wire2 >>> wire2)},
                      $signed((~|wire5))})};
            end
          reg11 <= $signed(reg8);
        end
      reg12 <= wire5[(4'hb):(3'h4)];
      if ($signed(($unsigned($signed((^~reg10))) != (reg8 >= ((wire2 ?
              (8'hbe) : wire5) ?
          wire0[(4'hc):(3'h7)] : $signed(reg11))))))
        begin
          reg13 <= (8'ha1);
          reg14 <= ({($signed({reg7, wire6}) >= ((+reg9) & (~reg12))),
              (reg9[(3'h7):(2'h3)] ?
                  (~|$signed(wire6)) : reg9[(4'hf):(3'h6)])} ^ (($unsigned((wire4 ?
                  reg13 : reg10)) >= wire1) ?
              (^wire1[(1'h0):(1'h0)]) : wire3[(1'h0):(1'h0)]));
        end
      else
        begin
          reg13 <= (&(~&$signed(reg14)));
          reg14 <= ($signed($unsigned(wire1)) ?
              $signed(reg9[(3'h7):(3'h6)]) : wire5);
          reg15 <= reg7;
          reg16 <= $unsigned(($unsigned((+$unsigned(reg13))) ?
              (reg10[(1'h0):(1'h0)] ?
                  ((~^wire0) & $signed(reg10)) : (+$signed(wire3))) : (~|(~|$unsigned((8'hab))))));
        end
      reg17 <= ($unsigned(wire3) > {$unsigned((wire4 ?
              $unsigned(wire6) : reg12[(4'h8):(3'h7)])),
          $signed(reg13)});
    end
  always
    @(posedge clk) begin
      reg18 <= (reg10 ?
          $signed((wire2[(1'h0):(1'h0)] + $unsigned((reg10 > (7'h40))))) : wire3);
      reg19 <= {$signed(((|{reg8, reg12}) + (^~(reg15 | reg9)))),
          reg15[(4'h9):(3'h5)]};
    end
  assign wire20 = (~$signed($unsigned((~$signed((8'hae))))));
  assign wire21 = {reg8};
  assign wire22 = $signed(((+$signed((^~reg12))) ?
                      $signed((^~reg16[(2'h2):(1'h0)])) : reg13));
  assign wire23 = $signed($unsigned((reg18 == reg9[(4'hf):(3'h4)])));
  assign wire24 = $unsigned($signed($signed((~|reg8[(3'h6):(3'h6)]))));
endmodule
