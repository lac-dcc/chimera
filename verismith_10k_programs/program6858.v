module top
#(parameter param26 = ((^~((((8'ha0) ? (8'hb9) : (8'ha8)) ? ((8'hb1) * (8'hbb)) : (~&(8'ha9))) ? (((8'hb1) && (8'ha6)) ? {(8'hb5), (8'ha6)} : ((7'h44) ? (7'h42) : (8'ha7))) : ({(8'hb2), (8'hba)} + (8'hbd)))) ? (((~|((8'hb8) ? (8'hb3) : (8'hbf))) << (~|((8'hb3) <<< (8'ha4)))) ? (8'hab) : ((~|((8'h9d) ~^ (8'ha0))) ? (^~((8'h9f) | (8'ha4))) : {((8'hb7) < (8'hb9)), ((7'h40) ? (8'hb8) : (8'ha3))})) : (~^(^(~|((8'hb1) ? (8'hb1) : (8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire25,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = ((-{$signed(wire3[(1'h0):(1'h0)])}) == (wire0[(1'h1):(1'h0)] & wire2[(4'h8):(2'h2)]));
  assign wire5 = (&((~^$signed(wire0)) * (|({wire2} ?
                     (!wire4) : ((8'hb9) & (8'hb1))))));
  assign wire6 = wire3[(2'h3):(1'h0)];
  assign wire7 = $signed({(wire5 >> wire4),
                     (^~($unsigned((8'hbb)) ?
                         wire2[(3'h6):(2'h2)] : $unsigned(wire3)))});
  always
    @(posedge clk) begin
      reg8 <= {($signed(wire5) ? (|wire3) : $unsigned($unsigned({wire0}))),
          wire2[(3'h7):(1'h1)]};
      if ($signed(wire1[(2'h2):(1'h1)]))
        begin
          reg9 <= wire2[(1'h0):(1'h0)];
          reg10 <= wire2[(4'ha):(2'h2)];
        end
      else
        begin
          reg9 <= ($unsigned($unsigned(wire7[(1'h1):(1'h0)])) <<< wire6[(3'h5):(1'h0)]);
          reg10 <= (wire3[(3'h4):(2'h3)] ? reg8 : wire4);
          reg11 <= (wire4 ?
              {(^~(reg8[(3'h5):(2'h2)] ?
                      $unsigned(wire2) : (wire4 > wire7)))} : $signed($signed(((wire1 && wire0) ?
                  reg10 : (reg10 | wire6)))));
          reg12 <= (wire7 ?
              $signed($signed($signed($unsigned(wire4)))) : $signed((8'hac)));
        end
    end
  always
    @(posedge clk) begin
      reg13 <= (wire3 ^~ wire0[(4'he):(3'h5)]);
    end
  always
    @(posedge clk) begin
      if (reg11[(3'h4):(1'h0)])
        begin
          if (wire2)
            begin
              reg14 <= (~^wire6[(1'h1):(1'h0)]);
              reg15 <= wire3;
              reg16 <= $unsigned(({reg15[(3'h7):(3'h5)], (+reg9)} ?
                  (reg10 ?
                      $signed((reg10 * reg9)) : $unsigned(wire4[(1'h0):(1'h0)])) : (((~reg11) <<< (reg11 ^ reg13)) << $unsigned((-wire4)))));
            end
          else
            begin
              reg14 <= ((~|$signed($unsigned(reg16))) - reg8);
              reg15 <= {{reg16}};
              reg16 <= ($unsigned(($unsigned((reg8 || reg11)) ?
                      ($unsigned(reg11) | (8'ha3)) : (8'hbd))) ?
                  $signed((^(~|wire0[(1'h1):(1'h0)]))) : $signed({($unsigned((8'ha6)) >>> $signed(wire6))}));
              reg17 <= (|(~^((&((7'h40) ? (8'haf) : wire0)) ?
                  $unsigned($signed(wire0)) : reg12[(3'h4):(1'h0)])));
            end
          reg18 <= reg17[(4'hc):(2'h2)];
          reg19 <= reg18[(3'h4):(2'h2)];
          if ((~^{$signed(reg8)}))
            begin
              reg20 <= ($signed((wire2 ?
                  ({reg18, reg9} ?
                      (8'ha5) : (wire3 ?
                          wire4 : (8'hb5))) : {reg18[(4'h8):(3'h4)]})) ~^ {(8'hb2)});
              reg21 <= wire5;
              reg22 <= $unsigned(((8'ha4) ?
                  (&$signed($unsigned(reg10))) : wire4));
              reg23 <= (($signed(reg19) ?
                  wire0[(5'h12):(3'h7)] : (((wire0 >> reg19) ?
                          $unsigned(wire1) : ((8'h9d) >> wire5)) ?
                      $unsigned(reg13) : {(reg22 ?
                              (8'ha0) : reg16)})) <= wire5);
            end
          else
            begin
              reg20 <= (7'h44);
              reg21 <= (reg9 ? (^~$signed(reg13)) : reg22);
              reg22 <= $signed($signed($signed((^~$unsigned((8'hae))))));
            end
          reg24 <= wire2;
        end
      else
        begin
          if ($unsigned($unsigned((8'hb2))))
            begin
              reg14 <= ($unsigned($signed(({reg20} != $signed(wire2)))) ?
                  (reg23 <= $signed(reg17)) : reg17);
              reg15 <= (-(^~($signed((reg10 + reg9)) ? wire2 : wire5)));
              reg16 <= (reg9 ? $unsigned(wire2[(3'h6):(2'h2)]) : wire3);
              reg17 <= ($signed($signed($unsigned((reg19 == reg24)))) > wire1);
              reg18 <= (reg21 ?
                  ((~&wire1[(3'h6):(3'h6)]) << (reg16 || reg22[(3'h6):(2'h3)])) : reg18[(4'h8):(2'h3)]);
            end
          else
            begin
              reg14 <= $unsigned((~&$signed(($unsigned(reg18) || (wire2 ^ reg18)))));
              reg15 <= (8'hb7);
              reg16 <= $signed($unsigned($unsigned(wire3[(3'h4):(1'h1)])));
              reg17 <= reg12[(4'h9):(4'h8)];
            end
          reg19 <= (-reg10[(3'h6):(1'h1)]);
          reg20 <= (^~(~^$signed(wire1[(3'h4):(1'h0)])));
        end
    end
  assign wire25 = {(reg21 ?
                          $signed(($unsigned(reg20) ?
                              (reg21 & reg9) : (^reg9))) : (|(((8'hbf) ~^ wire2) ~^ (reg16 ?
                              reg20 : reg14))))};
endmodule
