module top
#(parameter param27 = ((~&{(((8'ha2) ^ (8'ha8)) ? {(8'hac)} : (!(8'hb4)))}) ^ (8'hb3)), 
parameter param28 = (param27 ? ((~&((param27 >= param27) | (param27 ? param27 : param27))) ? (((param27 ? param27 : param27) ? param27 : (^~(8'ha7))) ? param27 : ((param27 ? param27 : param27) ~^ (param27 ? (8'hb5) : param27))) : (((^~param27) - param27) * param27)) : (((!{param27}) << (~|(~&param27))) + param27)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ($signed((^(8'ha2))) ?
                     wire0[(3'h6):(3'h5)] : ($signed(wire3) != (({wire1} & wire2) != $signed((wire3 == wire1)))));
  assign wire5 = $signed($unsigned(({$unsigned((8'h9c)),
                         (wire0 ? wire0 : wire0)} ?
                     $unsigned(wire3) : wire3)));
  assign wire6 = {$signed((!wire1[(1'h0):(1'h0)]))};
  assign wire7 = $signed(((wire4[(2'h2):(1'h1)] ? (^~$signed(wire0)) : wire0) ?
                     $signed(((&wire3) ^ (~^wire2))) : (wire3[(2'h3):(2'h2)] & wire5)));
  assign wire8 = {$unsigned((~|(8'had)))};
  always
    @(posedge clk) begin
      if ($unsigned((+wire0[(4'h8):(2'h3)])))
        begin
          if ((wire0 ^~ (^~wire6[(4'ha):(4'ha)])))
            begin
              reg9 <= ($unsigned({wire1[(4'hb):(1'h1)],
                  wire3[(1'h0):(1'h0)]}) ^~ wire3);
              reg10 <= {$unsigned((wire5 <= {(wire6 || (8'hb9))}))};
              reg11 <= (|(~&(-((~&wire6) >>> (^~reg10)))));
            end
          else
            begin
              reg9 <= $signed((((-(reg10 <= wire2)) ?
                      reg9[(4'hd):(4'h9)] : ({(8'h9e),
                          wire1} | $signed(reg11))) ?
                  (8'hb6) : (wire3[(3'h7):(3'h7)] != (((8'hab) <<< wire0) | wire3[(2'h2):(2'h2)]))));
              reg10 <= (((~|wire2) * ($signed(wire5) || wire6[(1'h1):(1'h0)])) * (reg11 ?
                  (((wire7 ? wire8 : wire0) ?
                      reg9 : (^~wire2)) <= $unsigned($unsigned(wire4))) : ($unsigned($signed(wire7)) ^ wire1)));
              reg11 <= reg9[(4'ha):(4'h8)];
              reg12 <= (-(^$signed((|(wire0 <<< wire8)))));
            end
        end
      else
        begin
          reg9 <= ($signed(reg9[(3'h7):(3'h7)]) <<< $unsigned(($unsigned($unsigned(wire5)) << wire2[(2'h2):(1'h1)])));
          reg10 <= $signed($signed((8'ha9)));
          reg11 <= ((~^wire3[(4'ha):(4'h9)]) & ({$unsigned(((7'h43) ?
                  wire5 : wire8))} >>> $signed(wire6)));
          reg12 <= (~$unsigned($unsigned(wire8[(3'h4):(2'h2)])));
        end
      reg13 <= {$unsigned(((wire5 ?
              wire0[(3'h6):(1'h0)] : $unsigned((8'had))) || $signed(wire4[(1'h1):(1'h1)])))};
      if ((($signed((^$unsigned(reg12))) >> $signed(reg10[(4'h8):(3'h4)])) | wire2))
        begin
          if ((!$signed(wire1[(4'h9):(1'h1)])))
            begin
              reg14 <= ((($signed($signed((7'h42))) >>> wire3) ?
                      $signed((wire6 ?
                          $unsigned(wire1) : wire6[(4'hb):(4'ha)])) : (+$signed($signed(wire1)))) ?
                  (~^$unsigned($signed((wire5 ^~ reg10)))) : reg13[(5'h12):(3'h7)]);
            end
          else
            begin
              reg14 <= (reg9[(4'h9):(1'h1)] * (wire2[(3'h5):(2'h2)] >= reg10));
              reg15 <= (~^$signed(reg12));
            end
          reg16 <= $unsigned($signed($signed(wire1)));
        end
      else
        begin
          reg14 <= ($signed(({(~^reg12), (reg10 ? wire3 : wire0)} ?
              $signed({(8'hae)}) : (wire3 ^ reg15))) <<< wire7[(3'h4):(1'h1)]);
          if (reg10[(4'hb):(1'h0)])
            begin
              reg15 <= (7'h40);
              reg16 <= ({reg9[(3'h6):(3'h5)], (!(|(^~wire3)))} ?
                  (reg11[(3'h4):(2'h3)] ?
                      $signed(reg13) : reg10) : reg12[(4'hb):(1'h0)]);
              reg17 <= ((($unsigned($unsigned((7'h40))) ?
                      ((wire5 ? reg13 : reg16) ?
                          wire0 : wire3[(4'h9):(4'h8)]) : (reg9 ?
                          (reg14 ? reg10 : reg10) : reg12[(3'h4):(1'h1)])) ?
                  $signed($signed((8'hba))) : reg11) >> $unsigned($signed({wire2,
                  (~^wire7)})));
              reg18 <= wire4[(2'h2):(1'h0)];
            end
          else
            begin
              reg15 <= $unsigned(reg14);
              reg16 <= reg10[(4'h9):(1'h0)];
              reg17 <= $signed($signed({$unsigned({wire1})}));
              reg18 <= $signed(reg16[(2'h3):(1'h1)]);
            end
          reg19 <= ({((&(!wire0)) ?
                  (~&(wire2 ? reg15 : reg15)) : (^~$signed(wire7)))} && reg10);
          reg20 <= reg14[(3'h7):(3'h5)];
          if (reg16)
            begin
              reg21 <= ($unsigned(reg19) && reg17[(1'h1):(1'h1)]);
              reg22 <= {(wire5 ?
                      $unsigned((|(|wire6))) : $unsigned((((8'hab) ?
                          wire2 : reg11) ^ {(8'hbd), (8'ha4)}))),
                  (-(!wire0))};
              reg23 <= wire3;
              reg24 <= (reg11 ? wire2[(1'h1):(1'h1)] : reg20);
            end
          else
            begin
              reg21 <= ($unsigned((reg17[(3'h4):(2'h3)] >= (wire1[(4'ha):(3'h6)] ?
                  $unsigned(reg20) : $signed(wire8)))) | $unsigned(reg18[(3'h7):(3'h5)]));
            end
        end
      reg25 <= (8'hb2);
      reg26 <= (!reg25[(2'h2):(1'h0)]);
    end
endmodule
