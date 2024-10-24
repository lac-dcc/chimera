module top
#(parameter param26 = ((!(~|{((8'ha5) != (8'hb3)), (&(8'ha9))})) ^~ ((|((8'hab) == (8'hae))) << (((~|(7'h44)) * (~(7'h40))) ? (^((8'hb6) ? (7'h41) : (8'haf))) : (((8'hbd) ? (8'hba) : (8'hbd)) ? ((8'ha1) ^ (8'ha0)) : (~^(8'hb5)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = wire2[(2'h3):(2'h2)];
  assign wire5 = $unsigned($unsigned(wire0));
  assign wire6 = wire1[(5'h15):(5'h12)];
  assign wire7 = wire4[(4'hb):(4'h8)];
  assign wire8 = {$unsigned((8'hb7))};
  always
    @(posedge clk) begin
      if ((wire8 ? wire8 : wire3))
        begin
          reg9 <= wire4[(3'h6):(1'h1)];
          if (($unsigned($unsigned(((wire3 < wire8) ?
              $signed((8'hbe)) : $signed(wire4)))) & $unsigned(wire0[(4'h8):(3'h4)])))
            begin
              reg10 <= wire5[(3'h6):(1'h1)];
              reg11 <= $unsigned(((wire0[(2'h3):(1'h0)] ~^ $signed((8'hae))) + wire3[(3'h4):(1'h0)]));
              reg12 <= (|{($unsigned((wire0 ?
                      reg9 : reg11)) > (^~(reg10 || (8'ha8)))),
                  ($signed({wire6, (8'hb0)}) ^ $unsigned({wire7, wire4}))});
              reg13 <= reg11;
              reg14 <= ({((~|$unsigned(reg10)) ?
                          {(reg9 != (8'haa))} : ((^~reg10) ^ (wire4 ?
                              wire4 : wire4))),
                      $unsigned({(^~wire5)})} ?
                  $unsigned({((reg13 ^~ wire8) < (wire1 ?
                          wire3 : wire1))}) : reg12[(3'h5):(3'h4)]);
            end
          else
            begin
              reg10 <= reg14[(4'ha):(4'ha)];
              reg11 <= reg11[(4'hd):(3'h4)];
              reg12 <= wire7[(2'h2):(1'h1)];
              reg13 <= $unsigned((wire2[(2'h2):(1'h0)] ?
                  {{$unsigned(wire5)}} : {(~^(reg10 != wire3))}));
              reg14 <= wire7[(3'h7):(1'h1)];
            end
          reg15 <= $signed($unsigned(reg9[(1'h0):(1'h0)]));
          reg16 <= ($signed((~wire5)) ?
              (reg14[(4'he):(4'hb)] <<< wire2[(2'h2):(1'h1)]) : $signed($unsigned(wire2)));
        end
      else
        begin
          reg9 <= reg9;
        end
      reg17 <= (($signed(($signed(wire2) ? (~|reg12) : reg14)) ?
              {(^reg14[(3'h5):(2'h3)])} : (~^(wire4 == (wire3 ?
                  reg16 : reg11)))) ?
          $signed($unsigned({$signed(wire7),
              wire3[(3'h4):(2'h2)]})) : ($unsigned($unsigned((!reg10))) ?
              ((wire4[(4'he):(3'h6)] ?
                      reg15[(4'ha):(3'h6)] : (reg10 && reg11)) ?
                  $signed(reg11[(2'h2):(1'h0)]) : ({wire1,
                      (8'ha2)} >= $unsigned(wire5))) : (((7'h44) ?
                  reg16[(2'h3):(1'h0)] : wire4) || wire0)));
      reg18 <= $signed({reg9, (reg15 != reg11[(4'hf):(4'ha)])});
    end
  assign wire19 = $unsigned(wire7);
  assign wire20 = wire6[(3'h7):(2'h2)];
  assign wire21 = wire6[(1'h0):(1'h0)];
  assign wire22 = wire7[(3'h7):(3'h5)];
  assign wire23 = ((reg9[(2'h2):(1'h0)] != (~^((~&reg9) ?
                          (^~wire4) : reg12[(3'h4):(2'h3)]))) ?
                      reg15[(3'h4):(1'h0)] : $signed((($signed(wire0) - $signed((7'h44))) | ($signed(wire6) ?
                          $unsigned(wire3) : $signed(wire22)))));
  assign wire24 = wire5;
  assign wire25 = $signed({$unsigned($unsigned($unsigned((8'hb8))))});
endmodule
