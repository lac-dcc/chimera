module top
#(parameter param28 = {({(((8'hbb) >= (8'hb9)) | ((8'hac) ? (8'hb7) : (7'h41))), (((8'hb4) ? (8'hb5) : (8'ha0)) ? ((8'hb1) ? (8'hba) : (8'hbd)) : ((8'h9e) ^ (7'h42)))} < ((((8'ha5) ? (8'hb8) : (8'ha8)) - (~^(8'hb8))) ? (|((7'h43) && (8'hae))) : {((7'h42) ? (8'hbd) : (8'hb3)), (~&(8'ha1))})), (~(((^~(8'h9f)) ? {(8'ha3)} : (^(8'ha3))) ? (((8'hac) | (8'haa)) ? ((8'h9c) < (8'hbe)) : ((8'haa) ? (8'had) : (8'ha7))) : (((8'hbd) ? (7'h42) : (7'h42)) | (&(8'hb5)))))}, 
parameter param29 = (8'hae))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg11,
                 (1'h0)};
  assign wire5 = $unsigned((7'h40));
  assign wire6 = wire2;
  assign wire7 = $signed($unsigned(wire5[(2'h2):(1'h0)]));
  assign wire8 = {$signed($unsigned($unsigned(wire2))),
                     $unsigned(($unsigned((+wire4)) ?
                         wire6[(4'hd):(3'h5)] : (-wire0[(1'h1):(1'h1)])))};
  assign wire9 = $unsigned((^~$signed(wire7)));
  assign wire10 = ($signed(wire4) >= (($unsigned((^~wire4)) << wire5[(2'h2):(1'h0)]) ^ wire2));
  always
    @(posedge clk) begin
      if ((($unsigned((8'ha6)) ? wire4[(4'ha):(2'h3)] : wire2[(1'h1):(1'h0)]) ?
          ((wire9[(3'h5):(1'h0)] < $unsigned((wire2 ? wire5 : wire4))) ?
              $unsigned($signed((^~wire6))) : ({wire3[(2'h2):(1'h1)],
                      (wire4 ? (7'h40) : wire9)} ?
                  $signed((!wire10)) : wire9)) : $signed($signed(($signed(wire3) ?
              (|wire0) : wire3[(3'h7):(2'h2)])))))
        begin
          reg11 <= ((7'h44) ?
              {$signed(((wire7 ?
                      (8'ha1) : wire9) * {wire0}))} : (+{((wire5 << wire5) ?
                      (|wire0) : (+(7'h44))),
                  wire3[(2'h3):(2'h2)]}));
          if ((wire7 > ($signed(reg11[(4'hb):(3'h6)]) & wire4[(3'h6):(3'h6)])))
            begin
              reg12 <= (+{wire7[(3'h6):(3'h6)], wire7[(5'h10):(4'he)]});
              reg13 <= $signed(($signed($unsigned(wire6)) ?
                  $unsigned((~^wire2[(1'h0):(1'h0)])) : (reg12 ?
                      ((wire5 + wire6) <= reg12) : ((wire2 ?
                          wire10 : wire4) && {wire10, wire4}))));
              reg14 <= ($signed($unsigned(($unsigned(wire9) ?
                  (~|reg12) : {wire7,
                      wire0}))) | $unsigned(reg13[(1'h1):(1'h1)]));
            end
          else
            begin
              reg12 <= (8'hb5);
              reg13 <= ((((wire2[(2'h2):(1'h1)] & ((8'ha2) ? wire0 : wire4)) ?
                          (~^wire1) : $signed($unsigned(wire9))) ?
                      $signed({(wire5 <<< reg13)}) : (($signed((8'hb8)) ?
                              wire7[(4'ha):(3'h6)] : {reg14, wire0}) ?
                          $unsigned(wire5[(2'h2):(1'h1)]) : $unsigned((^~wire3)))) ?
                  (8'hb3) : wire4);
              reg14 <= (reg12 == reg14);
              reg15 <= ($signed((-(~|((8'ha2) & wire3)))) * {{wire1},
                  (wire9[(1'h1):(1'h0)] && reg11)});
            end
          if ($signed(((&$signed($signed((7'h43)))) ?
              (~|$signed(((8'ha0) ? wire2 : wire5))) : (reg14[(4'h9):(3'h7)] ?
                  wire7 : (~|$unsigned(wire10))))))
            begin
              reg16 <= (wire9 ? (~^wire2[(3'h7):(1'h1)]) : wire7);
              reg17 <= {(($unsigned((~wire3)) == wire7[(3'h7):(3'h5)]) > $unsigned($unsigned($signed(wire1)))),
                  (~|{({wire1} ? $signed(reg11) : wire1)})};
              reg18 <= reg13[(1'h0):(1'h0)];
              reg19 <= reg14[(3'h5):(1'h0)];
              reg20 <= wire9[(4'hf):(3'h4)];
            end
          else
            begin
              reg16 <= ($signed(reg16[(2'h3):(1'h1)]) ?
                  ($signed((~^(reg12 ? wire7 : wire9))) ?
                      $signed((~|$unsigned(wire9))) : {($unsigned(wire0) ?
                              {reg11} : wire5)}) : ({{(~^reg13),
                          (wire5 ? reg11 : reg15)}} ^~ ($signed({(8'hb3),
                          (8'hb0)}) ?
                      ((reg12 ? reg12 : wire8) ?
                          (wire7 ?
                              wire7 : wire6) : $unsigned((7'h42))) : reg14)));
              reg17 <= ($unsigned($unsigned({reg15})) * $unsigned(((~$unsigned((8'hba))) ?
                  ({wire5, reg13} > (wire5 ? wire4 : (8'ha2))) : wire1)));
              reg18 <= wire1;
              reg19 <= {wire2};
            end
        end
      else
        begin
          reg11 <= ((-reg15) & $signed(reg19));
          if ((((~reg13[(2'h2):(1'h1)]) ^ reg17) ?
              wire6 : ($unsigned(((reg13 ?
                  reg20 : reg15) >>> wire5)) ^~ (($unsigned(reg15) == $signed(wire2)) ?
                  reg15[(2'h2):(1'h0)] : $signed((&wire8))))))
            begin
              reg12 <= $signed(($signed(wire5) ?
                  (reg17 ?
                      wire8[(2'h2):(2'h2)] : (~&(reg19 ?
                          (8'had) : (8'had)))) : (&(reg15[(2'h2):(2'h2)] || (8'had)))));
              reg13 <= reg18[(4'h8):(2'h2)];
              reg14 <= wire3[(2'h3):(1'h0)];
              reg15 <= {(^~$signed((-(wire10 ? (8'ha1) : wire10)))),
                  $unsigned((((reg13 >>> reg13) ?
                      reg14[(3'h6):(3'h4)] : $unsigned((8'hbe))) | ((reg11 ?
                      reg16 : (8'hb7)) <= ((8'hac) | (8'hbc)))))};
            end
          else
            begin
              reg12 <= (&$unsigned(({reg20[(4'hd):(4'hd)], (+reg18)} < ((reg12 ?
                      reg20 : wire5) ?
                  (reg15 || wire0) : wire8[(3'h4):(1'h1)]))));
              reg13 <= reg18[(4'h9):(3'h5)];
              reg14 <= $unsigned((|{$unsigned((^~reg17))}));
            end
          if ($unsigned(reg16))
            begin
              reg16 <= ((reg12 ?
                      ($signed($signed((8'hb1))) ?
                          wire3[(4'h9):(3'h5)] : $signed((~reg16))) : {(^~$unsigned(wire7)),
                          ($unsigned((8'hae)) < {reg19})}) ?
                  (reg17 ?
                      reg19[(3'h7):(3'h4)] : wire5) : ({({reg19} >>> (&wire1))} >> ($signed($signed(reg15)) ?
                      {$signed(wire6), {reg15}} : ((reg16 ? (8'hba) : wire2) ?
                          wire0[(3'h5):(1'h1)] : $unsigned(wire10)))));
              reg17 <= wire7[(1'h0):(1'h0)];
              reg18 <= $unsigned(wire6[(3'h4):(1'h0)]);
            end
          else
            begin
              reg16 <= $signed($signed((((wire10 ? reg19 : reg13) ?
                      {wire1, reg12} : $signed(reg20)) ?
                  $unsigned((^wire0)) : ({reg17} && wire2))));
              reg17 <= $signed(wire7[(5'h11):(5'h10)]);
              reg18 <= $signed(reg17[(3'h4):(1'h1)]);
            end
          reg19 <= $unsigned($signed($signed($signed(reg13))));
          if ($unsigned((-wire4[(4'hd):(4'hd)])))
            begin
              reg20 <= wire2;
              reg21 <= $unsigned($unsigned($unsigned(((wire8 + reg13) ?
                  (wire2 ? reg18 : wire3) : reg20))));
            end
          else
            begin
              reg20 <= ((~(8'hb1)) ^~ wire3[(4'ha):(3'h5)]);
              reg21 <= $signed((~reg13[(2'h2):(1'h0)]));
              reg22 <= reg15;
              reg23 <= ($signed(($signed($unsigned(wire10)) ~^ $unsigned(((8'hb7) <= reg11)))) & (~^(($signed(wire1) ^ (&wire5)) > (reg11 - ((8'ha2) < wire8)))));
              reg24 <= wire1[(2'h3):(2'h3)];
            end
        end
    end
  assign wire25 = $unsigned((($unsigned(wire3[(4'ha):(4'h8)]) ?
                      ((wire8 < (8'hb0)) ?
                          (reg22 ?
                              reg13 : wire10) : (reg24 - reg16)) : $signed((&(8'had)))) + reg23[(3'h4):(2'h3)]));
  assign wire26 = (+reg12[(1'h0):(1'h0)]);
  assign wire27 = (wire1[(4'he):(4'he)] > (wire25[(5'h11):(4'ha)] ?
                      {$unsigned(((8'h9e) | wire3)),
                          $signed((reg21 + (8'hac)))} : $signed($unsigned((8'hbc)))));
endmodule
