module top
#(parameter param32 = (({{(&(8'ha9))}} ? ((!((8'ha1) ? (8'hac) : (8'hab))) ? (((7'h40) ? (8'ha8) : (8'h9e)) ? ((8'ha5) ? (8'hb0) : (8'ha1)) : (!(7'h43))) : (~((8'hb9) | (7'h43)))) : (~|{((8'h9e) ? (8'hb1) : (8'hb2)), ((8'hbb) > (8'hbf))})) ? (~((!((7'h42) >>> (8'hb3))) <= {(8'had), ((7'h41) * (8'hbb))})) : ((~|({(7'h41), (8'haa)} - ((7'h44) * (8'hb8)))) - {((~(8'hab)) ? ((8'ha2) ? (8'hbe) : (8'ha1)) : ((8'hb3) ? (8'hb6) : (7'h42)))})), 
parameter param33 = {((param32 ? param32 : {(8'hb3)}) ? (param32 >= param32) : ({(param32 <= param32)} ? param32 : ({param32} > param32))), ((8'hb1) ~^ {((param32 <<< (8'hbe)) ? {(8'h9e)} : (param32 & param32)), {(param32 < param32)}})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg28,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((^$signed((^~(~&wire3))))))
        begin
          if ($unsigned(wire0))
            begin
              reg4 <= (wire1[(3'h4):(3'h4)] ?
                  $signed({((wire2 ?
                          wire2 : wire0) >> wire3)}) : ($unsigned($unsigned((wire3 ?
                      (8'hb6) : wire2))) <<< (^(&$unsigned((7'h43))))));
              reg5 <= ({wire3} <<< $unsigned({(&wire1)}));
              reg6 <= (-$unsigned($unsigned($signed((wire0 ? wire3 : wire0)))));
              reg7 <= wire3;
              reg8 <= reg5;
            end
          else
            begin
              reg4 <= (&$unsigned($signed($signed(reg8))));
              reg5 <= (wire1 == ($signed($signed((reg8 ^~ reg4))) ?
                  ($signed($unsigned((8'h9f))) ^~ wire3) : wire1[(1'h1):(1'h1)]));
              reg6 <= $signed((&(-(|(wire1 ? (8'hb0) : reg5)))));
            end
          if (reg4)
            begin
              reg9 <= {wire1};
              reg10 <= (~&reg9);
            end
          else
            begin
              reg9 <= $signed((((^~$unsigned(reg5)) ?
                  $signed(((8'hb6) || reg5)) : {$unsigned((8'ha8))}) < (!$signed($unsigned((8'ha6))))));
            end
          reg11 <= $unsigned($signed(reg7));
          reg12 <= wire2[(4'h9):(1'h1)];
          reg13 <= $unsigned((reg11[(4'h9):(2'h2)] * reg7));
        end
      else
        begin
          reg4 <= ($signed($unsigned((~^$signed(reg4)))) ?
              $unsigned({{$signed(wire1), reg12},
                  $signed($unsigned(reg5))}) : (^~({(wire1 ? wire1 : reg13),
                      {reg4}} ?
                  (7'h42) : (reg8[(2'h2):(1'h1)] ?
                      reg13[(1'h0):(1'h0)] : reg7))));
        end
      reg14 <= ($signed($unsigned(reg6)) <= $signed(reg4));
      reg15 <= reg9[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg16 <= (reg11[(5'h12):(3'h5)] ?
          ({reg15, ((7'h42) ? $unsigned(reg5) : $signed(reg4))} ?
              ((!reg14[(3'h5):(3'h5)]) >= wire3) : (~|(reg8 <<< (-reg13)))) : ((reg8 ?
              ((wire0 - reg12) & $unsigned(reg8)) : $unsigned((reg10 ?
                  wire1 : reg14))) || (((reg15 ? wire2 : reg10) ?
              reg8 : (8'ha3)) ^~ $unsigned((8'hb6)))));
      reg17 <= $signed($signed((~|reg15)));
      reg18 <= ((8'ha8) >> (|$signed($unsigned($unsigned((7'h44))))));
      reg19 <= ((!($unsigned((~&reg5)) ? wire3 : {(+reg4), (wire3 <= reg8)})) ?
          reg14 : reg18[(3'h4):(3'h4)]);
    end
  always
    @(posedge clk) begin
      if (($signed(($unsigned({reg7,
          reg11}) <<< $unsigned(reg19[(2'h3):(1'h1)]))) >= ((8'ha2) ?
          (~^{$unsigned(reg8)}) : {$signed((^~reg12))})))
        begin
          reg20 <= $unsigned(reg9);
          reg21 <= (reg10[(3'h4):(1'h0)] && reg17[(3'h5):(2'h3)]);
        end
      else
        begin
          if (reg20)
            begin
              reg20 <= $signed(reg6[(3'h5):(2'h3)]);
              reg21 <= $signed({$signed($signed(((8'hae) ? reg11 : reg7))),
                  reg16});
            end
          else
            begin
              reg20 <= wire2[(4'hb):(3'h7)];
            end
          reg22 <= reg7;
        end
      reg23 <= (|(+(+(^~wire1[(3'h5):(1'h0)]))));
    end
  assign wire24 = (reg21 == ({$signed((&reg14)),
                      $signed(wire3)} ~^ ((+$signed(reg18)) ^~ $signed((~reg11)))));
  assign wire25 = ((~&(wire3[(1'h1):(1'h0)] ?
                          $signed(reg16[(1'h0):(1'h0)]) : ((reg5 ?
                                  reg11 : reg14) ?
                              reg11 : wire24))) ?
                      reg13[(1'h1):(1'h1)] : reg21);
  assign wire26 = (|(&$unsigned($unsigned(wire25))));
  assign wire27 = (reg10[(2'h2):(1'h1)] ?
                      wire26[(4'hc):(2'h3)] : {$signed($signed((^reg22)))});
  always
    @(posedge clk) begin
      reg28 <= wire27[(4'hc):(1'h0)];
    end
  assign wire29 = ((reg4 ?
                      ($signed((reg13 ?
                          wire27 : reg5)) - $unsigned($unsigned(reg19))) : ((|$unsigned(reg23)) < $signed($signed(reg8)))) && reg16);
  assign wire30 = reg14;
  assign wire31 = $unsigned(((((reg13 != (7'h40)) <= $unsigned((8'ha8))) ?
                      wire27[(2'h2):(2'h2)] : $signed($signed((8'ha9)))) < $signed(((+reg8) >> $unsigned(reg22)))));
endmodule
