module top
#(parameter param61 = {(!(({(8'hb0)} > (^~(8'hbd))) ? (-((8'hbe) ? (8'ha2) : (8'hb0))) : ((~(8'hbe)) >= (!(8'hb9))))), (((~&(~|(8'h9f))) && {((8'haa) ? (8'hba) : (8'ha9)), ((8'hb7) ? (8'hb6) : (8'hab))}) ? (((!(8'hb0)) ? ((8'h9f) - (7'h42)) : {(8'hbd), (8'hb2)}) ? (((8'hb3) ? (8'ha6) : (7'h44)) <<< ((8'ha2) < (7'h41))) : (((8'ha3) ? (8'hb0) : (7'h42)) ? ((8'ha5) ? (8'hb4) : (8'hab)) : (^(8'h9c)))) : {{((8'ha5) ? (7'h42) : (8'hb2)), {(8'ha7), (8'had)}}})}, 
parameter param62 = (^~{(((param61 ? param61 : param61) ? param61 : (~&param61)) >> (&{param61})), (param61 ? (~^(param61 ? param61 : param61)) : param61)}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire51;
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire4,
                 wire51,
                 reg54,
                 (1'h0)};
  assign wire4 = (+(~&({wire3[(1'h0):(1'h0)],
                     (^wire2)} <<< {$unsigned(wire2)})));
  module5 #() modinst52 (wire51, clk, wire3, wire1, wire0, wire2, wire4);
  assign wire53 = $unsigned((wire2[(3'h4):(2'h3)] ?
                      ($signed((wire1 ? wire1 : (8'ha2))) > wire4) : wire4));
  always
    @(posedge clk) begin
      reg54 <= wire53;
    end
  assign wire55 = wire3[(4'h9):(1'h1)];
  assign wire56 = ({(($unsigned(wire4) ?
                          (wire51 <= wire3) : (~&wire4)) + wire51)} >> $signed($signed($unsigned(wire51[(3'h5):(1'h1)]))));
  assign wire57 = (((-((wire53 ? wire1 : wire3) ?
                          wire2[(4'h9):(2'h2)] : (wire3 ?
                              wire1 : wire3))) | (({reg54,
                          reg54} * $signed(reg54)) || {$signed(wire56)})) ?
                      wire51[(3'h7):(1'h1)] : wire55[(2'h2):(2'h2)]);
  assign wire58 = wire0;
  assign wire59 = $signed({(((wire2 ? wire53 : reg54) >> (wire2 ?
                          (8'ha3) : wire55)) <= ((wire0 ~^ wire4) >= (wire2 ?
                          wire4 : (8'ha9)))),
                      $signed($signed(reg54[(4'h8):(3'h6)]))});
  assign wire60 = $unsigned($signed(reg54[(3'h5):(3'h4)]));
endmodule

module module5
#(parameter param50 = ({((~^{(8'h9e)}) ? {((8'hae) ? (8'haa) : (8'hb2))} : (-(~^(8'hb6)))), (|((~|(8'h9c)) ? ((8'h9d) ? (8'h9d) : (8'ha4)) : {(8'hb4), (8'hba)}))} ? ((8'h9f) ? (^(~&((8'hb0) ? (8'h9f) : (8'haa)))) : (!(((8'hb9) ? (8'h9f) : (8'h9d)) ^ ((7'h44) ~^ (8'hb1))))) : ((!{((8'hb8) ? (8'hbd) : (8'hb9))}) ? ((((8'ha8) - (8'hb2)) ? ((8'hba) ? (8'ha2) : (8'hb1)) : {(8'ha4), (8'ha1)}) == (^{(8'ha9)})) : {(((8'hb9) <= (8'ha8)) > ((8'ha2) == (8'hab))), ((~^(8'hb6)) <= {(8'hb4)})})))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire46;
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire11,
                 wire12,
                 wire21,
                 wire46,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = $signed((-$unsigned(wire6)));
  assign wire12 = wire10[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (wire6)
        begin
          if (((wire9[(5'h10):(2'h3)] > $signed((~&(|wire12)))) ?
              {(~^$unsigned(wire9))} : ({wire11,
                  wire11[(3'h4):(2'h2)]} != $unsigned((wire10 ?
                  (-wire11) : $signed(wire11))))))
            begin
              reg13 <= $unsigned(wire11);
              reg14 <= {$signed((($signed(wire10) ?
                          $signed(wire8) : wire12[(4'hc):(2'h2)]) ?
                      wire11 : $signed($signed(wire7))))};
              reg15 <= $unsigned(((+($unsigned(wire10) + (8'h9c))) ?
                  wire8[(3'h4):(3'h4)] : reg14));
              reg16 <= (^~wire9);
              reg17 <= $unsigned((8'hb1));
            end
          else
            begin
              reg13 <= (^$unsigned($unsigned(wire10[(4'h9):(2'h3)])));
              reg14 <= {$signed((~|$unsigned((wire12 ? wire10 : reg16)))),
                  wire6[(1'h1):(1'h1)]};
            end
          reg18 <= {wire11, {(+wire8[(3'h7):(3'h4)])}};
          reg19 <= $unsigned($unsigned(reg17));
          reg20 <= $unsigned(((^~{((8'hae) ? wire11 : reg15),
                  (wire11 == reg19)}) ?
              ((~|(wire11 != reg14)) ?
                  (^~$signed((8'haa))) : reg18[(2'h3):(2'h2)]) : (((!wire9) << (wire8 <= wire8)) ?
                  reg19 : $signed($unsigned(wire11)))));
        end
      else
        begin
          reg13 <= $signed(wire11[(2'h2):(1'h1)]);
          if ({reg15})
            begin
              reg14 <= (&$unsigned({(|wire12)}));
            end
          else
            begin
              reg14 <= $unsigned(($unsigned($unsigned(wire11)) >>> $signed($unsigned(reg15))));
              reg15 <= ($signed(reg15) ?
                  $unsigned(wire7[(3'h4):(2'h3)]) : $signed(({(wire7 >= reg20),
                          (wire8 ? reg20 : wire10)} ?
                      ($unsigned(reg13) ?
                          (8'hb4) : wire11[(4'hb):(3'h6)]) : (wire10 < (~|(8'ha6))))));
              reg16 <= ($signed($signed($unsigned((reg14 > wire7)))) <= wire9[(4'h8):(2'h3)]);
              reg17 <= ($signed(($unsigned((wire8 ? reg17 : wire7)) + ((reg20 ?
                          wire8 : reg13) ?
                      reg19 : (reg20 ? (8'had) : wire12)))) ?
                  wire6 : (reg19[(4'ha):(4'h9)] ?
                      (8'h9e) : ({(wire12 ? reg17 : wire12),
                              (reg14 ? wire7 : wire8)} ?
                          (~^(wire8 ? wire10 : reg17)) : (!reg14))));
            end
        end
    end
  assign wire21 = (~|(7'h40));
  module22 #() modinst47 (.wire27(reg13), .wire24(reg17), .y(wire46), .wire26(wire7), .wire23(reg16), .clk(clk), .wire25(reg15));
  assign wire48 = {$signed((|$signed(((7'h44) ? reg13 : reg19)))),
                      reg13[(1'h0):(1'h0)]};
  assign wire49 = $signed($signed($signed(($signed(reg20) > $signed(reg19)))));
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire27;
  input wire [(5'h14):(1'h0)] wire26;
  input wire [(5'h14):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire [(5'h11):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire28 = wire27[(1'h0):(1'h0)];
  assign wire29 = ((+wire27[(2'h2):(2'h2)]) ~^ ((~{wire23[(4'hc):(4'hc)],
                      {wire23}}) && $signed($signed((8'hb3)))));
  assign wire30 = $signed(($signed(wire25[(4'hb):(3'h6)]) ?
                      $signed(wire25[(4'hf):(4'h9)]) : ({wire29[(3'h5):(2'h3)]} ?
                          $signed($unsigned(wire23)) : ($unsigned(wire28) != (wire27 | wire25)))));
  assign wire31 = $signed((~wire26));
  assign wire32 = {(8'ha6)};
  assign wire33 = {(~|wire32)};
  assign wire34 = (wire29 ? (&(~&(+wire30))) : wire30);
  always
    @(posedge clk) begin
      if ((+$signed({{(8'hb8), (wire33 << wire32)}})))
        begin
          reg35 <= (({(((8'had) ? wire23 : wire33) ^~ wire27)} ?
                  (+(~wire33)) : $signed($signed(wire25))) ?
              (|(8'hab)) : wire29);
          reg36 <= $unsigned((wire23[(4'h8):(3'h7)] ?
              $signed($signed($unsigned(wire30))) : (($signed(wire28) ?
                      ((8'hb4) <= wire23) : (wire27 ? wire34 : wire26)) ?
                  $signed((+reg35)) : $signed((wire26 ? reg35 : wire28)))));
          if (((($signed(((8'hba) ?
              wire27 : wire26)) << reg36) <<< wire33) < (-wire26[(4'ha):(4'h9)])))
            begin
              reg37 <= reg35[(3'h4):(1'h0)];
              reg38 <= $signed({reg36});
              reg39 <= ($signed(wire34[(4'h8):(3'h4)]) ?
                  $signed(wire27[(1'h1):(1'h0)]) : (reg35 <<< wire25[(3'h7):(1'h1)]));
              reg40 <= (|{wire23[(4'ha):(4'h8)]});
              reg41 <= $unsigned(({((~^reg36) * (-wire24))} ?
                  (|($unsigned((7'h43)) == wire32)) : reg40));
            end
          else
            begin
              reg37 <= $signed(wire24[(3'h7):(1'h0)]);
              reg38 <= (+$unsigned((($signed(reg38) >= (wire25 || reg38)) ?
                  ($unsigned(wire34) ?
                      $unsigned(reg41) : reg40) : {wire32[(4'h8):(2'h2)],
                      (&reg35)})));
              reg39 <= ((&((^~((8'ha0) >>> wire31)) - ($unsigned(wire27) ?
                      wire25 : ((8'hbb) + wire33)))) ?
                  ($unsigned($signed($signed((8'ha5)))) + wire29[(4'h9):(3'h7)]) : (&({$unsigned(reg37)} ?
                      $signed((^wire27)) : wire28)));
            end
          reg42 <= wire32[(2'h3):(1'h1)];
        end
      else
        begin
          reg35 <= reg41;
          reg36 <= (~&((~&$signed((reg37 || wire23))) ?
              reg42[(5'h11):(4'h8)] : (wire34 ?
                  $unsigned($unsigned(wire32)) : reg40)));
        end
    end
  assign wire43 = reg35[(3'h5):(3'h4)];
  assign wire44 = wire43[(1'h0):(1'h0)];
  assign wire45 = (wire29[(4'hc):(2'h2)] < {{$unsigned(wire29[(3'h4):(2'h2)])}});
endmodule
