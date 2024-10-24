module top
#(parameter param53 = (({(8'h9c), ((^(8'hbd)) << ((8'hbf) ? (8'ha4) : (8'ha7)))} ? {((~^(8'hbc)) ? (-(8'hb6)) : ((8'ha8) ^ (8'hbc)))} : ({((7'h43) < (8'hb6)), ((8'ha3) ? (8'hac) : (7'h41))} ? (~&(~(8'hb6))) : ((~^(8'ha7)) * ((8'ha8) * (8'hb1))))) & (!((^~((8'hb9) >> (8'haf))) ^~ ({(8'h9d), (8'hb3)} ^~ ((8'hbb) ? (8'hac) : (8'ha9)))))), 
parameter param54 = {(param53 ? param53 : {param53}), param53})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire43;
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  assign y = {wire52,
                 wire45,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire43,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire5 = ($unsigned((!$unsigned((&wire3)))) ?
                     wire1 : {(wire4 ?
                             $signed(wire3) : ((7'h41) ?
                                 (8'h9c) : (wire2 ? wire4 : wire2)))});
  assign wire6 = $unsigned({wire5, wire3});
  assign wire7 = wire0[(2'h2):(1'h1)];
  assign wire8 = {$signed(wire7[(3'h6):(3'h6)]),
                     ((~(|(wire1 < wire3))) ?
                         $unsigned($unsigned((&wire6))) : {(^~wire1[(1'h1):(1'h0)])})};
  always
    @(posedge clk) begin
      if ($signed(wire5[(1'h0):(1'h0)]))
        begin
          if ({wire7})
            begin
              reg9 <= (|(^(-wire3[(2'h2):(1'h0)])));
            end
          else
            begin
              reg9 <= (reg9 ?
                  $signed($unsigned($signed({wire2}))) : (^~$unsigned((wire7[(4'h9):(4'h8)] ?
                      (8'ha2) : wire1[(2'h2):(2'h2)]))));
              reg10 <= $signed(wire5);
            end
        end
      else
        begin
          reg9 <= wire7;
          if ((((reg10[(5'h13):(4'he)] != (~wire6[(1'h1):(1'h1)])) <<< ((reg9 ^~ wire8) << $signed({wire2,
                  wire6}))) ?
              $unsigned(($signed($unsigned(wire3)) && wire5)) : wire5))
            begin
              reg10 <= wire7;
              reg11 <= $unsigned((8'hb7));
              reg12 <= $signed({reg9[(3'h6):(1'h1)]});
            end
          else
            begin
              reg10 <= wire1;
              reg11 <= $signed($unsigned((~|$unsigned((wire1 ?
                  reg10 : wire1)))));
              reg12 <= wire4;
              reg13 <= wire1;
              reg14 <= $unsigned($unsigned(reg13));
            end
          reg15 <= ({$signed(wire2),
                  $signed($signed((reg9 ? (8'ha2) : wire4)))} ?
              wire4 : (wire6[(2'h3):(1'h0)] | wire7));
          reg16 <= ($signed(((&$unsigned(wire5)) ?
              {(reg9 ?
                      wire2 : wire0)} : $signed((^reg15)))) - reg10[(1'h0):(1'h0)]);
        end
      reg17 <= $unsigned($signed((((wire5 ? wire6 : wire7) ?
              (reg12 | reg10) : wire3[(3'h5):(3'h5)]) ?
          reg13[(2'h2):(1'h0)] : reg15)));
      reg18 <= (~&{reg10, reg15});
      reg19 <= $signed((~|(~&$unsigned(wire5[(1'h0):(1'h0)]))));
    end
  assign wire20 = {wire8};
  assign wire21 = {wire3[(2'h2):(2'h2)],
                      $signed(((&reg17[(3'h5):(2'h3)]) | (~{wire2})))};
  assign wire22 = $signed(wire8);
  assign wire23 = reg10[(4'h8):(3'h4)];
  module24 #() modinst44 (wire43, clk, wire0, reg11, wire6, wire1);
  assign wire45 = $signed(wire43[(4'hb):(2'h3)]);
  always
    @(posedge clk) begin
      reg46 <= (wire43[(4'h9):(4'h8)] || ((~^(8'h9e)) ?
          $signed(((wire0 <= reg18) | wire43)) : reg18[(5'h10):(4'hc)]));
      reg47 <= $unsigned((^((reg13 <<< {reg9}) ?
          (!$unsigned((8'hac))) : (!$unsigned(reg18)))));
      reg48 <= reg11[(5'h12):(5'h10)];
      reg49 <= (((reg12 && {wire23,
          {reg19,
              (8'ha7)}}) != wire43[(4'hb):(2'h2)]) - (~^{$signed($signed(reg48))}));
      reg50 <= (((&(|$signed(wire22))) & (~^(~|$signed(wire3)))) - (~|$unsigned(reg47)));
    end
  always
    @(posedge clk) begin
      reg51 <= (~&(reg12 ^~ (|($signed(wire1) ?
          (reg9 <= wire3) : (reg11 + wire0)))));
    end
  assign wire52 = wire3[(3'h5):(1'h1)];
endmodule

module module24
#(parameter param42 = (8'ha6))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire31,
                 wire30,
                 wire29,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire29 = wire26[(2'h3):(2'h3)];
  assign wire30 = {wire25[(3'h6):(3'h6)], $signed(wire26[(4'hc):(2'h3)])};
  assign wire31 = {(wire29 & $unsigned(wire28[(3'h5):(2'h2)]))};
  always
    @(posedge clk) begin
      reg32 <= {{(!wire26[(4'ha):(4'h8)]),
              ((((8'hab) <= wire30) & $signed(wire26)) >> $signed(wire28[(4'ha):(2'h2)]))},
          {(^wire26), (+(&((8'hb2) - wire25)))}};
      if ($signed({wire27,
          ($unsigned($unsigned((8'haa))) ^~ ((+reg32) - (~^wire31)))}))
        begin
          reg33 <= wire25;
          reg34 <= $unsigned($signed($unsigned((wire25 ?
              $signed(wire29) : (wire26 > wire31)))));
          reg35 <= $unsigned($signed((-wire28)));
          reg36 <= ((8'hb3) ?
              $unsigned($unsigned(reg35[(3'h5):(3'h4)])) : $unsigned({$unsigned(wire30)}));
        end
      else
        begin
          reg33 <= (^~reg34);
          if (((reg33[(1'h1):(1'h1)] == ((+$unsigned(wire25)) ?
                  reg33 : $unsigned(wire25[(2'h2):(1'h1)]))) ?
              (^~reg34[(2'h2):(1'h0)]) : (~|wire25[(5'h11):(3'h4)])))
            begin
              reg34 <= wire25;
              reg35 <= (^~wire27);
              reg36 <= wire26[(5'h11):(2'h3)];
              reg37 <= reg36;
              reg38 <= (~|$signed(wire29));
            end
          else
            begin
              reg34 <= $unsigned($signed(reg32));
              reg35 <= wire26;
              reg36 <= wire31;
              reg37 <= $unsigned($unsigned(($unsigned($unsigned(wire29)) ^ ($signed(reg38) ?
                  (reg37 ? reg32 : reg33) : $signed((7'h42))))));
              reg38 <= (wire28[(1'h0):(1'h0)] ?
                  wire31[(4'hf):(1'h1)] : reg33[(4'h8):(2'h2)]);
            end
        end
      reg39 <= wire27[(2'h3):(2'h3)];
    end
  assign wire40 = reg37[(2'h2):(1'h0)];
  assign wire41 = $signed(reg37[(3'h4):(3'h4)]);
endmodule
