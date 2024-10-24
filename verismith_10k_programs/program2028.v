module top
#(parameter param24 = ({((((8'hb0) ~^ (8'h9f)) | ((8'ha3) == (8'ha0))) ? {(~|(8'hb2))} : ((8'ha8) << (8'h9f))), ({(|(8'hbf)), {(8'hb6), (8'ha1)}} ? (((8'ha7) < (8'hb4)) ? ((8'hb7) - (7'h43)) : (^(8'h9d))) : (&(~|(8'ha0))))} && (7'h41)), 
parameter param25 = {((((^~param24) | (param24 ? param24 : param24)) + (~|(param24 <= (8'ha7)))) ^ (param24 ? param24 : param24)), (^~{(~^param24), (8'ha6)})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ({((~^$signed(wire4)) ?
                         (wire4 >>> wire1) : ($signed(wire0) ?
                             $signed(wire2) : (+(8'ha2)))),
                     wire2[(5'h10):(4'h8)]} == wire2[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      reg6 <= wire2[(2'h3):(2'h2)];
      if ((8'hb5))
        begin
          if (({(wire2 ? wire1 : ($signed(wire5) & wire0)),
              ((((7'h42) | wire3) ?
                  wire1 : (8'hab)) * $signed(wire5))} >= {$unsigned((~|(~&wire2)))}))
            begin
              reg7 <= $unsigned({({(wire2 ? wire4 : (8'hbb))} < wire0)});
              reg8 <= $unsigned((&wire3[(3'h5):(2'h3)]));
              reg9 <= {wire0[(4'hf):(3'h5)], (|(|{((7'h42) * wire1)}))};
              reg10 <= (^~reg8[(4'ha):(1'h1)]);
            end
          else
            begin
              reg7 <= $signed((&reg6[(4'h9):(2'h3)]));
              reg8 <= reg9[(1'h1):(1'h0)];
              reg9 <= wire3[(3'h4):(2'h2)];
              reg10 <= reg6;
            end
        end
      else
        begin
          reg7 <= {$signed(reg8),
              $unsigned((($unsigned(reg8) | $signed(wire2)) ?
                  (~^{wire2, wire0}) : ((wire3 ? wire3 : reg6) ?
                      (reg8 >> wire1) : (wire4 ^~ reg9))))};
          reg8 <= reg10;
          reg9 <= reg8[(2'h3):(1'h1)];
          reg10 <= {($signed((8'h9e)) ?
                  {$unsigned($unsigned((7'h43)))} : {({(8'hac),
                          wire3} >>> (8'ha9))}),
              wire5[(3'h7):(2'h2)]};
        end
      reg11 <= {$signed((({reg7, reg7} ?
              $unsigned(wire1) : ((8'hb6) ?
                  reg10 : reg9)) <= ($unsigned(wire5) ?
              $unsigned(wire5) : wire0[(5'h11):(3'h6)])))};
      if ((8'haf))
        begin
          reg12 <= $signed({$unsigned((~|(~^reg8)))});
          reg13 <= $unsigned(((wire5[(1'h0):(1'h0)] ?
              (!reg8) : (~^$unsigned(wire1))) >= {(reg7[(3'h4):(3'h4)] ?
                  wire2[(3'h5):(3'h4)] : (reg10 ? wire5 : wire5))}));
        end
      else
        begin
          reg12 <= wire2;
          reg13 <= ({wire2[(4'hf):(4'he)],
              {({wire2} ? {(8'hbe), wire4} : $signed(wire2))}} * (8'hba));
          reg14 <= (~$signed(reg13));
          reg15 <= (-(wire3 == {(|((8'hb3) << (8'hbd))), {$signed(reg7)}}));
        end
    end
  always
    @(posedge clk) begin
      reg16 <= (wire3 <= $signed((^({wire4, wire4} ?
          ((8'hbc) == wire0) : {reg15, wire1}))));
      reg17 <= $signed(wire0);
      if ((^((7'h44) ?
          $signed((reg10[(3'h7):(3'h4)] ?
              (+wire2) : $signed((8'ha9)))) : ($signed(reg8[(4'hd):(4'hc)]) ?
              wire0 : reg8[(4'hd):(1'h0)]))))
        begin
          reg18 <= ((reg13 ? (&wire3[(1'h0):(1'h0)]) : wire2[(3'h5):(1'h1)]) ?
              $unsigned(($unsigned({reg7}) ?
                  (+$signed(reg11)) : ((wire0 ? reg8 : wire5) ?
                      (+wire5) : (wire0 >= wire3)))) : {$signed($signed((wire2 ?
                      wire1 : reg6)))});
          reg19 <= (~|$unsigned((((reg13 >= wire3) ? wire2 : (reg18 >= reg8)) ?
              $signed($unsigned(reg7)) : reg14)));
          reg20 <= (8'hb5);
        end
      else
        begin
          reg18 <= {reg9};
          reg19 <= wire4[(3'h5):(2'h2)];
          reg20 <= $signed(reg11);
          reg21 <= ((reg13 ?
              reg15[(3'h6):(3'h5)] : wire5[(1'h1):(1'h1)]) | ($signed(((reg18 && (8'hba)) << (reg19 ?
                  reg14 : reg8))) ?
              reg11[(3'h4):(2'h2)] : {($unsigned(reg11) + reg13),
                  $unsigned(reg20[(1'h1):(1'h0)])}));
        end
    end
  assign wire22 = $signed(reg7);
  assign wire23 = $signed($signed($unsigned({$unsigned((8'hb5)), (~|reg8)})));
endmodule
