module top
#(parameter param16 = (|{{(&((8'ha2) ? (8'hbf) : (8'hab)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = (^~wire0[(2'h3):(2'h2)]);
  assign wire6 = wire2[(3'h5):(2'h3)];
  assign wire7 = wire1;
  assign wire8 = (~$signed($unsigned(wire7[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      if (($unsigned({((8'hb5) ?
              (wire3 ?
                  wire5 : wire3) : wire1[(4'hb):(1'h0)])}) > $unsigned($signed(wire3))))
        begin
          reg9 <= $unsigned(($signed($signed(wire7)) * ((|(wire6 > wire1)) ?
              wire7[(3'h6):(1'h1)] : ((!wire8) ?
                  $signed(wire4) : ((7'h43) >= wire0)))));
          if (wire7[(3'h4):(1'h0)])
            begin
              reg10 <= wire4;
              reg11 <= $unsigned(wire2[(3'h6):(3'h4)]);
              reg12 <= $signed($signed({$signed((wire1 ? wire0 : wire6)),
                  wire7[(2'h2):(1'h1)]}));
              reg13 <= (wire6[(3'h5):(3'h4)] >= (reg12 ?
                  (8'ha7) : (($signed((8'hb7)) ?
                          (reg12 ? wire7 : wire5) : (^(8'hac))) ?
                      (wire7[(1'h1):(1'h0)] ~^ (wire3 ^ reg11)) : $unsigned($unsigned(reg11)))));
            end
          else
            begin
              reg10 <= reg12;
              reg11 <= (&(!(|$unsigned($signed((7'h40))))));
              reg12 <= (((({wire7} && $signed(wire3)) ?
                      (reg9 ?
                          $unsigned((8'ha1)) : reg13[(4'h8):(3'h4)]) : (~|(reg12 ?
                          reg9 : reg9))) ?
                  wire5 : (-$signed((wire0 ?
                      wire6 : reg11)))) < $unsigned(($unsigned(reg10[(2'h2):(2'h2)]) ?
                  reg13[(3'h4):(2'h2)] : ((wire2 ? wire4 : reg11) ?
                      (reg10 ? wire6 : reg13) : wire1))));
              reg13 <= $signed($unsigned($unsigned((+reg11[(4'h9):(1'h0)]))));
              reg14 <= {(wire2 ? wire5 : $unsigned(wire2)),
                  reg13[(1'h1):(1'h0)]};
            end
        end
      else
        begin
          reg9 <= ((wire0[(3'h5):(2'h2)] < $signed($signed((^~reg9)))) ?
              {wire3} : wire5);
          reg10 <= $unsigned((^(~^((wire1 ?
              wire7 : wire1) & (wire3 < wire8)))));
          if (((8'ha5) ?
              $signed((~^($signed(reg11) ?
                  wire4[(1'h1):(1'h0)] : {wire1, (8'ha1)}))) : (^(((reg11 ?
                      wire8 : wire3) ~^ $unsigned(wire6)) ?
                  wire6[(4'hc):(4'h9)] : wire7))))
            begin
              reg11 <= (^~($unsigned(reg12[(4'h8):(3'h6)]) >> ((~|(&(8'hb4))) ?
                  ((wire4 + (8'hbc)) ? (wire2 || reg10) : (8'h9f)) : wire2)));
            end
          else
            begin
              reg11 <= (reg11 ?
                  $unsigned(wire7) : $unsigned(({(^~(8'ha9)), $signed(wire6)} ?
                      reg13[(3'h4):(1'h0)] : $signed($unsigned(wire1)))));
            end
          if ({wire1})
            begin
              reg12 <= $unsigned((wire0[(4'hb):(2'h3)] >>> {($signed(wire4) ?
                      wire0[(4'h9):(3'h4)] : wire2[(3'h6):(3'h6)]),
                  (wire7[(3'h5):(1'h1)] ?
                      $unsigned((8'haf)) : (reg10 <= wire7))}));
              reg13 <= $unsigned(((^~(wire5[(5'h11):(1'h0)] ^ $unsigned(wire4))) ?
                  wire7[(3'h6):(3'h6)] : ($unsigned(reg12) ^ (8'hbe))));
            end
          else
            begin
              reg12 <= wire0;
              reg13 <= reg12[(5'h11):(4'hc)];
              reg14 <= $unsigned($signed((~wire6)));
              reg15 <= (reg10[(4'h9):(4'h9)] ?
                  (~^(+(|(wire8 <<< wire3)))) : wire2[(4'h9):(3'h5)]);
            end
        end
    end
endmodule
