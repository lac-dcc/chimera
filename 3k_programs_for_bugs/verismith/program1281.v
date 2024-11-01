module top
#(parameter param23 = {(-((((8'h9f) ^~ (8'ha3)) & ((8'h9f) ? (8'hb4) : (8'h9c))) ? ((~(8'hb0)) ? (&(8'h9d)) : ((8'hb7) ? (8'had) : (7'h44))) : ({(8'had)} > ((8'hbf) <<< (8'haf))))), ({({(8'hb9), (8'hb8)} ^ ((8'h9f) ? (8'hbe) : (8'h9c)))} ? (!(-((8'h9d) + (8'haf)))) : ((^{(8'h9e), (8'hba)}) - (8'ha1)))}, 
parameter param24 = (^(|(((8'haf) ~^ param23) ~^ (&(param23 >= param23))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg4 = (1'h0);
  assign y = {wire11,
                 wire10,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1;
      reg5 <= wire0[(4'h9):(4'h8)];
      if ($unsigned((($signed(reg4) <<< (-wire2[(4'h8):(2'h3)])) == wire3[(1'h0):(1'h0)])))
        begin
          reg6 <= (^~wire3);
          reg7 <= reg6;
        end
      else
        begin
          reg6 <= $signed((-(^~$signed((wire0 ? wire3 : reg7)))));
          reg7 <= $unsigned({reg7[(2'h2):(1'h0)],
              ((8'hb2) ? reg5 : ((^wire3) <= (reg7 ^~ reg6)))});
          reg8 <= (reg6[(4'ha):(3'h6)] > (($unsigned($signed(reg5)) ?
                  {wire3[(2'h3):(2'h3)]} : $signed((!(8'hbf)))) ?
              $unsigned((|{reg4, wire3})) : {reg6[(4'ha):(4'ha)]}));
        end
      reg9 <= {(reg7[(3'h4):(1'h1)] ?
              reg7 : ((8'hae) ? reg5[(3'h5):(2'h3)] : $signed((~|wire1))))};
    end
  assign wire10 = ($signed(wire0[(3'h5):(1'h1)]) + $unsigned(wire1));
  assign wire11 = (((wire1[(3'h4):(1'h0)] ?
                      $unsigned((^(7'h40))) : reg7) >>> reg6) || ($signed($signed((reg6 != reg5))) >>> wire3));
  always
    @(posedge clk) begin
      if ((&((($unsigned((8'hb0)) | reg7[(1'h0):(1'h0)]) << $signed(reg5[(3'h5):(2'h3)])) | {wire10,
          ({wire1, wire0} > (reg6 ? wire10 : reg4))})))
        begin
          reg12 <= $signed($unsigned((((reg8 & reg6) >>> $unsigned(wire1)) * {(wire3 <= reg7)})));
          if ($signed((~&$unsigned((wire2[(1'h0):(1'h0)] ? (-reg4) : reg8)))))
            begin
              reg13 <= ({((^(wire3 ? wire0 : reg4)) ?
                      ($unsigned(wire0) << $signed(wire10)) : {$signed(wire0)}),
                  wire2[(4'h8):(3'h4)]} - {$signed({(wire1 ?
                          wire10 : (7'h40))}),
                  (&(reg4[(4'he):(4'he)] + $signed((8'ha5))))});
              reg14 <= (wire11 != (8'hb1));
            end
          else
            begin
              reg13 <= ($unsigned($signed((^~$signed(wire10)))) ?
                  (($unsigned($signed(wire2)) || $signed(reg6)) >> (~{(reg7 || wire0)})) : wire2);
            end
          reg15 <= wire10[(3'h4):(2'h3)];
          if ((7'h42))
            begin
              reg16 <= (reg9 ?
                  (!$unsigned(wire1[(4'ha):(3'h7)])) : reg13[(4'h8):(3'h6)]);
              reg17 <= $signed(reg9);
              reg18 <= reg5[(1'h1):(1'h1)];
              reg19 <= (reg5[(3'h5):(3'h5)] ?
                  $unsigned({$signed((reg14 > (8'ha3))), (8'h9c)}) : reg4);
            end
          else
            begin
              reg16 <= (reg17 & ((8'hbb) ?
                  (^reg13) : (^~(reg4 ? (8'hb0) : $unsigned(reg9)))));
              reg17 <= (7'h44);
              reg18 <= $unsigned((($signed($signed(reg18)) == $signed((-wire0))) <<< $unsigned($unsigned((~wire2)))));
              reg19 <= $unsigned(($signed($signed((+(8'ha1)))) ?
                  wire2[(3'h5):(1'h1)] : (((wire2 >> (8'ha6)) ?
                          wire0[(3'h5):(3'h5)] : $unsigned(reg5)) ?
                      (~&{wire0}) : $signed((reg4 - reg5)))));
              reg20 <= ($unsigned((wire1 || (reg15 ?
                      (wire10 != reg6) : (wire1 ~^ wire1)))) ?
                  $unsigned((reg17 & $unsigned((^reg14)))) : {$unsigned((^reg16[(3'h5):(3'h4)]))});
            end
        end
      else
        begin
          reg12 <= $unsigned((wire2 ^~ $signed((reg4[(4'hd):(4'ha)] ?
              wire0 : wire3[(1'h0):(1'h0)]))));
          reg13 <= reg19[(3'h7):(3'h5)];
        end
      reg21 <= (-(~|reg6[(3'h6):(2'h3)]));
      reg22 <= $signed(((reg20[(3'h4):(2'h3)] ^ $signed($unsigned(reg8))) ?
          wire1 : $signed($signed({reg16}))));
    end
endmodule
