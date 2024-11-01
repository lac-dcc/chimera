module top
#(parameter param26 = (+(-((&((8'hb1) <<< (8'had))) ? (((8'hb1) ? (8'hb6) : (8'hb2)) ? {(8'haa)} : ((8'haf) ? (8'hb4) : (8'h9d))) : {(!(8'hb6))}))), 
parameter param27 = ((+(|((-(7'h41)) > (+param26)))) ? param26 : (^~({(param26 ? (8'h9f) : param26)} && {{(7'h42), param26}}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire15,
                 wire14,
                 wire13,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
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
      reg4 <= (8'hb8);
      reg5 <= (!$unsigned(wire3[(3'h6):(3'h6)]));
      if (wire0)
        begin
          reg6 <= (wire3 ?
              ({reg4[(3'h4):(1'h0)], reg5} ?
                  (((8'ha3) ? {reg5} : wire1[(4'h9):(3'h4)]) ?
                      ({wire3} ^ reg4) : wire1) : $unsigned({$signed(reg4)})) : $signed((^~wire2[(2'h3):(2'h3)])));
          if (((wire2[(1'h0):(1'h0)] ^ (|$unsigned($signed(wire1)))) ?
              $signed((wire1 + wire0[(1'h0):(1'h0)])) : $signed((!{(~|wire0),
                  (wire1 - wire3)}))))
            begin
              reg7 <= {{wire1, wire0}};
              reg8 <= ($unsigned($signed({(~|(8'hbc)),
                  $signed(reg4)})) || (!(~&((wire1 ? reg6 : reg5) ?
                  reg7[(4'ha):(1'h0)] : reg5))));
            end
          else
            begin
              reg7 <= ({$signed(reg6),
                  (-wire3[(3'h5):(1'h1)])} << (reg8[(4'he):(1'h0)] ?
                  $unsigned(((wire1 - reg4) ?
                      $unsigned(reg4) : {reg4, wire1})) : $unsigned(((reg5 ?
                          reg7 : reg5) ?
                      (reg7 + reg5) : $signed(reg7)))));
              reg8 <= (($unsigned((~&(reg8 < reg6))) >= (reg8 > wire0)) ?
                  (($unsigned($unsigned((8'haf))) || $signed((reg5 ?
                      reg5 : reg5))) == reg8) : reg5[(4'hd):(4'h9)]);
            end
          reg9 <= wire1;
          reg10 <= (|((wire3[(2'h2):(1'h1)] ^~ ((~|reg9) ?
                  (wire3 | reg9) : $signed(reg8))) ?
              $signed(((reg9 ?
                  reg4 : reg9) == $signed(reg5))) : (+$unsigned(wire1[(1'h0):(1'h0)]))));
          if (reg8)
            begin
              reg11 <= (reg10 ?
                  $signed(reg6[(2'h2):(1'h1)]) : ((wire0[(3'h5):(2'h2)] ?
                      (reg7 ?
                          $signed(reg10) : ((8'hbb) ^ (8'ha4))) : (+wire0)) ~^ $unsigned(reg9[(4'hd):(4'h9)])));
            end
          else
            begin
              reg11 <= (reg10 ?
                  wire3 : (reg9[(3'h7):(3'h5)] ?
                      $unsigned($signed($signed(reg9))) : (8'h9e)));
            end
        end
      else
        begin
          reg6 <= (({wire3[(2'h3):(1'h0)]} ?
                  {($signed(reg11) ? $signed(reg8) : reg6),
                      reg11[(3'h5):(3'h5)]} : ({(reg5 + reg6)} < (8'hb7))) ?
              $unsigned((~$unsigned((wire1 ?
                  reg4 : wire3)))) : $unsigned(((reg8 ?
                  reg10[(4'hb):(3'h4)] : reg8) || ((reg4 >> reg6) <= (!reg6)))));
          reg7 <= ($signed($unsigned((wire0 ?
              reg10 : reg6[(2'h2):(1'h1)]))) && $signed(({(~&wire0)} ?
              $signed(reg8[(3'h5):(2'h3)]) : $unsigned((-wire1)))));
        end
      reg12 <= {reg10, $unsigned({reg4})};
    end
  assign wire13 = {(~wire3)};
  assign wire14 = ((+$unsigned({(wire0 ~^ reg8),
                      (reg6 ?
                          reg8 : wire2)})) && $signed(((-(reg5 >= (8'hbf))) ?
                      (^wire2) : ((reg10 - reg6) ?
                          (reg9 ? wire1 : wire13) : (wire13 ?
                              reg9 : (8'hbf))))));
  assign wire15 = reg10;
  always
    @(posedge clk) begin
      reg16 <= ((reg12 >>> $signed((-wire14))) > (($signed(reg6) ?
          wire1[(3'h6):(2'h3)] : $unsigned($unsigned(reg12))) ^~ (|{reg6})));
      if ($unsigned($signed((~&(((8'h9e) || (8'haa)) ^~ (reg9 ?
          reg9 : wire13))))))
        begin
          reg17 <= $signed({reg9});
          reg18 <= $unsigned(((reg9 ?
              $signed((~|reg17)) : (((7'h40) - reg7) ?
                  (~^reg9) : (reg10 ? reg11 : reg10))) > $unsigned((|reg7))));
          reg19 <= wire13[(4'hd):(3'h4)];
        end
      else
        begin
          if (reg5)
            begin
              reg17 <= ((reg11 >= ($unsigned((reg16 ~^ wire14)) == reg7[(4'ha):(3'h7)])) - $signed($signed((&(&reg7)))));
              reg18 <= $signed($unsigned($signed(($unsigned(wire13) ^~ (~|wire3)))));
              reg19 <= $unsigned({$unsigned($unsigned((|reg18))),
                  {$signed($unsigned((7'h42))), wire0}});
              reg20 <= (reg12 << $unsigned((~^wire15[(4'h8):(3'h4)])));
            end
          else
            begin
              reg17 <= $unsigned(({(+wire14)} ? reg20 : (^(8'hb2))));
              reg18 <= $unsigned({{reg17, $signed(((7'h43) ? reg17 : wire2))},
                  reg5[(4'hf):(3'h5)]});
              reg19 <= $signed(($signed(wire15) != $signed(((^reg17) ~^ {reg6}))));
              reg20 <= (8'hac);
            end
        end
      reg21 <= ((((reg8[(1'h1):(1'h0)] ?
              wire1[(4'h9):(3'h4)] : (8'h9d)) | reg17[(2'h2):(1'h1)]) ?
          (-(reg16 ?
              $signed((7'h41)) : $signed(reg10))) : $unsigned({$unsigned(wire3)})) && $unsigned((8'hb2)));
      reg22 <= reg12;
      reg23 <= reg19[(3'h6):(2'h3)];
    end
  assign wire24 = reg16[(4'ha):(2'h3)];
  assign wire25 = (~reg16);
endmodule
