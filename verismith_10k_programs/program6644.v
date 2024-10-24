module top
#(parameter param17 = (8'hb1), 
parameter param18 = ({{(^{param17})}, (((param17 << param17) ? (param17 == (8'had)) : (param17 == param17)) ? param17 : ((param17 ? param17 : param17) && (~^param17)))} ? {param17, param17} : (((|(|param17)) ~^ (~(^param17))) || (8'hb6))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire5,
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
                 (1'h0)};
  assign wire4 = (~((|($signed(wire1) - ((8'h9f) ? wire1 : wire1))) ?
                     wire0[(2'h2):(1'h1)] : wire3[(1'h1):(1'h0)]));
  assign wire5 = $signed((wire2 ?
                     {(~^$signed(wire1))} : {(wire3 ?
                             $signed(wire4) : (+wire0))}));
  always
    @(posedge clk) begin
      if ((~wire1[(4'ha):(3'h6)]))
        begin
          reg6 <= $signed($unsigned(($signed((wire1 ?
              wire4 : (8'h9c))) ^~ $unsigned(((8'ha9) < wire0)))));
          if ($unsigned($signed(wire0[(1'h1):(1'h1)])))
            begin
              reg7 <= reg6;
              reg8 <= $unsigned(wire4);
              reg9 <= wire5;
              reg10 <= {((~|$unsigned((&wire2))) < ((~$signed(wire3)) >>> ((reg6 ?
                          reg8 : reg9) ?
                      $unsigned(wire1) : {reg6}))),
                  (|(~&$unsigned($unsigned(wire3))))};
            end
          else
            begin
              reg7 <= reg6[(1'h1):(1'h0)];
              reg8 <= ((({{wire3}} << $signed($signed(reg7))) || reg9[(3'h4):(3'h4)]) ^~ {(8'ha4)});
            end
          reg11 <= (reg9[(4'h8):(1'h1)] ?
              $unsigned((reg10[(4'hd):(1'h1)] ?
                  {$unsigned(reg7),
                      (~^wire4)} : $unsigned($signed(reg9)))) : reg9[(4'h9):(3'h5)]);
        end
      else
        begin
          reg6 <= $unsigned(($unsigned($signed($unsigned(wire4))) ~^ $signed(reg10)));
          reg7 <= (({(~&reg7[(1'h1):(1'h1)]), wire4[(2'h3):(1'h1)]} ?
              (+($signed(reg8) * ((8'h9c) ?
                  reg10 : reg9))) : {($signed(wire2) << (~|wire0)),
                  $unsigned(((8'hb0) ? wire4 : wire0))}) ^~ (($unsigned(reg10) ?
                  ((reg6 < reg11) ? wire5 : wire2) : ({wire2} >= wire4)) ?
              $unsigned((^(|wire4))) : (8'hb0)));
          if ($signed((wire0 ? reg7[(1'h1):(1'h0)] : wire2[(1'h0):(1'h0)])))
            begin
              reg8 <= reg8;
              reg9 <= (+($unsigned((&$signed(reg7))) ?
                  ($signed(wire0) <<< (reg10[(4'h9):(1'h0)] ?
                      {wire4,
                          reg8} : $unsigned(wire1))) : wire2[(2'h2):(1'h1)]));
            end
          else
            begin
              reg8 <= (|(|(($unsigned(reg9) ? reg7 : wire1) ?
                  reg8 : reg8[(3'h6):(1'h0)])));
            end
          reg10 <= {($signed(((reg11 << reg7) ^~ (reg7 ~^ (8'h9f)))) ?
                  $signed(reg6[(2'h2):(1'h1)]) : {(~&(wire4 ? reg11 : wire0))}),
              (~^$signed($signed(((8'haa) - wire0))))};
        end
      if (wire5)
        begin
          if ($unsigned($unsigned((8'ha4))))
            begin
              reg12 <= $signed(wire4[(1'h0):(1'h0)]);
              reg13 <= $unsigned($unsigned((wire1[(3'h6):(2'h3)] ^~ $unsigned((^(8'hb0))))));
            end
          else
            begin
              reg12 <= reg7[(1'h0):(1'h0)];
              reg13 <= wire2;
            end
          reg14 <= reg10[(3'h7):(3'h7)];
          reg15 <= $signed($unsigned(({(&reg10),
              (wire1 ^~ wire5)} * (~&reg11[(1'h1):(1'h0)]))));
        end
      else
        begin
          reg12 <= wire4[(4'hb):(4'hb)];
          reg13 <= (8'hb7);
        end
    end
  assign wire16 = reg10;
endmodule
