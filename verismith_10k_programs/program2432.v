module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg37,
                 reg36,
                 reg35,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 (1'h0)};
  assign wire5 = (wire1[(2'h3):(1'h0)] ?
                     $signed((wire1 && ({wire1,
                         wire1} ~^ $signed(wire4)))) : {((wire4[(2'h2):(2'h2)] ?
                             (wire2 ?
                                 wire0 : (8'ha5)) : wire1[(1'h0):(1'h0)]) >> $signed(wire3[(3'h6):(3'h5)])),
                         wire4[(2'h3):(1'h1)]});
  assign wire6 = (wire1 * ($signed((|$signed(wire1))) || wire5[(2'h3):(1'h0)]));
  assign wire7 = $signed((($signed(wire0) ?
                         wire6 : (wire2[(1'h1):(1'h1)] ?
                             wire0[(3'h7):(2'h3)] : (~^(8'hb3)))) ?
                     ((wire5[(2'h3):(2'h3)] ^ ((8'hb7) ?
                         wire6 : (8'hba))) ^ {(~|wire5),
                         $signed((8'hbd))}) : (8'hb8)));
  assign wire8 = $unsigned((!wire1));
  assign wire9 = (wire6 ?
                     {wire7[(4'he):(2'h3)],
                         (wire3 ?
                             ($signed(wire1) ?
                                 (~|wire0) : wire4[(2'h2):(1'h0)]) : (wire6[(3'h6):(3'h4)] < $unsigned(wire4)))} : wire0);
  assign wire10 = $signed({(wire6 ^ $unsigned(wire7))});
  assign wire11 = ((&$unsigned((~wire9[(1'h1):(1'h0)]))) ^~ wire1[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg12 <= $signed($signed($unsigned((wire11 > ((8'ha2) ?
          wire0 : wire6)))));
    end
  always
    @(posedge clk) begin
      if (({(+wire7[(2'h3):(2'h2)]),
          (($unsigned(wire11) ? (reg12 ? wire4 : wire0) : (wire6 ~^ wire4)) ?
              (~&(reg12 >> wire10)) : $signed($signed(wire7)))} < {wire8[(4'ha):(1'h1)],
          ($unsigned(((8'hba) - wire9)) & (wire4[(2'h3):(2'h2)] ?
              ((8'hb4) ? (8'h9f) : wire6) : (8'hb9)))}))
        begin
          reg13 <= $signed((+wire8[(4'ha):(4'ha)]));
        end
      else
        begin
          reg13 <= (|($signed((wire8 >= $unsigned(wire0))) ?
              wire9 : {(^wire3[(3'h4):(1'h1)]), {(-wire10), (^reg12)}}));
          if ($signed(((!(wire3 < $unsigned(wire5))) ?
              wire0 : wire11[(3'h4):(3'h4)])))
            begin
              reg14 <= $signed(wire10);
              reg15 <= wire5;
              reg16 <= wire0;
              reg17 <= ($unsigned($signed(wire7[(3'h6):(3'h5)])) || wire4);
            end
          else
            begin
              reg14 <= wire7;
              reg15 <= reg15;
              reg16 <= {(reg17[(1'h0):(1'h0)] ?
                      {{$signed(reg12)}} : (wire8 | (((7'h42) ?
                              (8'ha5) : wire1) ?
                          (wire5 ? wire3 : wire4) : (!wire9)))),
                  ($unsigned($signed(wire4[(2'h3):(2'h3)])) || (($signed(wire10) && $signed(reg14)) ?
                      ({wire1, wire3} ?
                          $unsigned(wire10) : wire7[(3'h7):(3'h5)]) : reg13[(2'h3):(1'h0)]))};
              reg17 <= $signed($signed(reg17));
            end
          reg18 <= (wire3 * $unsigned((^$signed((8'hb9)))));
          if (wire6[(2'h3):(2'h3)])
            begin
              reg19 <= reg15;
              reg20 <= (wire10 << (|(!(reg16[(2'h3):(2'h3)] ?
                  reg12[(4'h9):(4'h9)] : {wire6}))));
            end
          else
            begin
              reg19 <= (+{reg13[(3'h5):(2'h3)], (|(!(~|reg18)))});
              reg20 <= $unsigned($unsigned($signed($signed(((8'ha3) ?
                  reg19 : wire3)))));
            end
          if (reg18[(2'h2):(1'h0)])
            begin
              reg21 <= wire9;
              reg22 <= $signed($signed($signed(wire4)));
              reg23 <= $signed($unsigned((^~((~^reg18) ?
                  wire10 : $signed(reg19)))));
            end
          else
            begin
              reg21 <= $signed((reg17 ?
                  (-$signed($unsigned(wire11))) : $unsigned($signed($signed((8'hb0))))));
              reg22 <= ((((reg15 | (wire2 <= wire5)) > (^$unsigned(wire2))) < ((reg12[(4'hc):(4'hb)] > (!reg16)) & {wire0,
                  $signed(reg21)})) >= $unsigned(((|wire10[(3'h5):(3'h4)]) && ((wire6 ~^ wire7) << (|wire0)))));
            end
        end
      if (((^~wire0[(1'h0):(1'h0)]) + (reg13[(4'h9):(4'h9)] ?
          reg20 : ({(&(8'h9d)), ((8'h9c) ? (8'h9f) : reg19)} ?
              reg22 : (-reg16[(1'h0):(1'h0)])))))
        begin
          reg24 <= ((-wire7) << ((|wire4) == $signed((+(reg15 ?
              wire7 : (8'hac))))));
          reg25 <= ((7'h41) <<< reg15);
          reg26 <= reg23;
          reg27 <= wire5;
        end
      else
        begin
          if ($unsigned(wire4[(1'h1):(1'h1)]))
            begin
              reg24 <= reg25[(2'h2):(1'h1)];
              reg25 <= $unsigned((((((8'ha1) ? wire6 : reg18) ?
                      ((8'ha6) ? wire10 : reg12) : reg25[(1'h0):(1'h0)]) ?
                  (~^{reg21}) : (+reg22)) <<< (((|reg25) & (wire5 ^~ (8'hba))) ^ $signed(((8'hb5) <<< reg22)))));
            end
          else
            begin
              reg24 <= reg22[(3'h6):(2'h3)];
              reg25 <= (((reg24 ?
                  $unsigned(wire4[(2'h3):(2'h2)]) : (reg25[(4'hd):(3'h6)] ?
                      (8'ha9) : $unsigned(reg15))) + (((8'h9c) ?
                  $unsigned((8'hae)) : (reg20 & wire2)) - wire7[(3'h6):(1'h0)])) < ((($unsigned(wire10) >= wire9) != (&(reg27 ?
                      reg25 : wire9))) ?
                  reg16 : wire9));
            end
          reg26 <= ($signed(reg26[(4'hf):(4'hf)]) >> wire3[(3'h7):(2'h2)]);
          reg27 <= {(&((~{wire8, wire2}) && {(reg26 ? reg20 : reg25),
                  (wire11 <= reg18)}))};
          if (wire10)
            begin
              reg28 <= wire11[(1'h1):(1'h1)];
              reg29 <= {(~|$unsigned($signed((reg13 > wire8)))),
                  ((&wire4[(1'h0):(1'h0)]) >= $unsigned((wire11 ?
                      reg16[(4'h8):(2'h3)] : $signed(reg15))))};
            end
          else
            begin
              reg28 <= {((&(wire1[(3'h4):(2'h3)] ?
                          wire2[(1'h0):(1'h0)] : reg15)) ?
                      ((-((8'hbc) ? (8'hb9) : reg13)) ?
                          $signed((wire0 ? (8'haf) : wire10)) : ((^~reg24) ?
                              $unsigned(reg24) : (reg21 ?
                                  wire10 : wire3))) : ({$unsigned(reg18),
                              {wire9, wire1}} ?
                          $signed(wire9[(1'h0):(1'h0)]) : ($unsigned(wire0) ?
                              reg29 : wire4[(1'h0):(1'h0)])))};
              reg29 <= (reg16[(3'h7):(1'h0)] ?
                  $unsigned((reg16[(4'hb):(2'h2)] != wire6[(3'h6):(2'h2)])) : $signed($unsigned({$unsigned(reg20),
                      (reg28 ? (8'hb4) : reg18)})));
              reg30 <= $signed($unsigned((|(+$signed(reg23)))));
            end
        end
      reg31 <= reg22;
      reg32 <= $unsigned($signed($signed($unsigned(wire2[(3'h5):(3'h5)]))));
    end
  assign wire33 = ($signed(((8'hb5) && wire4)) && (~|(7'h44)));
  assign wire34 = ($unsigned(wire9) ? (7'h41) : reg24);
  always
    @(posedge clk) begin
      reg35 <= reg19[(2'h2):(1'h0)];
      reg36 <= ($signed(((^(reg25 ~^ reg18)) ?
              ($unsigned(reg28) > (|reg32)) : ($signed(reg17) + $signed(wire11)))) ?
          ((8'hba) >= (&reg32)) : ((wire4 ?
                  $signed({(8'ha2)}) : $signed((!wire7))) ?
              (~reg31[(4'h9):(1'h1)]) : reg24));
      reg37 <= ((+(~&reg24[(1'h1):(1'h1)])) != wire6);
    end
endmodule
