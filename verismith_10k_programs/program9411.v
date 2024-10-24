module top
#(parameter param26 = (((((^(8'ha6)) >= ((8'ha3) < (8'hbd))) ? (8'hb3) : (~((8'hbc) ^~ (8'haa)))) != (|(((8'ha8) ~^ (7'h43)) ? (-(8'hb9)) : ((8'h9e) ? (7'h41) : (8'hb1))))) < ({({(8'hb7)} ? (~|(8'haa)) : {(8'ha0), (8'ha1)})} ~^ (!(((8'hb9) && (8'h9c)) ^~ ((8'h9c) != (8'ha7)))))), 
parameter param27 = (param26 * ((8'hb1) ? param26 : {({(8'had)} - (param26 ? param26 : param26)), ((param26 * param26) || (param26 ? param26 : param26))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire0[(1'h0):(1'h0)];
    end
  assign wire6 = {$unsigned($signed($unsigned((wire1 - wire3))))};
  assign wire7 = $unsigned($unsigned($unsigned(wire1)));
  assign wire8 = wire6[(1'h0):(1'h0)];
  assign wire9 = ($signed($signed(wire1[(2'h2):(2'h2)])) ?
                     ((((~^wire0) ^~ (wire7 ?
                         (8'had) : wire4)) - (^{(8'hb7)})) <= reg5) : $unsigned($signed({((8'ha9) >> wire7)})));
  assign wire10 = (+(|(~$signed(wire1))));
  always
    @(posedge clk) begin
      reg11 <= $signed($signed(wire8[(3'h4):(2'h3)]));
      if (wire3[(5'h12):(4'hd)])
        begin
          reg12 <= $unsigned((&$unsigned((wire6[(1'h1):(1'h0)] < wire0))));
          reg13 <= wire10;
          reg14 <= (^~wire9);
          if (($signed(wire3) ? reg12[(4'hb):(4'h9)] : (+wire1)))
            begin
              reg15 <= wire10;
            end
          else
            begin
              reg15 <= $unsigned((|$unsigned((~|$signed(wire3)))));
              reg16 <= wire9[(4'h9):(3'h5)];
            end
          reg17 <= $signed(wire9);
        end
      else
        begin
          reg12 <= wire7;
          reg13 <= ({(~($signed((8'hbf)) | $unsigned(reg11))),
                  ($signed(reg16) ?
                      {$signed(reg17),
                          (wire0 + wire6)} : wire8[(1'h1):(1'h0)])} ?
              ($unsigned(($unsigned((8'h9c)) ?
                  wire2 : $unsigned(reg16))) < reg15) : reg14);
          if (reg5[(1'h0):(1'h0)])
            begin
              reg14 <= wire3;
            end
          else
            begin
              reg14 <= ({$signed($signed((!wire8)))} ?
                  {wire6, (reg15[(3'h5):(2'h2)] > (7'h43))} : reg16);
            end
          if ({{reg15},
              (~&(wire4 ~^ ((wire2 - reg12) ? reg12[(1'h0):(1'h0)] : wire3)))})
            begin
              reg15 <= (^~reg5[(3'h5):(2'h3)]);
              reg16 <= reg13;
              reg17 <= reg12[(4'hb):(1'h0)];
            end
          else
            begin
              reg15 <= $unsigned((((!{wire6, reg13}) * (&(wire8 ?
                  wire7 : reg12))) >>> reg5));
              reg16 <= (+$signed({(|$signed((8'hb4))), reg16}));
            end
        end
      if (wire2[(3'h7):(1'h1)])
        begin
          reg18 <= $signed($unsigned(wire0));
          reg19 <= reg14;
          reg20 <= {(wire9 || (reg18 << wire7[(1'h0):(1'h0)]))};
          reg21 <= {(((8'ha4) ?
                  reg20[(4'he):(3'h4)] : $unsigned((reg19 && wire6))) ^~ wire0),
              (+(reg11 <<< reg20[(3'h4):(2'h2)]))};
          if ($unsigned($unsigned((|{wire0}))))
            begin
              reg22 <= $unsigned((({$signed(wire4), (-wire2)} ? wire7 : wire8) ?
                  $unsigned($signed((reg13 ?
                      wire7 : wire8))) : $unsigned((reg19[(2'h2):(1'h1)] >>> wire1[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg22 <= $unsigned($unsigned($unsigned($unsigned($signed(wire1)))));
            end
        end
      else
        begin
          reg18 <= reg16[(4'hf):(4'h8)];
          if (($signed(wire3[(4'hd):(4'hb)]) || $signed((reg5 - reg19))))
            begin
              reg19 <= (~^$unsigned({{(reg12 ? reg15 : reg22)},
                  wire7[(1'h0):(1'h0)]}));
              reg20 <= (^$signed((~(^~$signed(reg5)))));
              reg21 <= (wire8 ?
                  (!((~|$signed(wire8)) ?
                      $signed((reg14 ?
                          wire3 : reg16)) : reg5)) : (~|$signed($unsigned(((8'hb2) ?
                      reg17 : reg11)))));
              reg22 <= ($unsigned($signed(((wire9 >> reg19) + wire6))) >> reg12);
            end
          else
            begin
              reg19 <= ((~{$unsigned(((8'hb0) >>> wire3)),
                  ($signed(reg17) >= $signed((8'h9f)))}) >>> (reg15[(3'h7):(1'h1)] ?
                  ($signed({(8'ha4), (8'hb8)}) ?
                      (reg21 ?
                          ((7'h40) ?
                              wire4 : (8'ha3)) : $signed(reg11)) : (|wire7)) : reg19[(1'h0):(1'h0)]));
              reg20 <= (reg17 | $signed(reg20));
              reg21 <= (~&{reg12[(2'h2):(1'h0)],
                  (^$unsigned(reg17[(3'h6):(3'h5)]))});
              reg22 <= $unsigned(wire0);
            end
          reg23 <= {wire10[(4'h8):(3'h6)], wire7};
          reg24 <= ($signed((&wire2)) ?
              reg5 : ((({reg5, reg14} ?
                      (reg15 ?
                          reg21 : wire2) : $signed(reg5)) == (|$unsigned(wire9))) ?
                  reg12 : $unsigned(({reg11} ? $signed(wire9) : (^~wire4)))));
        end
      reg25 <= $unsigned($unsigned({($unsigned((8'h9c)) ?
              reg5[(3'h7):(3'h4)] : reg12[(3'h7):(2'h2)]),
          reg18}));
    end
endmodule
