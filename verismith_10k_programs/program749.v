module top
#(parameter param23 = (((!(8'hbe)) ? {(~^{(7'h44)})} : {(~&((8'ha1) ? (8'hb3) : (8'hb0))), ((~^(8'ha8)) ? ((8'h9c) << (8'h9f)) : ((8'hb6) == (8'hb4)))}) ? (!(({(8'hb4), (8'hae)} << (|(8'hbf))) ? (((7'h42) < (8'ha1)) ^ ((8'hb0) ? (8'hbc) : (8'ha6))) : (!((8'hb3) < (8'hb3))))) : (({(+(8'hac))} ? (~^((8'hb3) == (8'h9e))) : {((8'ha3) << (7'h40))}) >> ((((8'h9f) || (8'h9e)) << {(8'hae)}) ? (~&((8'hba) <= (7'h41))) : (&(~&(8'hba)))))), 
parameter param24 = ((param23 ? ({(^~param23)} ? param23 : (((8'hbc) ? (8'hb1) : param23) ? {param23} : {param23})) : (((param23 ? param23 : (8'hbb)) ? ((8'ha8) > param23) : ((8'hb8) ? param23 : param23)) ? param23 : (param23 | param23))) ? param23 : (param23 ? {param23, ((~&param23) ? param23 : param23)} : param23)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ((~^{($signed((8'hab)) ?
                         $unsigned(wire0) : {wire3})}) + wire0);
  assign wire6 = wire0;
  assign wire7 = $unsigned($unsigned({wire0}));
  assign wire8 = wire0[(4'hc):(3'h5)];
  assign wire9 = wire6[(3'h5):(1'h1)];
  assign wire10 = wire6[(3'h5):(1'h0)];
  assign wire11 = wire6;
  assign wire12 = $unsigned((wire3[(3'h4):(1'h1)] | $unsigned((~&wire9))));
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg13 <= $unsigned($signed(((-$signed(wire8)) != {wire12[(2'h3):(1'h1)],
              wire11[(1'h1):(1'h1)]})));
          if (wire2)
            begin
              reg14 <= ($unsigned(((((8'hbb) >= wire4) ~^ {wire7,
                  wire4}) == wire0[(3'h6):(2'h2)])) < wire11);
              reg15 <= (wire2 != (8'ha5));
              reg16 <= {$signed($unsigned(reg14[(2'h2):(2'h2)])),
                  ($unsigned($signed(wire6[(1'h1):(1'h1)])) != (-wire11))};
            end
          else
            begin
              reg14 <= (~|((wire12 >> ($unsigned(reg13) <= (reg15 ~^ wire11))) ?
                  $unsigned(reg16) : $signed($unsigned($unsigned(wire11)))));
              reg15 <= wire10;
              reg16 <= (wire7 ^ $signed(((+(~reg15)) ?
                  ({(7'h40)} ?
                      wire2[(1'h0):(1'h0)] : wire8) : wire12[(2'h2):(2'h2)])));
              reg17 <= ((~|(wire9 ~^ ($signed(wire3) & $unsigned(wire7)))) ^~ ((&(wire9 ?
                  $signed(wire3) : reg16)) < {wire2, (~&$unsigned(reg14))}));
              reg18 <= $signed(wire11[(3'h6):(1'h0)]);
            end
          reg19 <= ($unsigned($signed(wire2)) > reg17);
          reg20 <= ((-{$unsigned((&wire0)),
                  $signed(((8'hb7) ? (8'hb5) : wire9))}) ?
              ($unsigned($unsigned((wire7 <= reg17))) != (((wire11 * reg16) * (reg17 ?
                  wire12 : wire7)) | reg16[(5'h13):(4'hd)])) : reg16[(1'h0):(1'h0)]);
          reg21 <= $signed({(wire0 ?
                  (+(wire10 ?
                      wire6 : wire7)) : ((reg13 * reg15) << wire7[(1'h1):(1'h0)]))});
        end
      else
        begin
          if ((reg13 >= (^~(&((~^wire5) && $signed(wire9))))))
            begin
              reg13 <= {$unsigned($unsigned((reg16[(5'h10):(3'h4)] << {reg20,
                      reg21}))),
                  $unsigned($unsigned(reg19))};
              reg14 <= (^((wire10[(1'h1):(1'h0)] >> wire3[(3'h6):(3'h6)]) >= {$unsigned((wire4 * wire7)),
                  ($unsigned(reg13) == wire10)}));
              reg15 <= $unsigned(($unsigned({(~^reg14)}) - $signed((~&(~|wire1)))));
            end
          else
            begin
              reg13 <= ($signed({$unsigned((^~wire3))}) ?
                  $unsigned($signed(wire4[(3'h4):(1'h1)])) : $signed($unsigned(($signed(wire4) ?
                      $unsigned(reg19) : (~&(8'ha1))))));
            end
          reg16 <= $signed(reg14[(1'h0):(1'h0)]);
          if ($unsigned(($unsigned($signed((reg19 ^ wire9))) ?
              reg20 : (wire8[(4'h8):(3'h7)] ?
                  {{reg18, reg18}, wire10} : wire2[(2'h2):(2'h2)]))))
            begin
              reg17 <= $unsigned(reg13);
              reg18 <= reg16[(4'h8):(1'h1)];
              reg19 <= ({(!wire5[(4'he):(3'h7)])} == $unsigned($unsigned((~reg20))));
              reg20 <= $unsigned(reg19[(4'h8):(4'h8)]);
              reg21 <= (~&reg19[(1'h1):(1'h0)]);
            end
          else
            begin
              reg17 <= (reg17 ?
                  (reg19 + ($signed($unsigned(wire8)) < (~^$unsigned((8'haf))))) : reg20[(1'h1):(1'h0)]);
              reg18 <= (+$unsigned((((wire10 != wire8) >= (|reg15)) ?
                  wire6[(1'h0):(1'h0)] : $signed(wire2[(3'h4):(2'h3)]))));
              reg19 <= wire12[(2'h2):(1'h0)];
              reg20 <= {$signed(wire2[(1'h1):(1'h0)]), wire4[(3'h4):(1'h1)]};
              reg21 <= $unsigned(reg16[(4'hf):(1'h0)]);
            end
          reg22 <= (^~{reg13, reg16});
        end
    end
endmodule
