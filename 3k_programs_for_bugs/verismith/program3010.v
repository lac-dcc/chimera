module top
#(parameter param21 = ((8'ha2) ? ((({(8'h9c)} && ((8'hb8) | (8'ha1))) * (&((8'hba) ? (8'ha3) : (8'ha9)))) >> ((!((8'hbb) != (7'h44))) >= (~&(^~(8'ha0))))) : ({(^(~&(7'h44)))} ? (~^(+((8'had) * (7'h42)))) : {(^~((8'ha6) & (7'h40)))})), 
parameter param22 = (param21 ? (param21 ? {{(param21 - param21)}} : (param21 ? ((param21 ~^ param21) * param21) : (-(param21 == (8'hae))))) : param21))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
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
  assign wire5 = ($unsigned({$unsigned((wire1 > wire4))}) + $unsigned($signed(wire2[(3'h6):(3'h6)])));
  assign wire6 = ((|(($signed(wire0) ?
                         wire2 : wire1[(2'h3):(2'h3)]) >> wire2[(3'h7):(2'h3)])) ?
                     wire0 : wire0[(4'hb):(4'h9)]);
  assign wire7 = $unsigned(($signed(wire4[(1'h1):(1'h1)]) ?
                     wire3[(2'h3):(2'h2)] : wire5[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ((~|(-($unsigned($signed(wire0)) > $signed($signed(wire5))))))
        begin
          reg8 <= (wire4[(3'h4):(1'h1)] + (+wire5[(3'h5):(3'h4)]));
          reg9 <= ({(($signed((8'ha7)) ?
                  wire2 : (wire2 & wire3)) && {$unsigned(wire7),
                  wire5})} <<< wire0[(3'h6):(1'h0)]);
          reg10 <= ($signed($signed($unsigned(wire7))) > ($signed(((!(8'hbb)) - $unsigned(wire6))) ?
              $unsigned((~^(wire5 - wire1))) : wire2[(1'h1):(1'h0)]));
          reg11 <= reg10;
          reg12 <= ({$unsigned((~^$signed(wire5)))} ^~ $signed((($signed(reg10) - $unsigned(reg11)) | (^reg8[(3'h4):(1'h1)]))));
        end
      else
        begin
          reg8 <= ($unsigned({{reg11[(3'h7):(2'h3)], (wire3 > reg8)},
              (wire1[(5'h10):(4'hb)] ~^ wire7)}) * {wire5[(4'he):(3'h4)],
              (|(~&$signed(reg12)))});
          reg9 <= $signed($signed((^{(wire3 - reg9)})));
          reg10 <= ($unsigned({{(+wire7), wire2[(4'h8):(2'h2)]}}) ?
              ($unsigned($unsigned((wire4 ? reg11 : wire0))) ?
                  $unsigned(($signed(reg12) >= wire6[(1'h0):(1'h0)])) : wire7) : $signed($unsigned((^~(wire6 << reg12)))));
          reg11 <= wire4[(1'h0):(1'h0)];
        end
      if (((!$signed($signed((~^wire1)))) ^~ ($unsigned(wire2) ^~ (((wire2 ?
              wire7 : wire0) ^~ wire3) ?
          $signed($signed(wire1)) : wire6))))
        begin
          reg13 <= reg10[(3'h7):(3'h7)];
          if ({reg8,
              ((8'hb4) > ({(wire3 ? (8'h9d) : (8'h9c))} ?
                  wire6[(2'h2):(1'h1)] : $signed(reg10)))})
            begin
              reg14 <= wire7[(1'h1):(1'h0)];
            end
          else
            begin
              reg14 <= ((($signed((wire2 >= reg10)) >= (-$unsigned(wire5))) ?
                      wire3[(1'h1):(1'h0)] : $signed(((reg11 ?
                          reg11 : reg14) + $unsigned(reg8)))) ?
                  $signed(reg8[(4'hd):(3'h5)]) : wire3[(2'h3):(2'h2)]);
              reg15 <= wire7;
              reg16 <= {reg15};
              reg17 <= $signed((wire5 ?
                  ($signed((~|wire2)) == ((reg14 == reg13) ?
                      (+wire4) : (wire1 <<< reg14))) : ((&(|reg10)) | wire7[(1'h0):(1'h0)])));
            end
          reg18 <= {$signed((((7'h44) ?
                  ((8'ha8) - wire1) : {wire2, wire5}) ~^ ((+wire1) ?
                  wire2 : wire7)))};
          reg19 <= $signed(((wire2[(2'h2):(1'h1)] ?
              ($unsigned(wire7) & (wire6 | wire7)) : reg14[(2'h2):(1'h1)]) && $signed((((8'hba) ?
                  (8'hbb) : reg17) ?
              wire3[(3'h6):(2'h2)] : wire3))));
        end
      else
        begin
          if (((~|((((8'ha3) < (8'had)) ?
                  (reg16 ?
                      wire4 : reg16) : (^~wire7)) ^ ($unsigned(reg11) && $unsigned(wire1)))) ?
              $signed(wire7) : ($unsigned(wire2[(3'h5):(1'h1)]) ?
                  $unsigned((|wire7)) : ($unsigned((reg16 ?
                      reg15 : reg19)) >>> reg9[(1'h0):(1'h0)]))))
            begin
              reg13 <= ((reg8 * wire7[(1'h0):(1'h0)]) ?
                  {(~&$signed(wire4[(1'h1):(1'h1)]))} : $unsigned($signed(reg10)));
              reg14 <= (($signed({reg12[(2'h3):(1'h1)]}) & reg19[(1'h0):(1'h0)]) ?
                  $signed($unsigned({(wire6 ? wire7 : reg11),
                      wire2})) : (|wire2));
              reg15 <= $unsigned(reg10[(3'h4):(3'h4)]);
              reg16 <= reg9;
            end
          else
            begin
              reg13 <= ({reg16} <= (8'hb0));
            end
          reg17 <= $unsigned($unsigned(wire1[(3'h7):(2'h2)]));
          reg18 <= wire1[(4'h8):(1'h1)];
        end
      reg20 <= $signed(reg9[(1'h1):(1'h0)]);
    end
endmodule
