module top
#(parameter param35 = ((|(((~|(8'haf)) ^ ((8'hb7) <<< (8'ha5))) ? ((^~(8'ha2)) ^ ((8'ha0) != (8'hbf))) : (((8'ha7) ? (8'ha6) : (8'hb0)) && ((8'ha7) ? (8'ha4) : (8'hbd))))) ? (!(~^(((8'hb2) || (8'hae)) && {(8'ha0), (8'hb2)}))) : ((8'had) + (^~({(7'h43), (8'hb1)} ? ((8'h9f) ? (8'ha3) : (8'hb3)) : (^~(8'hab)))))), 
parameter param36 = {{((7'h41) ? (!(+(8'hb0))) : ((param35 ? param35 : param35) + param35)), (param35 <= param35)}, (-(((param35 ? (8'hbc) : (8'had)) * {param35, param35}) ? param35 : param35))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire12,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed((($signed($signed(wire4)) ?
                     {((8'hb6) ? wire0 : wire1)} : ((wire3 ? wire4 : wire2) ?
                         wire4 : (~^wire2))) ~^ $unsigned((^$unsigned(wire1)))));
  assign wire6 = (8'ha4);
  always
    @(posedge clk) begin
      reg7 <= wire0[(1'h1):(1'h1)];
      reg8 <= $signed($signed($unsigned((reg7 ?
          (wire3 ^ (8'ha1)) : $unsigned(reg7)))));
      reg9 <= (8'h9d);
      reg10 <= reg7;
      reg11 <= $unsigned(($signed($unsigned(reg9)) >>> $unsigned(wire1[(3'h7):(1'h0)])));
    end
  assign wire12 = (($unsigned(reg7[(3'h7):(2'h2)]) ?
                          $signed(wire2[(1'h0):(1'h0)]) : (((^wire1) ~^ $signed(wire3)) >= $signed((wire4 ^~ wire0)))) ?
                      $signed((~^$signed(reg10))) : (-wire0));
  always
    @(posedge clk) begin
      reg13 <= ((+(((reg8 ? wire12 : wire2) ?
                  wire1[(1'h0):(1'h0)] : (|(7'h41))) ?
              $unsigned(wire12[(1'h0):(1'h0)]) : $unsigned(wire0))) ?
          wire6 : $unsigned(wire3));
      reg14 <= wire5[(4'he):(2'h2)];
      if ((wire4 ?
          $signed((reg9[(3'h6):(3'h6)] > ((~wire12) ?
              (reg10 ?
                  wire6 : reg10) : $signed(reg13)))) : ({(wire5[(4'hd):(4'hb)] ?
                      $unsigned(wire0) : (reg14 ? wire2 : reg11))} ?
              (~&{(&reg13)}) : (^({wire2} < wire6[(4'h8):(3'h5)])))))
        begin
          reg15 <= (wire2 ?
              wire4 : ($unsigned(((!(8'h9d)) ?
                  $unsigned(wire4) : $unsigned(reg8))) | $unsigned(wire5)));
          reg16 <= (~&{wire1[(3'h6):(3'h4)]});
          if ((reg8 || $unsigned($unsigned({(~reg9)}))))
            begin
              reg17 <= $signed({$unsigned(($signed(wire3) - $signed(reg11))),
                  (^~(~^$signed((8'hbf))))});
            end
          else
            begin
              reg17 <= $signed($unsigned($signed($unsigned((reg9 || (8'h9d))))));
              reg18 <= ({(($signed(reg14) ? $unsigned(reg11) : $signed(reg17)) ?
                      $signed((reg13 ? wire2 : wire1)) : reg15[(1'h0):(1'h0)]),
                  ($signed((^wire2)) >>> $unsigned((8'hb3)))} ~^ reg13);
              reg19 <= wire0[(2'h2):(1'h0)];
              reg20 <= $signed((wire0 >> $unsigned(((wire3 & wire12) ?
                  reg16[(4'h9):(3'h6)] : ((8'hbc) != reg9)))));
              reg21 <= {$signed($signed((~&wire4[(2'h2):(2'h2)])))};
            end
          reg22 <= (({wire3, reg21} ?
              (!(|{wire6, reg10})) : ((+$signed(reg10)) < {(reg14 ?
                      wire5 : reg20),
                  wire0})) && $unsigned($signed($signed((+reg8)))));
        end
      else
        begin
          reg15 <= wire2[(1'h1):(1'h0)];
          reg16 <= (!({(+wire2[(2'h3):(1'h0)]),
              (8'hb5)} ^~ (!($signed(reg7) || $unsigned(reg14)))));
          if (reg11)
            begin
              reg17 <= wire12;
            end
          else
            begin
              reg17 <= ($unsigned((^($signed((8'hba)) ? (~|wire3) : (|reg8)))) ?
                  (~|reg17) : ((reg20 ? (8'hb7) : wire1) ?
                      ($unsigned(wire0) ?
                          reg7 : $unsigned((reg13 ?
                              wire1 : reg11))) : (reg20 <= $unsigned(wire12[(2'h2):(1'h0)]))));
              reg18 <= $signed(reg10[(3'h6):(3'h5)]);
              reg19 <= $unsigned($unsigned((wire12 ?
                  wire4[(4'hb):(3'h7)] : $unsigned($unsigned(wire1)))));
            end
        end
      if (reg11[(2'h3):(1'h1)])
        begin
          reg23 <= (8'hae);
          if (((^~(reg13[(2'h2):(1'h0)] ^ wire0[(3'h6):(1'h1)])) ?
              $unsigned($signed($unsigned((!reg9)))) : reg14))
            begin
              reg24 <= $unsigned($signed(reg7));
              reg25 <= $signed(wire1);
            end
          else
            begin
              reg24 <= reg20[(2'h2):(1'h0)];
              reg25 <= $unsigned($signed(reg10));
            end
          reg26 <= wire0[(1'h0):(1'h0)];
        end
      else
        begin
          reg23 <= $signed(($signed(wire1) == reg22));
          reg24 <= {wire5};
          if (((($signed($signed(wire1)) ?
                  (^~wire1[(3'h4):(1'h0)]) : (wire4 ?
                      $unsigned(wire0) : (reg19 << reg25))) ?
              reg21[(1'h1):(1'h0)] : ((~^(^wire6)) ?
                  ($unsigned(reg24) >> reg26) : (reg13[(2'h2):(2'h2)] && (8'ha1)))) != $signed(wire6)))
            begin
              reg25 <= $signed(reg22);
              reg26 <= ($signed((($signed(reg9) ?
                      reg25[(1'h1):(1'h0)] : ((8'hbb) < reg16)) ?
                  {((7'h44) + reg14)} : (wire1 != reg9[(3'h7):(1'h0)]))) << ((8'haf) ?
                  ($signed(((8'hbb) ? reg15 : (8'hab))) + ($unsigned((8'ha5)) ?
                      $unsigned((8'haa)) : (reg24 ?
                          reg26 : (8'ha1)))) : $signed(reg18)));
              reg27 <= (~{(~&(~$signed(reg18)))});
              reg28 <= $unsigned(reg11);
              reg29 <= (wire4 - reg25[(3'h4):(2'h2)]);
            end
          else
            begin
              reg25 <= $unsigned(reg18[(3'h5):(1'h0)]);
            end
          reg30 <= $unsigned(reg29);
          reg31 <= ((&(wire2 ^~ (8'had))) ?
              $signed($unsigned(((-reg16) <= (8'hae)))) : wire12[(2'h2):(2'h2)]);
        end
    end
  assign wire32 = ($unsigned((({reg13, (7'h40)} ^ (reg23 ? reg30 : reg25)) ?
                          {$unsigned(reg31), (reg26 > reg28)} : (((8'hbc) ?
                              reg28 : reg11) <<< $unsigned(reg7)))) ?
                      reg26[(3'h5):(3'h5)] : ((reg11[(2'h2):(2'h2)] ?
                              ($unsigned(reg21) * (reg7 & reg23)) : wire2) ?
                          ((~^(reg8 & wire4)) ?
                              {$signed(reg21)} : (reg16 ~^ $unsigned(reg23))) : $unsigned({{wire1}})));
  assign wire33 = {(~((wire1[(3'h5):(2'h2)] == reg10[(3'h4):(2'h2)]) ?
                          $signed(wire3[(1'h0):(1'h0)]) : wire12)),
                      (reg21 >>> wire0)};
  assign wire34 = ({(~(reg25 > $unsigned(wire33)))} ?
                      $signed((^reg14[(1'h0):(1'h0)])) : $signed(reg25));
endmodule
