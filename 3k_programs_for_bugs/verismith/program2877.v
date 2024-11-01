module top
#(parameter param26 = {({{((8'h9f) > (8'ha4))}} && {{(8'h9f)}}), ((7'h42) ? (&{(~|(8'hb1)), {(8'h9f), (8'h9f)}}) : {(((8'h9c) ^~ (8'hb0)) ? (8'hb9) : (~(7'h42))), {(!(8'ha6)), ((8'hae) ? (8'hb9) : (8'ha5))}})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned(wire0[(4'h8):(3'h4)]))))
        begin
          reg4 <= ((8'hbb) <<< wire0[(1'h1):(1'h1)]);
          reg5 <= wire3;
          reg6 <= $unsigned($signed($unsigned({(+reg4), wire3})));
          reg7 <= reg5[(3'h6):(1'h1)];
          if (reg6)
            begin
              reg8 <= (+$unsigned((reg4 ? wire1 : (~&(wire2 ? reg4 : reg4)))));
              reg9 <= wire3[(3'h6):(2'h2)];
              reg10 <= reg4[(4'hd):(4'hd)];
            end
          else
            begin
              reg8 <= (^($signed($signed((wire0 ?
                  wire1 : reg5))) && $unsigned(reg4[(5'h10):(4'hb)])));
              reg9 <= (((-(wire1 ?
                  wire1[(4'h8):(3'h6)] : ((8'ha1) ?
                      (8'hb5) : reg4))) >> reg5) + ({reg6} << ((reg7 ?
                  $signed(wire2) : reg7) >>> (wire2[(3'h6):(2'h2)] ?
                  $signed(reg10) : reg5))));
              reg10 <= (({wire3[(1'h1):(1'h1)]} ?
                      $unsigned((|(reg6 && wire3))) : $unsigned((^reg8[(2'h3):(2'h2)]))) ?
                  ((((+wire0) ~^ reg7[(1'h1):(1'h0)]) ?
                      ((reg9 ?
                          wire1 : wire2) ~^ wire0[(4'ha):(3'h6)]) : wire0[(4'h8):(2'h3)]) && (+(|(reg9 ?
                      wire3 : wire3)))) : (($unsigned(wire0) ?
                          (~^$unsigned(reg7)) : reg8) ?
                      (((~wire1) ? (^reg4) : (reg10 ? wire1 : reg5)) ?
                          $unsigned((reg9 ?
                              wire2 : (8'h9d))) : $signed(reg10[(4'hd):(3'h4)])) : ($unsigned($unsigned(reg6)) * reg8[(2'h3):(1'h1)])));
              reg11 <= $unsigned((($signed(((8'h9d) && reg4)) ?
                      reg5[(5'h10):(1'h0)] : (reg10[(4'hd):(1'h0)] << (~^reg9))) ?
                  $signed((wire0 ? $signed((8'ha5)) : {wire0})) : {((~&reg5) ?
                          $unsigned(reg5) : (^wire2)),
                      $unsigned($unsigned(reg5))}));
            end
        end
      else
        begin
          reg4 <= {(reg10[(5'h11):(4'hb)] ?
                  ($unsigned((reg11 != reg9)) != ($signed((8'hbe)) >= (reg4 <= reg5))) : (!((reg9 ?
                      (8'ha8) : wire2) >>> $unsigned(wire2))))};
          reg5 <= ($unsigned($signed($signed((!wire2)))) == reg4);
          reg6 <= ($signed($unsigned($unsigned((reg8 ~^ wire3)))) ?
              $unsigned((~&($signed(wire1) ?
                  $signed(wire1) : $signed(reg9)))) : wire1);
          if (($unsigned(($signed((+wire0)) ?
                  (|((8'hb8) ? reg6 : reg5)) : ((reg9 ?
                      wire3 : reg9) * (~|reg8)))) ?
              ((!{{reg8, reg10}}) ?
                  ($signed((-wire3)) ?
                      wire3 : ($signed(reg4) ^~ $unsigned(reg7))) : $signed(($unsigned(reg10) ?
                      (wire0 ?
                          reg9 : wire3) : reg7))) : (+reg4[(3'h6):(3'h5)])))
            begin
              reg7 <= reg6;
              reg8 <= (^reg6[(3'h6):(2'h2)]);
              reg9 <= (reg4 ?
                  (~&(8'hbb)) : (($signed($unsigned(wire0)) ?
                          $unsigned((~wire2)) : ((wire1 ? wire0 : (8'h9e)) ?
                              (reg5 ? wire1 : reg9) : (-reg11))) ?
                      ($unsigned(reg5) != ({(8'ha4),
                          wire0} < (reg9 > (7'h41)))) : (wire3[(2'h3):(2'h3)] & (+(wire1 <<< wire0)))));
              reg10 <= $signed(reg10[(1'h1):(1'h0)]);
              reg11 <= ((+$unsigned({$signed(reg11),
                  (reg7 ?
                      wire3 : reg11)})) >> $unsigned(((&$signed(reg5)) != $signed((reg5 ?
                  (8'hb1) : (8'had))))));
            end
          else
            begin
              reg7 <= {reg7[(1'h1):(1'h1)], {wire0, $unsigned(reg6)}};
            end
        end
      if (reg6)
        begin
          if ($signed({$unsigned(reg7)}))
            begin
              reg12 <= wire2;
            end
          else
            begin
              reg12 <= $unsigned((wire1[(2'h3):(1'h0)] ?
                  (((reg4 ? reg8 : reg4) ?
                          $unsigned((8'h9c)) : $unsigned((8'h9c))) ?
                      reg7 : wire3) : $signed(($unsigned(wire0) ?
                      $unsigned(reg9) : (+wire1)))));
              reg13 <= wire0[(4'ha):(3'h5)];
            end
          reg14 <= {(~^($unsigned($unsigned((8'ha0))) ?
                  $signed((~|(8'hac))) : wire3[(1'h0):(1'h0)]))};
          reg15 <= reg8[(1'h0):(1'h0)];
          if (reg8)
            begin
              reg16 <= $unsigned(reg15);
            end
          else
            begin
              reg16 <= ($signed(($unsigned((reg7 | (8'hbc))) ?
                  $unsigned((&reg16)) : {reg14[(3'h7):(3'h5)]})) ^ $signed($signed($signed($signed(wire2)))));
              reg17 <= reg6[(5'h12):(4'hb)];
              reg18 <= (^wire2);
              reg19 <= (reg17 ?
                  reg17[(1'h1):(1'h0)] : {{{wire2[(4'h8):(2'h3)]},
                          (|(~wire0))}});
              reg20 <= reg11[(3'h5):(2'h3)];
            end
        end
      else
        begin
          if (reg15)
            begin
              reg12 <= (~&(~|(reg13[(2'h2):(2'h2)] || {reg11[(1'h0):(1'h0)],
                  reg7})));
              reg13 <= $unsigned((($signed((~reg15)) ?
                  ($signed((8'hb7)) >> (-reg17)) : {(reg8 <= (7'h40)),
                      reg11[(2'h3):(2'h3)]}) >> reg12));
            end
          else
            begin
              reg12 <= (~$unsigned({(~(+reg11)), (|$signed((8'hac)))}));
              reg13 <= (!$signed($signed($signed((~&reg9)))));
              reg14 <= reg20;
            end
          reg15 <= reg7;
        end
    end
  assign wire21 = (({($unsigned(reg16) * (^~reg13))} ?
                          (reg6 ^~ reg13[(4'ha):(4'ha)]) : (reg14 ?
                              reg19[(2'h2):(2'h2)] : $unsigned(wire1))) ?
                      {(8'hbc), reg13} : $signed(reg16[(1'h1):(1'h1)]));
  assign wire22 = $signed({$signed(($unsigned((8'ha2)) ^ reg14[(3'h4):(1'h0)])),
                      (reg8[(2'h2):(1'h1)] ^ $signed($signed(wire21)))});
  assign wire23 = ($unsigned(reg13) ?
                      wire3[(1'h1):(1'h1)] : reg16[(1'h1):(1'h0)]);
  assign wire24 = reg10;
  assign wire25 = ($signed((7'h44)) ?
                      $unsigned(reg20[(4'ha):(2'h3)]) : {reg15[(1'h0):(1'h0)]});
endmodule
