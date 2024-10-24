module top
#(parameter param23 = ((~&((&((8'hb0) & (8'ha2))) & (^(|(8'hbc))))) ? (((8'h9e) ? ((+(8'h9f)) | {(8'hb7)}) : ((~(7'h42)) ? (&(8'hb9)) : ((8'hb4) ? (8'h9d) : (8'hbf)))) ? (|(((8'ha6) ? (8'h9d) : (8'ha3)) ^ (!(8'h9d)))) : {((^(7'h44)) != (~|(8'ha2)))}) : ((((^~(8'ha5)) ? ((8'ha4) << (8'hb9)) : ((8'ha7) ? (8'ha8) : (8'hb4))) >= (|(^~(8'ha6)))) ^ (((&(8'haf)) > ((8'haa) >>> (8'hb1))) ? (~^{(8'had), (8'hbb)}) : ((^(8'h9f)) ? ((8'ha1) ? (8'hbb) : (8'hb5)) : ((8'hb4) ? (7'h42) : (8'hb5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
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
                 (1'h0)};
  assign wire5 = wire0[(3'h4):(2'h3)];
  assign wire6 = wire5[(2'h3):(2'h3)];
  assign wire7 = (({$signed($unsigned(wire3))} && wire2[(2'h3):(2'h3)]) <= (~^($unsigned(wire0) ?
                     ((wire4 ? wire0 : wire6) < wire3) : {wire0[(4'h8):(3'h7)],
                         $unsigned((7'h41))})));
  assign wire8 = $unsigned(wire6[(2'h3):(2'h2)]);
  assign wire9 = (^wire5[(1'h0):(1'h0)]);
  assign wire10 = ((wire1 ?
                      $unsigned(({wire8, wire2} ?
                          (wire2 ~^ wire2) : $unsigned(wire6))) : ($signed(wire1[(3'h5):(1'h1)]) ?
                          wire0[(1'h1):(1'h0)] : (~&wire1[(1'h1):(1'h1)]))) ^~ wire2[(1'h0):(1'h0)]);
  assign wire11 = $signed(wire2[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg12 <= (8'ha3);
      if (($signed(((7'h44) ? (wire8 - (^~wire11)) : (|(8'h9d)))) ?
          $unsigned(wire4) : $signed($signed(({(8'hb2)} ?
              wire10[(1'h0):(1'h0)] : $unsigned(wire6))))))
        begin
          reg13 <= (~^(~wire6[(4'he):(4'hd)]));
          if (wire6)
            begin
              reg14 <= $signed(wire3);
              reg15 <= wire7;
              reg16 <= $signed((wire11 && wire7));
              reg17 <= (^~(~(8'h9d)));
            end
          else
            begin
              reg14 <= $signed($signed((8'hac)));
              reg15 <= {(wire5[(2'h2):(1'h1)] ? (-reg12) : (~|(8'haa)))};
              reg16 <= reg13[(1'h1):(1'h1)];
              reg17 <= $unsigned(wire11[(1'h0):(1'h0)]);
              reg18 <= (reg13 >>> $unsigned({(((7'h42) ?
                      wire7 : wire9) < (wire2 + reg12)),
                  reg14}));
            end
        end
      else
        begin
          if (reg17)
            begin
              reg13 <= ({(|$unsigned(wire10[(3'h4):(1'h0)]))} == wire5[(1'h0):(1'h0)]);
              reg14 <= $unsigned(wire8[(4'hc):(1'h0)]);
              reg15 <= $signed((+$signed(($signed((8'ha8)) ?
                  (reg14 < wire9) : (wire10 <<< (8'ha2))))));
              reg16 <= (($unsigned((wire1[(1'h1):(1'h0)] || (wire0 ?
                          wire11 : wire4))) ?
                      $unsigned(reg16) : $signed(($unsigned(wire0) ?
                          reg13[(4'hc):(4'h8)] : wire11))) ?
                  $unsigned((~$signed(wire0))) : $signed(($signed((reg14 ?
                          (8'hbc) : wire2)) ?
                      (((7'h43) >> wire1) ?
                          (~wire10) : $signed(wire8)) : ((+reg16) << $unsigned(wire6)))));
              reg17 <= $unsigned((wire10[(3'h4):(1'h1)] ?
                  (~$signed(wire7)) : wire8[(4'h8):(3'h5)]));
            end
          else
            begin
              reg13 <= reg15;
            end
          reg18 <= reg16[(4'hb):(2'h3)];
        end
      reg19 <= $unsigned({wire2});
      reg20 <= $unsigned((wire1 ?
          (~&$unsigned($signed(reg17))) : $unsigned($signed($signed(wire6)))));
    end
  assign wire21 = $signed((((reg16[(1'h0):(1'h0)] ?
                          reg15[(1'h0):(1'h0)] : (|(8'ha7))) + $unsigned($unsigned(wire6))) ?
                      {$signed(reg14)} : wire8[(4'h9):(4'h9)]));
  assign wire22 = {$signed((+reg13[(3'h6):(3'h4)]))};
endmodule
