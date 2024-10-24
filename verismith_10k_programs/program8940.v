module top
#(parameter param41 = {(!((!((8'h9d) ? (8'hb4) : (8'ha8))) ? ((7'h42) ? ((8'hbe) > (8'ha2)) : ((7'h42) < (8'hb8))) : ({(7'h43), (8'ha1)} - ((8'hbe) & (8'hab))))), ((+(8'hac)) * (((~&(8'ha7)) ? ((7'h43) <<< (8'hbe)) : ((8'h9e) | (8'hb9))) > (~^(+(8'ha0)))))}, 
parameter param42 = ((-(param41 ^ {(^param41), (param41 >> param41)})) - (8'h9d)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire39;
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire24,
                 wire25,
                 wire26,
                 wire39,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {($unsigned($signed(wire4[(1'h1):(1'h1)])) ?
              wire0 : ($signed((^~wire1)) >> $signed(wire1))),
          $unsigned((((wire0 > wire2) ?
              $signed(wire2) : wire4) || wire3[(4'hd):(3'h6)]))};
      if ((&$signed(wire3[(1'h1):(1'h0)])))
        begin
          reg6 <= $signed(((!$unsigned((8'haf))) >>> (wire3[(1'h0):(1'h0)] ?
              $signed((^~wire4)) : $unsigned($signed(wire1)))));
          if ($signed((wire2 <<< $unsigned($signed(wire0)))))
            begin
              reg7 <= $unsigned((wire2 - wire4[(2'h3):(2'h3)]));
              reg8 <= ({reg6[(4'he):(4'h9)],
                      {$signed($signed(reg5)), $unsigned((|(8'ha7)))}} ?
                  reg6 : $unsigned($unsigned(reg5[(3'h7):(3'h6)])));
            end
          else
            begin
              reg7 <= $signed(wire1);
            end
          reg9 <= $signed($unsigned($unsigned(reg6)));
          reg10 <= $unsigned(((|wire4) ?
              $signed(wire3) : {(~&$signed(wire3)),
                  $unsigned($unsigned(wire2))}));
          if ((reg9 ? wire4[(3'h7):(3'h7)] : (+reg7)))
            begin
              reg11 <= $signed($unsigned($unsigned($unsigned({reg6}))));
              reg12 <= ($signed(({(wire0 ? reg8 : reg9)} ?
                  (!(+reg8)) : ((reg9 && wire1) ?
                      (8'hb4) : (reg6 | (8'ha2))))) | reg9[(2'h2):(2'h2)]);
              reg13 <= reg9;
              reg14 <= reg10;
              reg15 <= {reg6[(4'hf):(4'he)],
                  (~|$unsigned((reg6 == $unsigned(reg14))))};
            end
          else
            begin
              reg11 <= $unsigned((reg6[(4'hc):(3'h4)] ?
                  reg15[(3'h5):(3'h4)] : $unsigned((~^reg7[(4'hf):(2'h3)]))));
              reg12 <= ((|$signed($signed((~|wire3)))) > $signed(reg5));
              reg13 <= $signed($signed($unsigned(((~reg7) < ((8'ha9) ?
                  reg7 : (8'hb2))))));
              reg14 <= (($signed($signed((reg14 == reg11))) ?
                  wire2[(2'h2):(1'h0)] : reg5) && reg14);
            end
        end
      else
        begin
          reg6 <= ($signed(reg5[(2'h2):(2'h2)]) ?
              {(wire3[(1'h0):(1'h0)] ^ ($unsigned(reg6) ?
                      $signed(reg11) : $unsigned(wire0))),
                  reg11[(3'h5):(3'h4)]} : (reg13[(1'h1):(1'h1)] & $signed(reg8)));
          reg7 <= wire2;
          reg8 <= (reg6[(5'h11):(2'h3)] ^~ $unsigned((8'hb1)));
          reg9 <= ($unsigned((^$signed((wire2 >= wire3)))) > wire3[(1'h0):(1'h0)]);
          reg10 <= (($signed(reg9) ?
              (!wire0) : ((wire4 ~^ (reg15 ? reg13 : reg11)) ?
                  ((reg10 ? reg10 : reg10) ?
                      (~|wire1) : $unsigned(wire0)) : reg8[(3'h4):(3'h4)])) <<< {$unsigned($unsigned($signed(wire2)))});
        end
      reg16 <= wire1;
      if ((8'hac))
        begin
          if (wire2)
            begin
              reg17 <= reg5;
            end
          else
            begin
              reg17 <= $signed((^~$unsigned((|$unsigned(reg11)))));
              reg18 <= reg16[(3'h6):(2'h2)];
            end
          reg19 <= ($signed((~reg8)) ?
              $signed((+reg15)) : (($signed((~reg15)) ~^ $unsigned($signed(reg13))) ?
                  reg9[(1'h0):(1'h0)] : (~$signed($unsigned(reg7)))));
        end
      else
        begin
          if ($signed((reg6[(4'h8):(3'h6)] ?
              (!(((8'hbd) ^ reg6) ?
                  (~reg13) : (reg11 >>> reg17))) : ($signed((7'h41)) + wire2))))
            begin
              reg17 <= (-({$signed($unsigned(reg7)),
                      {(+reg7), $signed(reg14)}} ?
                  reg10 : $signed(({wire0, reg17} ?
                      wire0 : (reg15 >>> wire4)))));
              reg18 <= {reg5, reg8};
              reg19 <= reg12[(2'h3):(1'h0)];
              reg20 <= {{reg17}};
            end
          else
            begin
              reg17 <= wire0[(1'h0):(1'h0)];
            end
          reg21 <= ({($unsigned(reg16) + wire3[(5'h13):(5'h11)])} ?
              ((~|(reg5[(3'h4):(1'h0)] >= reg5)) ^ (((reg12 ? reg20 : wire0) ?
                      (~|(8'hbc)) : (reg12 == reg17)) ?
                  reg19[(4'h9):(4'h9)] : reg10)) : (8'haa));
          reg22 <= (8'hae);
        end
      reg23 <= reg15;
    end
  assign wire24 = $unsigned(reg7);
  assign wire25 = reg23;
  assign wire26 = (~|reg21);
  module27 #() modinst40 (wire39, clk, wire4, wire0, wire1, reg15, reg12);
endmodule

module module27
#(parameter param37 = ((8'haa) ? ((^(((8'hb7) == (8'h9e)) ? {(8'hb5), (8'ha1)} : ((8'ha7) ? (8'h9c) : (8'hb0)))) | ((^~(-(8'hb1))) ? {((8'ha5) ? (8'ha1) : (8'hb4)), (&(8'ha9))} : (8'hb2))) : (+((8'had) + {((8'h9e) >>> (8'ha7)), {(8'hb0)}}))), 
parameter param38 = (-param37))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire32;
  input wire signed [(5'h11):(1'h0)] wire31;
  input wire signed [(3'h5):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  assign y = {wire36, wire35, wire34, wire33, (1'h0)};
  assign wire33 = (~|$unsigned(($signed((~^(8'hac))) ?
                      wire29 : {$unsigned(wire28)})));
  assign wire34 = wire31[(4'h9):(3'h4)];
  assign wire35 = wire34;
  assign wire36 = wire28;
endmodule
