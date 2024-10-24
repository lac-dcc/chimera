module top
#(parameter param23 = (~|((+(~^(!(8'hb9)))) ^~ {(((8'hab) + (8'ha1)) >> {(8'h9c), (8'hb8)}), (~^((7'h44) ? (8'hb9) : (8'ha4)))})), 
parameter param24 = {{({{param23, param23}, (param23 <= param23)} >> ((^param23) ? (param23 | param23) : (param23 ? param23 : param23))), (((^~param23) ? param23 : (param23 <= param23)) ^ param23)}, param23})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
      reg4 <= $signed($signed(((wire2 <= ((8'ha2) ^~ wire1)) ?
          wire3 : {wire2, ((8'ha5) ^~ wire3)})));
      reg5 <= wire3;
      if (reg5[(3'h4):(3'h4)])
        begin
          reg6 <= ({$unsigned(reg4),
                  ($unsigned((~|reg5)) <= {$unsigned(wire2)})} ?
              wire0 : (!(($unsigned(wire2) ?
                  $unsigned(wire0) : {reg4}) || wire0[(4'h8):(2'h2)])));
          reg7 <= {wire2[(3'h6):(3'h5)], reg4};
          if (reg6[(4'hc):(4'h8)])
            begin
              reg8 <= $signed($signed((~(+((8'hb7) + wire2)))));
              reg9 <= (reg8 ?
                  {($unsigned($signed(reg7)) ? (-$signed((8'hbf))) : reg6),
                      $unsigned(reg4)} : reg8[(3'h5):(1'h1)]);
              reg10 <= (~&$unsigned(wire3[(3'h5):(2'h3)]));
              reg11 <= (reg8[(3'h5):(3'h4)] >> reg7[(2'h2):(2'h2)]);
            end
          else
            begin
              reg8 <= ({(^~wire3)} && (~^(!($signed(wire0) ?
                  $unsigned(wire0) : reg5))));
              reg9 <= (wire0 + reg8[(1'h0):(1'h0)]);
              reg10 <= (($unsigned(((|wire2) != $signed((8'hb3)))) * $signed($unsigned(reg7[(1'h0):(1'h0)]))) ^ ($unsigned($signed(reg6)) ?
                  ((~|reg6) ?
                      wire1 : (^~$signed(reg10))) : $unsigned($signed((wire0 + reg9)))));
              reg11 <= (($unsigned($unsigned($signed(reg4))) ?
                      $signed(({wire3} + reg10[(4'hb):(3'h7)])) : $signed($unsigned(wire2))) ?
                  {$signed((^(wire1 ~^ reg4))),
                      reg11} : $unsigned(($unsigned((wire2 ?
                      reg7 : reg9)) < (8'hb3))));
            end
          reg12 <= ($signed($signed((~(reg7 || reg5)))) + reg10);
        end
      else
        begin
          reg6 <= {($unsigned((~^(reg6 ?
                  (8'hb6) : reg9))) ~^ $signed($unsigned($unsigned(reg4))))};
          reg7 <= ($unsigned({($unsigned(reg8) ?
                      wire3[(2'h3):(1'h0)] : $unsigned((8'hbb)))}) ?
              ($unsigned(reg9[(5'h11):(4'ha)]) ?
                  (~wire2[(2'h2):(2'h2)]) : wire3) : ((($unsigned(wire3) ?
                      (wire0 <<< wire3) : (|reg4)) ?
                  {(wire2 ? reg11 : wire2),
                      (^~reg10)} : (+(wire3 == reg11))) + (~^reg5)));
          reg8 <= (~^(-(&$unsigned((|(7'h40))))));
          reg9 <= (!reg8);
        end
      reg13 <= ((reg12 == $unsigned(((wire3 == reg5) < $signed(wire1)))) ?
          {$unsigned(((^reg10) >>> (reg7 ?
                  wire2 : wire1)))} : reg7[(2'h3):(1'h1)]);
    end
  assign wire14 = (~^(^~$signed(reg13[(3'h6):(3'h6)])));
  assign wire15 = wire2[(3'h5):(3'h4)];
  assign wire16 = reg10;
  assign wire17 = wire14;
  assign wire18 = reg12[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg19 <= $signed($signed($signed({$signed(reg9), reg6[(3'h4):(3'h4)]})));
      reg20 <= ((^~(8'hbb)) || reg13);
      reg21 <= $unsigned($unsigned((~&reg10[(4'hd):(4'h9)])));
      reg22 <= (8'hb1);
    end
endmodule
