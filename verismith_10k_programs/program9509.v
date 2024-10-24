module top
#(parameter param34 = (8'hb2), 
parameter param35 = ((!({(&param34), (|param34)} ^~ ((param34 <= param34) ? (param34 ? param34 : param34) : (param34 ? param34 : (8'ha8))))) ? (param34 & (((~&param34) << (~&param34)) ? (param34 ? (param34 ? param34 : param34) : (~&param34)) : param34)) : (7'h42)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
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
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = ({(wire1 ?
                             wire0[(1'h1):(1'h0)] : ((wire3 ? wire3 : (8'ha6)) ?
                                 (8'hb2) : {wire0, wire2})),
                         (~|{{wire1, (8'hb3)}})} ?
                     $signed(((|(wire2 == wire1)) ?
                         (wire0 & $signed(wire4)) : $unsigned((wire1 ?
                             wire3 : (7'h41))))) : $signed($signed((+$unsigned(wire3)))));
  assign wire7 = wire3;
  always
    @(posedge clk) begin
      reg8 <= (wire3 ?
          ($unsigned(((wire2 ?
              wire1 : wire7) <= wire0)) != (|($unsigned(wire0) ~^ (wire6 <<< (8'hbd))))) : (|$unsigned($unsigned((wire3 ?
              wire5 : wire6)))));
      reg9 <= wire4;
      reg10 <= ({(~&wire2[(2'h3):(1'h1)]),
          $unsigned(wire1[(1'h1):(1'h0)])} >= (+wire7));
    end
  assign wire11 = wire6;
  assign wire12 = reg10[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg13 <= wire7;
      reg14 <= wire11[(3'h4):(2'h2)];
      reg15 <= $unsigned($unsigned(($signed({wire0, wire1}) ?
          $unsigned(wire1) : (^(~^wire6)))));
      reg16 <= (8'hb2);
      if (wire11)
        begin
          if (reg14[(3'h4):(1'h0)])
            begin
              reg17 <= wire3[(1'h1):(1'h1)];
              reg18 <= (!($signed(({wire6, reg8} + (reg16 ? reg8 : (8'ha9)))) ?
                  $unsigned($unsigned((wire5 ?
                      (7'h43) : reg8))) : (!$unsigned($unsigned((8'hb3))))));
              reg19 <= $signed((((wire12 >= (wire6 ^~ (8'hac))) <= ($unsigned(reg9) && wire0)) ?
                  (wire4 || {wire5[(4'ha):(1'h1)],
                      reg13[(2'h3):(1'h1)]}) : (^wire12)));
              reg20 <= wire0;
              reg21 <= $signed((!(-(wire11 >= (wire5 >> reg17)))));
            end
          else
            begin
              reg17 <= wire0[(3'h6):(1'h1)];
            end
          reg22 <= $signed((|($unsigned((reg21 ? reg19 : reg20)) >= wire1)));
          if ((wire7 * ($signed($unsigned(reg21)) ?
              (reg15[(4'h9):(1'h0)] >>> ((wire0 ? reg18 : reg8) ?
                  (reg17 ?
                      reg19 : wire7) : reg21[(1'h1):(1'h1)])) : {$signed(wire4),
                  ($unsigned(wire12) ?
                      (wire1 ? (8'hac) : reg13) : $unsigned(reg21))})))
            begin
              reg23 <= $signed($signed(((8'h9e) ?
                  $unsigned($signed(wire0)) : wire0[(1'h1):(1'h0)])));
            end
          else
            begin
              reg23 <= (!wire2);
              reg24 <= ({((^~$signed(reg8)) << $unsigned($unsigned(reg14)))} ?
                  $signed((({(8'hb0)} ~^ $unsigned(reg19)) ^~ ($signed(reg14) ?
                      (reg16 - wire4) : $unsigned(reg20)))) : (&($signed(wire7) ^ ((wire0 >= reg18) ?
                      reg9 : $unsigned(wire5)))));
              reg25 <= reg23[(3'h4):(2'h3)];
              reg26 <= $signed((($unsigned((8'ha1)) && $unsigned((8'h9d))) < wire7));
            end
          reg27 <= reg18[(5'h12):(5'h12)];
          reg28 <= ({reg18[(3'h5):(2'h2)]} <<< (((~{reg20}) ?
              $unsigned($unsigned(reg20)) : $unsigned(((8'hbc) ?
                  (8'hbb) : (8'hb7)))) + ($unsigned((reg20 ? reg25 : wire3)) ?
              ($signed(reg26) ?
                  (wire12 ~^ wire12) : reg17) : reg9[(3'h5):(2'h2)])));
        end
      else
        begin
          reg17 <= {wire11[(3'h7):(2'h2)]};
          reg18 <= (($signed((+{(8'ha2)})) ?
              reg17[(3'h6):(1'h1)] : (($unsigned(reg10) ?
                      $unsigned(wire6) : (|reg21)) ?
                  $unsigned((~|reg18)) : ({wire2,
                      reg21} <= $signed(reg14)))) | (reg20 ?
              $signed($unsigned((reg27 ?
                  reg27 : wire1))) : reg13[(1'h0):(1'h0)]));
        end
    end
  assign wire29 = (^~$unsigned($signed((~|$unsigned(reg13)))));
  assign wire30 = (wire29[(1'h1):(1'h0)] ?
                      reg9 : {(reg27 ?
                              $signed((reg22 | reg21)) : ((reg21 ?
                                  reg9 : wire5) > $unsigned((8'hb8))))});
  assign wire31 = $unsigned((~($signed((reg22 >>> reg21)) ^~ $unsigned(reg20))));
  assign wire32 = wire7[(4'h9):(2'h2)];
  assign wire33 = $signed((|$signed(reg26[(3'h4):(2'h3)])));
endmodule
