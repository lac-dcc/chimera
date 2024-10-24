module top
#(parameter param36 = ((((~^(8'ha6)) ? {(~^(8'ha2))} : (((8'ha4) ? (8'ha3) : (8'ha8)) ? ((8'ha2) ? (8'hba) : (8'hb4)) : (~&(7'h42)))) != (!(((8'ha3) >>> (8'haf)) ? {(8'haf), (8'hbe)} : ((8'ha1) ? (8'ha3) : (8'h9f))))) >> {(-(((8'hb5) >> (8'hb5)) - {(8'hbe)}))}), 
parameter param37 = (~&(!(((param36 ? param36 : param36) ? (param36 && param36) : (param36 >> param36)) ? ((8'ha9) ? (param36 + param36) : (~&param36)) : ((+param36) ? {param36} : (param36 ? param36 : (8'hac)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire16,
                 wire15,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg19,
                 reg18,
                 reg17,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = (~&{wire1[(2'h2):(1'h1)], wire3[(3'h7):(3'h4)]});
  assign wire6 = wire0[(1'h0):(1'h0)];
  assign wire7 = ($signed(wire4[(3'h7):(3'h7)]) ?
                     (wire4[(4'h9):(2'h2)] ?
                         $unsigned(wire4[(2'h2):(1'h1)]) : $unsigned(wire2)) : $signed((^~wire4[(3'h7):(3'h5)])));
  assign wire8 = {((&({wire2} > (wire0 ?
                         wire4 : wire5))) | $signed($signed($unsigned(wire5)))),
                     (((wire0 ? (~wire1) : $unsigned(wire6)) ^~ {((8'h9e) ?
                             wire0 : wire7)}) >= ((~&$signed(wire6)) ?
                         ((|(8'hb4)) >> wire6[(3'h6):(3'h4)]) : (-$unsigned((8'hb3)))))};
  assign wire9 = $unsigned($unsigned(wire3[(2'h3):(2'h3)]));
  assign wire10 = $signed(wire5);
  assign wire11 = wire7;
  assign wire12 = wire3;
  always
    @(posedge clk) begin
      reg13 <= $unsigned(wire6[(3'h7):(2'h2)]);
      reg14 <= $signed((!(8'hb3)));
    end
  assign wire15 = (wire0 ?
                      {wire3[(2'h2):(1'h0)],
                          (($unsigned((8'ha5)) ?
                              wire5 : wire8[(4'h8):(1'h0)]) > (~&((8'ha1) ?
                              wire10 : wire11)))} : {wire3[(2'h3):(2'h3)]});
  assign wire16 = $unsigned(wire9);
  always
    @(posedge clk) begin
      reg17 <= $signed(wire15);
      reg18 <= ($signed(((wire11 || $signed(wire16)) << wire10[(4'ha):(3'h4)])) ?
          ((((wire0 ? (8'hb6) : wire1) & $unsigned(wire3)) ?
                  wire9 : (!(wire8 <<< wire7))) ?
              (+((wire3 ^~ (8'hb0)) ?
                  {wire5, wire11} : wire3)) : {{(reg17 || wire10), (8'ha9)},
                  (&{wire10, wire7})}) : wire0);
      reg19 <= $signed($unsigned(({wire12[(3'h5):(2'h3)],
          $signed(wire6)} >> {(reg14 ? reg17 : (8'ha7)), reg13})));
    end
  assign wire20 = $signed($signed(reg17));
  assign wire21 = ($unsigned(((wire16 >>> (wire2 & wire6)) >>> ($unsigned(wire8) ?
                          (~|wire1) : ((8'ha7) ? wire6 : wire11)))) ?
                      $signed(({wire15} ?
                          $signed($signed(reg17)) : reg18)) : wire8[(2'h2):(1'h0)]);
  assign wire22 = (~|(&(wire0[(2'h2):(2'h2)] ?
                      (8'had) : (wire9 || wire3[(4'hb):(3'h5)]))));
  assign wire23 = $unsigned($unsigned(reg17[(4'hc):(2'h3)]));
  assign wire24 = wire0;
  always
    @(posedge clk) begin
      if ((($signed($unsigned(wire8[(4'hd):(4'hb)])) ?
          ((-{wire6,
              reg19}) & wire2) : ((((8'hbd) == reg18) >= $unsigned(wire0)) && ((reg17 | wire16) << {reg13,
              wire24}))) + wire24))
        begin
          if (wire9)
            begin
              reg25 <= $unsigned((|wire7[(1'h1):(1'h0)]));
              reg26 <= (wire6[(3'h5):(3'h5)] ?
                  (wire9 && (+(~^$unsigned(wire16)))) : $signed((wire23 ^ wire11[(1'h1):(1'h0)])));
              reg27 <= $signed(($unsigned(wire5) | (~((wire1 ? reg14 : wire11) ?
                  (wire9 ? reg26 : wire3) : (wire24 ? wire21 : wire10)))));
              reg28 <= (!$signed(wire12[(3'h6):(3'h4)]));
            end
          else
            begin
              reg25 <= reg27;
              reg26 <= $signed(($signed(wire8) ?
                  (wire20[(1'h1):(1'h0)] & $signed(reg19)) : ((|(reg26 ^~ wire6)) ?
                      (&(reg14 ? wire1 : wire2)) : (^~(wire5 ?
                          wire1 : reg13)))));
              reg27 <= $signed(((&(wire7[(4'h8):(1'h1)] || (|wire11))) | $unsigned((reg27[(4'hc):(1'h1)] ^ $signed(wire11)))));
            end
          reg29 <= (&wire4);
          reg30 <= (wire6[(2'h3):(1'h1)] << (wire2[(4'he):(4'h8)] ?
              (((&(8'haf)) + $unsigned((8'h9e))) || (8'had)) : {(wire3[(4'hc):(3'h5)] ?
                      (reg19 ? wire21 : wire4) : (wire6 ? wire4 : wire4))}));
          reg31 <= wire3[(3'h5):(3'h5)];
          reg32 <= reg18[(4'h8):(2'h2)];
        end
      else
        begin
          reg25 <= wire9[(3'h7):(3'h6)];
          reg26 <= $unsigned(wire4[(2'h3):(2'h2)]);
          reg27 <= wire9[(4'ha):(4'ha)];
          if (reg17)
            begin
              reg28 <= wire1[(1'h1):(1'h1)];
              reg29 <= wire4[(1'h1):(1'h1)];
              reg30 <= $unsigned(reg26[(3'h4):(1'h0)]);
            end
          else
            begin
              reg28 <= (($unsigned({(8'hb9)}) >>> (8'hba)) & (+reg25[(2'h3):(2'h3)]));
              reg29 <= (&(!wire6));
              reg30 <= (~|(^$signed($signed(wire5))));
              reg31 <= wire23[(4'h8):(3'h7)];
              reg32 <= {(+reg18),
                  ($signed({$signed(reg14)}) ?
                      (+((reg30 ?
                          wire9 : reg32) >= {wire5})) : ($signed($unsigned(reg19)) < $signed((wire21 >> wire8))))};
            end
          reg33 <= wire11;
        end
    end
  assign wire34 = ({reg13[(4'hb):(2'h3)]} ?
                      (^~($unsigned((+reg25)) > $unsigned(wire9))) : $unsigned(wire11));
  assign wire35 = ($unsigned((((reg29 ?
                      wire5 : reg30) || (~&reg29)) >> wire22)) == $unsigned(($signed(wire4[(1'h1):(1'h1)]) < wire4)));
endmodule
