module top
#(parameter param23 = {(-((~^((8'hb6) ~^ (8'ha2))) ? (((8'h9c) ? (8'hb4) : (8'ha9)) ? ((8'hbc) && (8'h9d)) : {(8'haf), (8'ha5)}) : (-{(8'ha0), (7'h43)}))), ({((~(8'ha7)) & ((7'h42) ? (8'ha4) : (8'ha5))), ((^~(8'ha3)) ? ((8'h9d) && (8'hbd)) : ((7'h42) ? (7'h44) : (8'haa)))} <<< {(&(!(8'ha3))), (((8'hbb) ? (8'hab) : (8'ha8)) ? ((8'hb3) ? (7'h40) : (7'h44)) : (^(7'h42)))})}, 
parameter param24 = (8'ha6))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire4,
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
  assign wire4 = (wire1 <= $signed(wire2[(4'h8):(4'h8)]));
  always
    @(posedge clk) begin
      reg5 <= (((!(wire3[(4'hf):(4'hd)] - {wire4,
          wire2})) != (~|{(~wire4)})) <= ((~|(wire4 ? (^~wire2) : wire3)) ?
          ((wire4[(4'h8):(4'h8)] < wire3[(2'h2):(1'h1)]) ?
              (~&wire1[(4'hd):(4'h8)]) : (-(wire2 << wire4))) : $unsigned(wire3)));
      if ($unsigned($signed($signed(((+wire3) ?
          (|wire4) : wire0[(2'h3):(2'h3)])))))
        begin
          reg6 <= $unsigned($unsigned($unsigned(wire0)));
          reg7 <= $signed(reg5);
          if ((($unsigned($signed($signed(wire0))) ^~ (~|(~{wire4}))) ?
              wire3[(4'h8):(3'h5)] : ($unsigned((reg5[(1'h1):(1'h0)] ^ (wire4 ?
                  reg5 : reg6))) * wire4)))
            begin
              reg8 <= $unsigned({({(-wire3)} ?
                      (-$unsigned(wire4)) : $signed($unsigned((8'ha1))))});
              reg9 <= reg7;
              reg10 <= reg6;
              reg11 <= $unsigned({((+$unsigned(reg6)) ?
                      wire4[(1'h0):(1'h0)] : $signed($signed(wire4)))});
            end
          else
            begin
              reg8 <= (((~&(|(reg6 ~^ reg6))) ?
                      (~reg11[(2'h3):(1'h1)]) : ($signed((8'hbe)) ?
                          {(reg9 ? reg5 : reg8)} : reg10[(2'h2):(1'h0)])) ?
                  reg11[(4'hb):(1'h0)] : wire3);
              reg9 <= (wire3[(1'h0):(1'h0)] << (reg9 == (~^reg7)));
              reg10 <= (~^reg5);
            end
          reg12 <= $signed($unsigned((reg11[(3'h5):(1'h1)] ?
              ({wire4, wire4} << reg6) : wire3)));
          if ({(({reg6} ?
                  $signed($signed(wire3)) : $unsigned((wire2 ?
                      reg5 : (8'h9f)))) | {(7'h43), $unsigned((-(8'hb9)))}),
              $signed({($signed(reg11) >= $unsigned(wire1))})})
            begin
              reg13 <= reg8;
              reg14 <= $signed((~&((8'hb2) ?
                  wire0[(2'h2):(2'h2)] : ((wire4 - (8'hb8)) ?
                      reg13[(3'h6):(3'h5)] : (wire0 ? reg11 : wire1)))));
              reg15 <= ($unsigned($unsigned($signed((+wire4)))) ?
                  $unsigned($signed($signed((reg9 ?
                      reg12 : wire2)))) : {(8'ha6), reg9});
            end
          else
            begin
              reg13 <= reg5[(1'h0):(1'h0)];
              reg14 <= ((($unsigned((~&(8'hb5))) ~^ {(reg9 ? (8'h9f) : reg11),
                          wire4[(3'h5):(2'h3)]}) ?
                      {$unsigned(((8'ha8) ? (8'ha8) : reg8)),
                          wire3} : $unsigned((!$signed(wire0)))) ?
                  $unsigned(reg7) : reg8);
            end
        end
      else
        begin
          reg6 <= (~^$signed(reg10));
          reg7 <= (wire0 ?
              (-reg13[(1'h0):(1'h0)]) : $unsigned($unsigned(($unsigned(reg14) ?
                  $signed(wire2) : reg13))));
          if ((reg7[(3'h7):(3'h4)] ?
              (^~((~|$signed((8'ha7))) ?
                  reg12 : (7'h40))) : (($unsigned((+reg9)) < ((wire3 ?
                      reg15 : wire0) ?
                  (reg13 >> wire1) : wire4)) * wire3[(4'hf):(4'h8)])))
            begin
              reg8 <= reg15[(1'h1):(1'h0)];
            end
          else
            begin
              reg8 <= (~(((~^wire0[(1'h1):(1'h0)]) ?
                  (+reg15[(4'hd):(2'h3)]) : (|(reg9 + reg15))) < $signed(reg9[(4'h8):(3'h6)])));
              reg9 <= (~(8'had));
              reg10 <= $signed($unsigned((!reg13)));
              reg11 <= ({($signed(wire0[(1'h1):(1'h0)]) == (~&$unsigned(reg11)))} ?
                  wire3[(3'h5):(2'h3)] : ((^((wire1 ? reg13 : reg10) ?
                      (!reg15) : $signed(reg5))) >> reg9[(1'h1):(1'h1)]));
              reg12 <= {(reg8[(4'h8):(2'h3)] ?
                      {$unsigned($unsigned(wire2)),
                          (8'ha8)} : (reg11[(4'hd):(4'h9)] - $signed((+reg7)))),
                  reg11};
            end
          reg13 <= (!{{(reg11[(2'h3):(1'h1)] ?
                      $unsigned(reg14) : $signed(reg6)),
                  {reg11[(4'hc):(3'h4)]}}});
        end
    end
  assign wire16 = $signed(reg10[(2'h2):(1'h0)]);
  assign wire17 = (^~((((^~reg15) > (reg14 ^~ reg13)) ?
                      $signed($signed(reg12)) : $unsigned((wire16 & reg5))) == reg7[(3'h4):(3'h4)]));
  assign wire18 = $unsigned($unsigned(reg15[(2'h3):(1'h1)]));
  assign wire19 = (~wire16[(4'hd):(4'h9)]);
  assign wire20 = reg10[(1'h0):(1'h0)];
  assign wire21 = $signed($unsigned($unsigned((~^(&reg12)))));
  assign wire22 = {$signed(wire16[(3'h4):(1'h1)]), $signed(reg7)};
endmodule
