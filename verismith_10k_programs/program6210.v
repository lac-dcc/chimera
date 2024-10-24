module top
#(parameter param20 = (((-{((8'hb1) << (8'hb0)), ((8'hae) & (7'h44))}) ^ ((~((8'hb7) * (8'hb1))) ? (-(|(8'h9e))) : (((8'hb7) ? (8'hac) : (8'ha7)) ? ((7'h40) ? (8'hb7) : (8'ha1)) : {(8'hae), (8'hae)}))) > ({(~^{(8'hbf)})} & ((!((8'hba) * (8'haa))) ? ((^~(8'hbb)) - ((8'ha4) >= (8'hbf))) : (((8'ha5) <<< (8'hbb)) ? ((8'hae) ? (8'ha8) : (8'had)) : ((7'h44) >= (8'hb7)))))), 
parameter param21 = {(({(^param20)} ? param20 : ((param20 ? param20 : param20) ? param20 : (+param20))) ? {(&{param20}), (((8'hb1) ? param20 : param20) >> (param20 ? param20 : (8'hbc)))} : (~(8'hb7)))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire4,
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
  assign wire4 = (8'hb8);
  always
    @(posedge clk) begin
      reg5 <= ($signed(wire0) >> $signed($unsigned($unsigned($signed(wire3)))));
      if ((($signed((wire2[(2'h2):(1'h0)] && $unsigned(wire1))) ?
              ((wire2 | $unsigned(wire1)) ?
                  $unsigned(wire0[(2'h2):(1'h1)]) : $signed((~&wire2))) : ($signed($unsigned(wire0)) ?
                  ((~&wire4) ?
                      reg5[(3'h5):(2'h3)] : $unsigned(wire2)) : (~&(wire0 ?
                      wire0 : reg5)))) ?
          $signed($signed(wire2)) : wire3[(4'h8):(4'h8)]))
        begin
          reg6 <= (((($signed(wire0) || (+(8'ha3))) ?
                  $unsigned((wire1 + wire2)) : (8'haf)) ?
              (wire2 ^~ (+wire0)) : {((!wire2) >>> {wire1, wire1})}) ~^ wire1);
          if (($signed(((^~((8'hac) <= wire0)) ^~ $signed(wire2))) ?
              {$unsigned((wire2[(1'h1):(1'h0)] ~^ {wire3,
                      (7'h41)}))} : ($signed($signed((|wire2))) << (8'ha2))))
            begin
              reg7 <= (((reg5 ?
                      (&$signed(reg6)) : $unsigned((reg6 ?
                          (7'h40) : reg6))) ^ (wire2[(3'h6):(2'h2)] ?
                      $unsigned(reg5[(5'h11):(5'h10)]) : {(wire3 ?
                              wire4 : reg5)})) ?
                  wire0 : reg5);
              reg8 <= $signed($unsigned($unsigned($unsigned((wire1 ^ wire0)))));
              reg9 <= ($unsigned($unsigned({wire0[(3'h4):(3'h4)],
                      (wire0 <= wire0)})) ?
                  wire2[(3'h6):(3'h5)] : ($signed($unsigned((wire2 ?
                      wire1 : wire1))) & ($unsigned((^reg7)) ?
                      ((~reg7) ? reg7 : (wire4 ? wire4 : reg7)) : (~&wire3))));
            end
          else
            begin
              reg7 <= wire2[(3'h5):(1'h0)];
            end
          reg10 <= (reg5 ?
              (|$unsigned(wire4[(4'hd):(1'h1)])) : (~^wire1[(3'h5):(1'h1)]));
          reg11 <= wire2;
          if (($signed(((reg5 ? (wire3 ~^ reg10) : $signed(reg5)) ?
                  (-reg6) : $unsigned((reg6 ? reg11 : reg9)))) ?
              {reg5} : wire0[(3'h4):(1'h0)]))
            begin
              reg12 <= {(~^$signed((7'h44))), $unsigned(wire4)};
              reg13 <= (^~{$unsigned(($signed(reg5) ?
                      wire1[(1'h1):(1'h1)] : $unsigned(wire2))),
                  {((reg8 ? reg11 : wire2) ?
                          ((8'hb0) ^~ wire3) : ((8'ha4) ? wire4 : (8'ha4)))}});
              reg14 <= (^~$unsigned($unsigned($signed({reg11}))));
            end
          else
            begin
              reg12 <= $unsigned((^~(~^(~^((8'h9e) != wire2)))));
              reg13 <= (^(~&((8'hbb) << $unsigned(reg11))));
              reg14 <= $signed(wire0);
              reg15 <= (~$unsigned((reg7 != wire0[(4'h9):(3'h5)])));
              reg16 <= $signed((|({$unsigned(wire1),
                  (^~reg10)} && wire0[(4'ha):(3'h7)])));
            end
        end
      else
        begin
          reg6 <= $unsigned({(reg5[(5'h10):(4'hf)] ?
                  {{wire0}, {(8'hb1)}} : ((8'hb4) ~^ $signed(wire0)))});
          reg7 <= (~$unsigned((8'hb3)));
        end
      reg17 <= reg14[(4'h9):(2'h2)];
    end
  assign wire18 = {wire3[(4'hc):(4'h9)]};
  assign wire19 = $unsigned($signed(($signed((reg15 ?
                      reg15 : wire2)) ^~ reg10)));
endmodule
