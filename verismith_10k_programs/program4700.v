module top
#(parameter param32 = ((((((8'hb1) < (8'ha8)) ~^ ((8'hae) ? (8'hbe) : (8'hbc))) | (((8'hbc) ? (8'ha3) : (8'ha4)) ? ((8'ha6) ? (8'ha0) : (8'hb5)) : ((8'hae) ? (8'h9e) : (8'hbc)))) >= (((~|(8'h9f)) ^~ ((8'hbf) && (8'hb0))) ? ({(8'hac)} ? ((8'hbb) ^~ (7'h40)) : (-(8'hb3))) : ({(8'h9e), (8'hb0)} ? ((8'hae) | (8'hb9)) : ((7'h40) << (8'hbd))))) >>> {((((8'hb3) ? (7'h40) : (7'h44)) > ((8'hae) >= (8'hae))) ? (~^{(8'hae)}) : ({(8'hb1)} < ((7'h43) <= (8'hac)))), ((((8'hb7) > (7'h40)) ? (-(8'hb7)) : (~^(8'hb6))) & (&((8'hb8) < (8'hbb))))}), 
parameter param33 = param32)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (($signed(((~&(8'hb9)) ? $signed(wire4) : (&wire0))) ?
                         wire2[(1'h1):(1'h0)] : (!((wire3 ?
                             wire1 : wire4) + wire1[(2'h3):(2'h2)]))) ?
                     $signed((8'haf)) : wire2[(3'h5):(3'h5)]);
  assign wire6 = {(8'ha2)};
  assign wire7 = wire2;
  always
    @(posedge clk) begin
      reg8 <= wire2[(3'h6):(2'h2)];
      if ((~&wire5))
        begin
          reg9 <= $signed($unsigned((wire7[(2'h3):(1'h0)] ?
              wire4 : ({(8'ha6)} && (+(7'h44))))));
          reg10 <= wire2[(4'ha):(2'h2)];
        end
      else
        begin
          if ((reg10[(2'h3):(1'h0)] ?
              $unsigned($unsigned((+{(8'ha0),
                  wire6}))) : $signed(wire5[(3'h6):(3'h4)])))
            begin
              reg9 <= (|$unsigned(wire2));
              reg10 <= (&(8'ha7));
              reg11 <= ($signed({$signed(reg9[(1'h0):(1'h0)])}) <<< (wire2[(3'h4):(1'h0)] ?
                  $signed({$unsigned(wire6),
                      (wire5 ? wire4 : wire2)}) : (~$unsigned((~&(8'hb1))))));
            end
          else
            begin
              reg9 <= reg10[(2'h2):(1'h0)];
              reg10 <= $signed((($signed(wire3) ?
                  (7'h43) : $unsigned((wire5 ?
                      wire7 : wire3))) >> (!$signed($unsigned(reg9)))));
              reg11 <= $signed(wire7[(4'h8):(2'h3)]);
              reg12 <= $signed($signed(wire2[(2'h3):(2'h3)]));
              reg13 <= wire4[(1'h1):(1'h1)];
            end
          if (wire4)
            begin
              reg14 <= $unsigned($signed((reg10[(2'h3):(1'h1)] ?
                  wire2 : {(reg10 != (8'hab))})));
              reg15 <= $signed(wire0[(3'h4):(3'h4)]);
              reg16 <= $unsigned(($unsigned(reg10[(4'ha):(3'h4)]) ?
                  reg13[(3'h5):(2'h3)] : {{$unsigned(reg14), $signed(reg11)}}));
            end
          else
            begin
              reg14 <= (&$signed((reg9 != (8'hb3))));
              reg15 <= ($unsigned($unsigned($signed((reg16 > reg13)))) ~^ $signed((($signed(wire2) <<< (wire6 - wire5)) ?
                  wire0 : wire6)));
            end
          reg17 <= ((~$unsigned(reg13)) ^ (($signed({wire4}) >> $signed((wire1 * (8'hac)))) >> ((~^(^reg14)) | ($signed(wire1) ?
              $signed(wire2) : (^~(8'hba))))));
          if (wire7[(1'h0):(1'h0)])
            begin
              reg18 <= $signed($unsigned($signed($signed({wire1, reg11}))));
              reg19 <= $unsigned(($signed((7'h41)) ?
                  (~|(&reg11[(3'h6):(3'h4)])) : wire0));
              reg20 <= (~&(~|(wire2 ?
                  $unsigned($unsigned(wire2)) : (~(wire2 | reg8)))));
            end
          else
            begin
              reg18 <= ((+((((8'hb2) << reg20) ^ (wire3 ? reg18 : wire2)) ?
                  reg8 : (wire7 ?
                      $unsigned(reg14) : (~|wire4)))) == $unsigned($unsigned(reg15[(2'h2):(1'h1)])));
            end
          reg21 <= ($unsigned({reg20[(1'h0):(1'h0)]}) * (~&$unsigned(($signed(reg20) ?
              (reg19 ? wire6 : reg11) : (reg20 >> wire4)))));
        end
      reg22 <= reg10;
      if (reg22[(4'h8):(3'h6)])
        begin
          reg23 <= wire1;
        end
      else
        begin
          if (wire5[(3'h5):(1'h0)])
            begin
              reg23 <= (((reg14[(5'h10):(3'h6)] - $signed({reg12, reg12})) ?
                  $signed($unsigned((~|reg23))) : $unsigned(({reg19,
                      (7'h44)} || (8'hb5)))) <<< (((^~$unsigned(reg17)) ?
                  $unsigned($unsigned((8'ha1))) : $signed({reg19,
                      reg20})) ~^ reg21));
              reg24 <= wire4[(1'h0):(1'h0)];
              reg25 <= wire5;
              reg26 <= reg9[(4'he):(4'ha)];
              reg27 <= ({reg25[(1'h0):(1'h0)]} | wire5);
            end
          else
            begin
              reg23 <= $signed($unsigned(wire7));
            end
          reg28 <= ($signed(reg15[(1'h0):(1'h0)]) ^ (^~(!reg9)));
          reg29 <= reg28[(3'h5):(3'h5)];
          reg30 <= ($signed(wire4[(1'h1):(1'h0)]) <= reg25[(1'h0):(1'h0)]);
          reg31 <= $signed(reg9[(5'h13):(4'ha)]);
        end
    end
endmodule
