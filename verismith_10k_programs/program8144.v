module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire35,
                 wire4,
                 reg36,
                 reg34,
                 reg33,
                 reg32,
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
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ($signed({(~|(wire2 ?
                         wire3 : wire1))}) <<< wire2[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg5 <= $signed((+$unsigned($unsigned($signed((8'hb5))))));
      reg6 <= $unsigned(wire2);
      reg7 <= (^($signed($unsigned(wire3)) <= wire4));
    end
  always
    @(posedge clk) begin
      if (wire0[(3'h4):(1'h1)])
        begin
          reg8 <= $signed(wire0[(1'h0):(1'h0)]);
          reg9 <= reg5[(4'h9):(2'h2)];
          reg10 <= ($unsigned($signed({(^wire1)})) ?
              $unsigned(((reg7 * ((8'hbf) ?
                  reg5 : wire0)) > (wire4 & (8'ha2)))) : (wire0 == (&wire3[(1'h1):(1'h1)])));
        end
      else
        begin
          reg8 <= $unsigned((~|(~$unsigned($unsigned(reg9)))));
        end
      if (($signed((~&$signed((~^(7'h40))))) >> $unsigned(wire4[(3'h4):(1'h0)])))
        begin
          if ((~|$signed($unsigned($unsigned((~|reg10))))))
            begin
              reg11 <= (+(~&$unsigned(((&wire2) ?
                  $signed((8'ha3)) : (wire0 <= reg6)))));
              reg12 <= (8'hb0);
              reg13 <= reg10[(3'h7):(2'h3)];
              reg14 <= reg8;
              reg15 <= wire3;
            end
          else
            begin
              reg11 <= ({$signed($signed(reg7[(3'h5):(2'h3)])), wire2} ?
                  (({$signed((8'h9d))} ?
                          (reg14[(3'h5):(3'h5)] ?
                              (reg13 ? (8'ha9) : reg15) : reg13) : {(reg10 ?
                                  (8'hbf) : reg15)}) ?
                      (7'h44) : $unsigned((-$signed(reg9)))) : (({(reg11 <= wire1)} ~^ reg13[(2'h3):(1'h0)]) * wire4));
              reg12 <= reg11;
              reg13 <= $unsigned((($unsigned((reg11 >= reg13)) ?
                  reg7 : reg12[(1'h0):(1'h0)]) & (((reg15 <<< wire1) ?
                      (reg12 ? reg11 : (8'haf)) : reg11) ?
                  (+(7'h40)) : reg5)));
              reg14 <= $unsigned(((($signed(reg7) ?
                  $signed(reg15) : (reg13 <= reg5)) >>> (^(reg12 >= reg8))) != reg14[(1'h1):(1'h0)]));
            end
          reg16 <= ((^~(((8'hb2) ? (|wire3) : $unsigned(wire0)) ?
              reg6 : $unsigned((reg9 ? reg7 : (7'h40))))) < reg15);
          if (reg8[(3'h4):(1'h1)])
            begin
              reg17 <= (wire0[(2'h3):(2'h3)] ?
                  $signed((($unsigned(reg7) ?
                      {wire3, wire3} : (reg7 ?
                          reg5 : reg6)) <<< (8'ha7))) : $signed((^~reg9)));
              reg18 <= {reg13[(2'h2):(1'h0)],
                  $unsigned((reg13[(4'h8):(2'h2)] < reg9))};
              reg19 <= reg5;
              reg20 <= reg15;
              reg21 <= wire4;
            end
          else
            begin
              reg17 <= ($unsigned((reg14 ? $signed(reg10) : (!reg18))) ?
                  reg6[(1'h1):(1'h0)] : (|reg9));
            end
          if ($unsigned(reg15[(3'h7):(3'h4)]))
            begin
              reg22 <= reg17[(4'hf):(3'h6)];
              reg23 <= ((($signed($unsigned(reg12)) * ($unsigned(reg7) ?
                  $unsigned(reg17) : $unsigned(wire0))) > ((|(~reg9)) <= $signed((~^reg14)))) <= (reg5 ?
                  ((|(^wire2)) ?
                      $unsigned($signed(reg7)) : wire4[(2'h2):(1'h1)]) : $unsigned($signed(((8'hb6) ?
                      wire1 : reg9)))));
              reg24 <= ($signed($unsigned(((reg10 ? reg14 : (8'hb2)) ?
                      $unsigned((8'ha1)) : {reg22}))) ?
                  (($signed((reg11 ? reg12 : wire0)) ?
                          ((&reg18) != $signed(reg11)) : reg8) ?
                      $unsigned(($signed((8'ha9)) ~^ $signed(reg15))) : reg6[(5'h11):(4'hb)]) : (~&reg21[(3'h5):(1'h1)]));
              reg25 <= (reg9 - $signed(reg11));
              reg26 <= $signed((reg22[(1'h0):(1'h0)] + (reg6 ?
                  (^{reg20, (8'h9c)}) : $signed((reg16 * reg25)))));
            end
          else
            begin
              reg22 <= reg23[(4'hc):(1'h0)];
              reg23 <= ((~|$unsigned($unsigned({reg22}))) - reg23);
              reg24 <= (8'haa);
              reg25 <= $unsigned((-(+(reg21[(4'h9):(3'h4)] != (reg6 ^~ reg14)))));
            end
          reg27 <= ($signed($signed($signed($signed(wire3)))) >> ($unsigned((8'ha7)) >> (^~$signed((~|reg12)))));
        end
      else
        begin
          if ((8'hb3))
            begin
              reg11 <= reg13[(2'h2):(1'h1)];
              reg12 <= $signed(reg8);
              reg13 <= (reg6[(3'h4):(1'h0)] & $signed($unsigned($unsigned($unsigned(reg7)))));
              reg14 <= ((~&$unsigned($unsigned($signed(reg27)))) <= $signed($unsigned({$unsigned(reg5)})));
            end
          else
            begin
              reg11 <= $unsigned($signed({(~|wire3)}));
            end
        end
      reg28 <= ((wire3 ?
              (&(^~((8'hbb) ?
                  reg17 : reg19))) : $signed(wire2[(2'h2):(2'h2)])) ?
          {((((8'h9f) <<< reg14) <<< (reg8 || reg27)) ?
                  reg25 : ((~^reg25) * $signed((8'hb6)))),
              ($signed((reg21 ?
                  reg20 : wire3)) < reg18)} : (({reg19[(4'h9):(4'h8)]} != ((^~reg13) <= {reg16})) ~^ wire3));
      reg29 <= ($signed($unsigned($unsigned((^~reg16)))) & {$signed($unsigned($signed(reg16)))});
      if ({(reg22[(1'h1):(1'h0)] ?
              (reg10[(4'he):(4'h8)] ^ ((reg27 >> reg7) ?
                  (wire1 ? reg15 : reg27) : ((7'h43) ?
                      reg21 : reg11))) : {(~^(reg29 ? (8'ha2) : reg19)),
                  $unsigned({reg18, reg13})})})
        begin
          reg30 <= reg17;
          reg31 <= reg17[(2'h2):(2'h2)];
          reg32 <= reg11[(3'h7):(1'h1)];
          reg33 <= {(((8'ha6) > $unsigned(reg22)) ~^ reg27[(2'h3):(2'h2)]),
              $unsigned((reg9[(4'h8):(4'h8)] ^ ((wire0 ? reg20 : (8'hb6)) ?
                  $unsigned(reg23) : (wire2 ? reg23 : reg23))))};
          reg34 <= $signed(reg23);
        end
      else
        begin
          reg30 <= {((^~$unsigned($signed((8'hbf)))) ?
                  ((reg27[(1'h0):(1'h0)] ?
                      reg7[(1'h0):(1'h0)] : $unsigned((8'hac))) != $signed($signed(reg16))) : (($signed(reg33) * (8'haa)) > $unsigned($unsigned(reg33))))};
          reg31 <= wire2;
          reg32 <= reg23;
        end
    end
  assign wire35 = ({reg12} * $unsigned($signed((+(&reg20)))));
  always
    @(posedge clk) begin
      reg36 <= (reg9[(4'h8):(3'h5)] << (($unsigned($unsigned(reg8)) + reg23[(4'he):(3'h5)]) <<< (8'ha2)));
    end
endmodule
