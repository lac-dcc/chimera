module top
#(parameter param37 = ({((((8'ha4) | (8'h9f)) ? ((8'ha5) ? (8'hb4) : (8'ha1)) : ((7'h44) ? (8'ha2) : (8'hbc))) <<< (!((7'h40) ? (8'hb4) : (8'hb6)))), (!(((8'h9d) ? (8'ha8) : (8'ha3)) >= {(8'haf), (8'hb5)}))} ? {(~^((^(8'ha3)) << (|(8'hbd))))} : ((|(^~((8'hbb) ? (8'ha7) : (8'hbc)))) ? (((8'hbc) ? ((7'h41) ^~ (8'hbc)) : ((8'hbe) ? (8'hbe) : (8'h9c))) ? {(~&(8'hb7))} : ({(8'ha0), (8'hbf)} ? (~|(8'ha1)) : {(8'ha1), (7'h42)})) : (~((8'hb3) >>> (!(7'h40)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg10,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = ($unsigned({wire3[(1'h1):(1'h1)]}) ?
                     (~|($unsigned((+(8'hae))) ?
                         $signed(wire1) : (~|wire4))) : ($unsigned(wire0) <= $unsigned(($unsigned(wire1) | (^~wire3)))));
  assign wire6 = ({wire2, $signed((^$unsigned(wire0)))} << wire2);
  assign wire7 = wire1[(3'h7):(1'h0)];
  assign wire8 = ($signed($unsigned((+(~|wire2)))) << {$signed(((^wire0) ?
                         $signed((8'ha1)) : wire3[(2'h3):(1'h1)]))});
  assign wire9 = ($unsigned((wire0 ?
                     (|$signed((8'hb8))) : wire8)) > $signed(wire1));
  always
    @(posedge clk) begin
      reg10 <= $unsigned($unsigned((((wire6 <<< wire0) < ((8'ha2) ?
              wire2 : (8'haa))) ?
          wire3[(3'h6):(1'h0)] : $signed($unsigned(wire5)))));
      reg11 <= (~(~&(((|wire5) || reg10) ?
          {$signed(wire5)} : $unsigned(wire3[(1'h1):(1'h0)]))));
      if (wire2[(1'h0):(1'h0)])
        begin
          if ((wire5[(2'h3):(1'h0)] ?
              wire0[(2'h3):(1'h1)] : wire3[(1'h1):(1'h0)]))
            begin
              reg12 <= wire9;
              reg13 <= wire9;
              reg14 <= (^~wire5[(1'h1):(1'h0)]);
            end
          else
            begin
              reg12 <= (wire5 + wire0[(2'h3):(2'h2)]);
              reg13 <= (~wire5);
              reg14 <= (^($signed(((+wire1) ?
                      (wire2 ? wire8 : (8'hb7)) : wire5[(1'h0):(1'h0)])) ?
                  reg14 : {{$unsigned(wire1)}, (~&wire5)}));
              reg15 <= (wire7[(1'h0):(1'h0)] << (($signed((wire3 + wire0)) ?
                  $signed($signed(wire0)) : wire4[(3'h5):(2'h2)]) * wire3));
              reg16 <= reg10[(1'h0):(1'h0)];
            end
          reg17 <= (~^{(8'hb2)});
          if (wire0)
            begin
              reg18 <= (^~(((+$signed(wire5)) < $signed(reg13[(1'h0):(1'h0)])) || reg13));
            end
          else
            begin
              reg18 <= reg11[(1'h1):(1'h0)];
              reg19 <= (~|(|$unsigned($unsigned(((8'had) ? wire9 : wire2)))));
            end
          reg20 <= {((8'hb9) ^ wire3),
              ((($signed(reg14) | wire8[(1'h1):(1'h1)]) ?
                      (wire3[(3'h7):(3'h7)] ~^ {reg12,
                          (8'ha0)}) : wire4[(3'h4):(2'h2)]) ?
                  wire9 : ((reg12 ?
                      (wire3 ? wire4 : reg17) : {wire1,
                          (8'hb3)}) * ((^wire9) ^ $unsigned((8'hba)))))};
          if (($unsigned(($unsigned((&wire9)) ?
                  (^(wire3 ? wire7 : reg20)) : {$unsigned(wire2),
                      $unsigned(reg11)})) ?
              $unsigned($signed((~(reg14 ?
                  (8'hbf) : wire7)))) : $unsigned($unsigned(wire4[(4'hc):(1'h1)]))))
            begin
              reg21 <= reg17[(4'hb):(1'h0)];
            end
          else
            begin
              reg21 <= {reg13[(1'h0):(1'h0)], wire5};
            end
        end
      else
        begin
          if ($unsigned(($unsigned($unsigned((~wire5))) > $unsigned(wire6[(3'h7):(2'h3)]))))
            begin
              reg12 <= ($signed($signed(((reg12 ? reg12 : reg10) ?
                      (reg16 + reg20) : (reg11 ? wire5 : wire5)))) ?
                  (wire8[(1'h1):(1'h1)] ?
                      $unsigned(reg10[(3'h5):(2'h3)]) : (reg15[(4'hb):(4'h8)] ?
                          wire7[(1'h0):(1'h0)] : $signed((reg11 ?
                              reg16 : reg17)))) : $unsigned($signed($signed(reg12[(4'h8):(3'h6)]))));
              reg13 <= (^($unsigned({(reg19 ? reg10 : reg19)}) ^ ({(8'hb7)} ?
                  $unsigned(wire9[(1'h1):(1'h0)]) : $signed((~wire6)))));
              reg14 <= ((wire6[(2'h3):(2'h2)] ?
                      (8'h9d) : (^~((-reg12) ? $signed(reg16) : (~|reg15)))) ?
                  $unsigned(wire2[(1'h0):(1'h0)]) : $unsigned($signed(wire0[(3'h6):(1'h1)])));
            end
          else
            begin
              reg12 <= (wire8 ?
                  reg15[(4'h8):(4'h8)] : $signed($unsigned($signed($signed(reg17)))));
              reg13 <= reg12[(3'h7):(2'h3)];
              reg14 <= ($unsigned((({(8'hb9), reg18} ?
                      reg19[(4'h8):(2'h2)] : {reg14}) > (8'ha3))) ?
                  $unsigned($unsigned({wire1[(3'h6):(1'h1)]})) : reg18);
            end
          reg15 <= ((|$signed($signed(reg20))) ?
              (wire6 ?
                  $unsigned($signed(reg13)) : {((wire0 <<< reg14) ?
                          {reg11, wire0} : (&wire4)),
                      $unsigned((wire5 < reg20))}) : ((~reg12) ~^ wire6[(2'h3):(2'h3)]));
          if (wire0)
            begin
              reg16 <= wire6[(3'h7):(3'h5)];
              reg17 <= (reg14 >>> reg18[(1'h1):(1'h1)]);
              reg18 <= (^~reg13[(2'h3):(1'h1)]);
              reg19 <= ((^~(($signed((8'ha6)) ?
                          (reg13 ? wire4 : (8'h9e)) : {reg10}) ?
                      $signed(wire0) : $unsigned(wire1[(3'h6):(1'h1)]))) ?
                  (!$signed((+wire9[(1'h0):(1'h0)]))) : ((8'ha4) ^ $unsigned((^(-(8'hbc))))));
            end
          else
            begin
              reg16 <= $unsigned(wire7);
              reg17 <= (+reg19);
              reg18 <= (~({reg13[(2'h2):(1'h0)],
                  wire2[(1'h0):(1'h0)]} | wire5[(1'h0):(1'h0)]));
              reg19 <= reg21[(3'h6):(3'h4)];
              reg20 <= (8'hb4);
            end
        end
      reg22 <= $signed({($signed($unsigned(wire4)) >>> wire2)});
    end
  assign wire23 = ($signed({$unsigned(reg21),
                          ((reg19 & (7'h42)) ? (~reg18) : (reg14 >> reg16))}) ?
                      (&($signed({reg19}) && reg22)) : (^(^$signed((8'hb8)))));
  assign wire24 = wire4;
  assign wire25 = $signed({$signed(($unsigned(wire23) ?
                          $unsigned(wire24) : $signed((7'h40)))),
                      wire2[(1'h1):(1'h0)]});
  assign wire26 = $signed(reg22);
  assign wire27 = wire1[(2'h2):(2'h2)];
  assign wire28 = wire25[(4'ha):(2'h3)];
  assign wire29 = ($unsigned((((&wire27) ^ $unsigned(wire28)) << wire26)) >> reg21[(3'h5):(3'h5)]);
  assign wire30 = (&(~&$signed($signed($unsigned(reg10)))));
  assign wire31 = (+$unsigned($unsigned({wire7[(3'h6):(3'h4)]})));
  assign wire32 = {reg13[(2'h2):(1'h1)]};
  assign wire33 = (reg21[(3'h7):(3'h4)] ?
                      wire26 : $unsigned(wire9[(4'h8):(3'h5)]));
  assign wire34 = (|$unsigned((($signed((8'hb9)) ? {reg12, wire28} : (+reg18)) ?
                      ((wire26 > wire5) ?
                          reg22 : ((8'hbb) >>> wire24)) : wire23[(3'h6):(1'h0)])));
  assign wire35 = ((~^$unsigned(reg17[(3'h6):(1'h0)])) ?
                      (($signed(((8'haa) <= reg10)) ~^ $unsigned(((7'h41) & wire6))) ?
                          $unsigned(wire28[(4'he):(4'hc)]) : (+({wire9, reg14} ?
                              $unsigned((7'h42)) : wire3[(3'h5):(1'h0)]))) : ((^$signed($signed(wire9))) ?
                          ($signed(((8'hab) ? wire3 : wire3)) ?
                              (^~$unsigned((7'h43))) : $signed({reg16})) : $unsigned(((reg21 ?
                                  wire1 : (8'ha6)) ?
                              wire5[(2'h3):(2'h3)] : {reg17, wire6}))));
  assign wire36 = {(~&(|reg16)), reg11};
endmodule
