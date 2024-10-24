module top
#(parameter param25 = ((((!(~|(8'ha9))) ^~ ((~|(8'hae)) ? (^(8'hbb)) : ((8'hbc) != (8'hbf)))) < {(((8'hb3) ? (8'ha2) : (8'hb0)) ? ((8'ha2) ^~ (8'h9c)) : ((8'hbb) ? (8'hab) : (8'ha0))), ((^(8'hb9)) > {(8'h9f)})}) ? (-(!(!{(8'h9c)}))) : ((^~{{(8'hac)}, (8'haa)}) ? {(((8'ha7) | (8'hb4)) | {(8'hb9)}), (^~((8'ha1) && (8'hbf)))} : ((((8'had) ? (8'h9d) : (8'had)) ? (~&(8'hba)) : {(8'haf), (8'hbe)}) ^ (8'ha0)))), 
parameter param26 = (8'hb9))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire18,
                 wire17,
                 wire5,
                 wire4,
                 reg19,
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
  assign wire4 = $unsigned(wire1);
  assign wire5 = $unsigned((wire1[(2'h2):(1'h1)] + $unsigned((&$signed(wire4)))));
  always
    @(posedge clk) begin
      if (wire1[(2'h3):(1'h1)])
        begin
          if ((^$signed(wire5)))
            begin
              reg6 <= (!{$signed((~(~^wire0)))});
            end
          else
            begin
              reg6 <= wire2[(4'h8):(2'h3)];
              reg7 <= {wire3[(3'h4):(3'h4)], $unsigned((wire1 == wire5))};
              reg8 <= $unsigned(wire4[(4'hb):(1'h0)]);
              reg9 <= reg8;
              reg10 <= $signed(wire0);
            end
        end
      else
        begin
          if ((reg10 == (-wire0)))
            begin
              reg6 <= ((wire1[(1'h0):(1'h0)] ?
                      ((~|$unsigned(reg6)) ?
                          wire2 : ((+(8'hb2)) <= (!(8'hba)))) : ((~^reg7[(3'h7):(3'h7)]) ?
                          $signed((wire5 ?
                              (8'haa) : wire3)) : ($signed((7'h41)) ?
                              (wire0 > wire3) : (+reg8)))) ?
                  $unsigned($unsigned($unsigned(wire0[(4'hd):(3'h5)]))) : wire0[(4'he):(1'h0)]);
              reg7 <= ((8'hbc) ?
                  {$signed(wire4),
                      $signed(wire0)} : ((~^wire1[(2'h3):(2'h3)]) >>> wire3));
              reg8 <= wire3;
              reg9 <= reg6;
            end
          else
            begin
              reg6 <= $unsigned(wire5);
              reg7 <= $unsigned($unsigned((~&reg10)));
              reg8 <= (+({$signed((reg9 ? wire2 : wire1))} ?
                  $unsigned($unsigned($unsigned(reg6))) : $signed({(wire3 > reg7)})));
            end
          if ((7'h41))
            begin
              reg10 <= (|{wire3});
              reg11 <= ({($unsigned(reg7[(3'h5):(2'h3)]) == $unsigned(wire3)),
                      ((wire0[(4'hd):(4'hc)] ?
                              (wire1 ? reg6 : wire5) : {reg10, wire2}) ?
                          {((8'hb5) ? wire1 : wire0),
                              {wire0, (8'h9c)}} : ({wire0,
                              reg9} > $signed(reg7)))} ?
                  (~$unsigned(((reg8 ?
                      wire5 : wire0) <= (reg6 && wire0)))) : {wire3[(1'h1):(1'h1)],
                      ({(^~reg6)} || $unsigned($unsigned(wire1)))});
            end
          else
            begin
              reg10 <= $unsigned(({wire5, (reg7 ? (&reg8) : $unsigned(wire4))} ?
                  $signed(reg9) : ($unsigned(((7'h40) - (8'ha0))) ?
                      (wire5[(2'h3):(1'h1)] + (wire0 == wire3)) : ($unsigned(wire5) || $signed(wire0)))));
              reg11 <= ($signed((wire1[(1'h0):(1'h0)] ?
                  wire2[(3'h6):(3'h5)] : ((wire3 < wire1) ?
                      $signed(reg9) : wire4))) << $unsigned(($unsigned(wire3[(3'h4):(2'h2)]) ?
                  (wire5 & (reg7 ? reg9 : (8'hbc))) : ({wire3} ?
                      (8'ha5) : wire1[(1'h1):(1'h0)]))));
              reg12 <= {(|$signed(((^(8'hbb)) - (+reg8)))),
                  {reg10[(3'h5):(1'h1)], $signed({(|(8'h9c))})}};
              reg13 <= reg9;
            end
          if ($signed($signed(reg10)))
            begin
              reg14 <= ((wire0[(4'h9):(3'h4)] ?
                      reg7 : {$unsigned((&wire1)), reg6}) ?
                  {wire0[(3'h6):(2'h2)]} : (8'haf));
              reg15 <= reg13;
              reg16 <= $unsigned((^~reg11));
            end
          else
            begin
              reg14 <= reg9;
            end
        end
    end
  assign wire17 = ($signed($unsigned((!{reg13, wire0}))) ?
                      $signed(reg11[(5'h12):(1'h1)]) : $unsigned(((^{reg16}) && $signed((reg16 ^~ reg10)))));
  assign wire18 = ((wire2[(1'h0):(1'h0)] ?
                          $signed({wire1}) : $signed(reg14[(2'h2):(1'h0)])) ?
                      {(~|$signed($signed((8'ha8))))} : reg9[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg19 <= $signed(($signed($unsigned(reg11[(4'h9):(3'h7)])) ?
          ($unsigned($signed(wire1)) ? $unsigned((~^wire5)) : wire1) : wire5));
    end
  assign wire20 = wire5[(1'h1):(1'h1)];
  assign wire21 = $unsigned((~^wire18[(1'h1):(1'h1)]));
  assign wire22 = {reg12};
  assign wire23 = (-$unsigned((7'h42)));
  assign wire24 = reg8;
endmodule
