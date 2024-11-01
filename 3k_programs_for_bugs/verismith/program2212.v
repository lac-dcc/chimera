module top
#(parameter param22 = {{((~|((7'h42) ? (7'h43) : (8'h9e))) <= (^{(8'hbe)})), ((^~(^(8'hb2))) <<< ((~^(8'ha2)) | ((8'ha2) - (8'h9d))))}, (|(({(8'ha8)} ? (|(8'ha6)) : (8'ha2)) ? ((~&(8'hb5)) | (|(8'ha6))) : ((8'ha7) <<< ((8'hbd) ? (8'hb9) : (8'ha9)))))}, 
parameter param23 = (^~param22))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg17,
                 reg16,
                 reg15,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed(wire0[(3'h4):(2'h2)]) ^ wire1[(1'h1):(1'h1)]);
      reg5 <= {($unsigned($unsigned(wire2[(3'h5):(3'h4)])) != ($unsigned(reg4) ?
              wire2 : (!wire0[(4'hd):(2'h3)])))};
      if (reg5)
        begin
          reg6 <= ((($signed((reg4 << wire0)) <= {wire1,
              {wire2}}) <= (~wire2[(4'hb):(4'hb)])) - ((((8'h9d) ?
              {wire2, reg5} : (wire3 ?
                  wire3 : wire0)) || $unsigned($unsigned(wire3))) | (~&({wire0,
              (8'hb7)} * {wire3, wire3}))));
          reg7 <= ($unsigned($signed($signed($signed(reg5)))) + {wire2[(3'h5):(3'h5)]});
        end
      else
        begin
          reg6 <= (&(({$signed(reg4)} ?
                  ((wire1 + reg6) ?
                      {reg7,
                          wire3} : wire0[(3'h6):(3'h4)]) : $signed(reg5[(4'h9):(3'h4)])) ?
              ({$signed(wire0)} ?
                  (~(reg7 ?
                      reg6 : reg6)) : ((-reg7) | (-reg7))) : ($unsigned($unsigned((8'hae))) ?
                  (wire0 ? (~|(7'h42)) : wire3) : (reg6 + (~|wire2)))));
          if ({$unsigned(({reg6, (reg7 > (8'hb3))} ?
                  ($unsigned(reg5) + $signed(reg5)) : $unsigned(reg4[(3'h7):(3'h7)]))),
              $signed($unsigned($unsigned(wire0)))})
            begin
              reg7 <= {reg5[(2'h3):(1'h1)], reg6[(3'h4):(3'h4)]};
              reg8 <= (~^(+wire0[(5'h10):(5'h10)]));
              reg9 <= (((((&wire1) & {reg5,
                      (7'h40)}) <= $unsigned(wire3)) <= (&(((8'hbf) ?
                          reg8 : reg5) ?
                      $signed((8'hb3)) : (~reg8)))) ?
                  (!$signed({reg6[(3'h4):(2'h2)],
                      wire2})) : $unsigned($unsigned({$signed((8'hb4)),
                      (~wire3)})));
            end
          else
            begin
              reg7 <= $unsigned((^~reg5));
              reg8 <= {($signed(((~&(8'hba)) ?
                      (wire0 ~^ reg9) : wire2[(4'hc):(4'h8)])) ^~ wire0),
                  $unsigned($signed($signed($signed(reg5))))};
              reg9 <= ((^$unsigned(reg7)) ^~ wire0[(5'h10):(5'h10)]);
            end
        end
    end
  assign wire10 = (+$unsigned(reg6[(4'hc):(2'h3)]));
  assign wire11 = reg7;
  assign wire12 = (&(wire3[(2'h3):(1'h0)] ^~ reg7));
  assign wire13 = ($signed(wire11) ?
                      $signed((wire11 ?
                          reg7[(4'h8):(1'h1)] : wire12[(3'h5):(1'h0)])) : ($signed((reg6[(3'h7):(3'h4)] ?
                          reg9[(4'hf):(4'hb)] : reg6)) >= wire3[(4'h9):(4'h9)]));
  assign wire14 = ($unsigned($unsigned($signed((~&wire1)))) ?
                      ((8'hb7) > (8'h9c)) : reg8[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg15 <= $signed((-$signed((reg9[(4'h9):(1'h1)] ?
          $unsigned(reg7) : {reg6}))));
      reg16 <= wire13;
      reg17 <= $signed((reg15[(4'ha):(4'ha)] ?
          $signed(({reg16, (8'hb1)} > wire13)) : reg4[(3'h4):(3'h4)]));
    end
  assign wire18 = {reg9, {(^$unsigned($signed(reg17))), reg8}};
  assign wire19 = $unsigned({(~&(wire18[(3'h4):(3'h4)] << wire2[(4'hf):(4'h9)]))});
  assign wire20 = (($signed(((^~reg8) ?
                      wire0 : ((8'ha6) ?
                          wire14 : reg8))) >= $unsigned(wire19)) - reg4[(3'h4):(1'h0)]);
  assign wire21 = reg9;
endmodule
