module top
#(parameter param21 = ((((((7'h43) ? (8'hbf) : (8'hb0)) | ((8'ha1) ? (8'hba) : (8'h9d))) ^ (|((7'h42) ? (8'hb2) : (8'hb4)))) ? ((&{(8'hb9)}) ? (~^((7'h40) ? (8'hb5) : (8'had))) : (&((8'haf) ? (8'hae) : (7'h41)))) : {(((8'hbd) ? (8'ha0) : (8'hbb)) ? ((8'hbf) ? (8'hbc) : (8'hbf)) : ((7'h43) == (8'hab))), (((7'h43) >>> (8'ha9)) * ((7'h40) * (8'haa)))}) | (~|((8'hbe) ? (((8'hac) ? (8'hb1) : (7'h42)) >> (^~(8'hbe))) : (~((8'hbf) == (8'hb9)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire5,
                 wire4,
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
                 reg6,
                 (1'h0)};
  assign wire4 = ((wire0[(1'h0):(1'h0)] ?
                     $unsigned($unsigned((~|wire3))) : wire2[(4'h8):(4'h8)]) << $signed((&(wire3 + wire0))));
  assign wire5 = ($signed((wire4 ?
                     wire0 : (!((8'hb6) || wire1)))) == {(((&wire1) || ((8'ha5) && (7'h44))) ?
                         (wire1 ?
                             (wire0 ?
                                 wire4 : wire0) : (wire1 || wire3)) : (wire1 ^~ wire4))});
  always
    @(posedge clk) begin
      reg6 <= ((!wire1) ?
          (($unsigned(wire1) ?
              $unsigned((wire1 ~^ wire4)) : $unsigned((~&wire5))) << wire3) : {{$unsigned({wire0,
                      wire5})},
              $signed((wire2[(4'h8):(3'h4)] ? $signed(wire5) : (8'hb0)))});
      if (reg6)
        begin
          if ((($unsigned(({wire0,
                  wire3} != $unsigned((8'haf)))) <= (|{$signed(wire3)})) ?
              wire2[(4'h8):(3'h6)] : $unsigned((^~$signed((8'hbd))))))
            begin
              reg7 <= wire3[(2'h2):(1'h0)];
              reg8 <= (-(8'hb6));
              reg9 <= wire3[(1'h0):(1'h0)];
              reg10 <= {(+$signed($signed(reg7)))};
            end
          else
            begin
              reg7 <= ((-wire3) >> (wire5 ~^ wire3[(2'h3):(1'h1)]));
              reg8 <= $unsigned($unsigned(reg8[(2'h2):(1'h1)]));
              reg9 <= (^(wire5 ?
                  $signed(reg6[(1'h0):(1'h0)]) : (^reg8[(1'h0):(1'h0)])));
              reg10 <= $signed(reg10);
            end
          if ($unsigned($signed(({(^reg7)} >= ($signed(reg6) ?
              $unsigned(reg6) : wire5)))))
            begin
              reg11 <= (^wire5);
              reg12 <= wire3;
              reg13 <= $unsigned($signed((({wire1} ^ $signed(wire2)) ~^ $signed($signed(reg11)))));
              reg14 <= reg6;
            end
          else
            begin
              reg11 <= wire0[(4'h8):(3'h7)];
              reg12 <= reg9;
            end
        end
      else
        begin
          reg7 <= (^wire2[(3'h6):(2'h3)]);
          reg8 <= ((^~$unsigned($unsigned(wire0))) & $unsigned({reg6,
              ((reg14 && reg6) > $unsigned(reg13))}));
          reg9 <= wire2[(3'h5):(2'h2)];
          reg10 <= $signed((($unsigned(reg6) ^~ $unsigned((8'h9f))) ?
              ({reg12, (~^reg6)} ?
                  (~^(wire1 | wire3)) : $unsigned($unsigned(wire0))) : (8'ha3)));
        end
      reg15 <= $signed((+reg11));
      reg16 <= {wire2, (wire3 || $signed($unsigned((~(8'hbc)))))};
      reg17 <= (($signed((|(reg15 ~^ reg13))) != {reg16[(4'h9):(1'h0)],
          {(8'ha5)}}) == reg8[(1'h1):(1'h0)]);
    end
  assign wire18 = reg8;
  assign wire19 = reg6;
  assign wire20 = $unsigned(((reg9 <= $signed(((8'hbf) ?
                      wire5 : reg12))) != reg8));
endmodule
