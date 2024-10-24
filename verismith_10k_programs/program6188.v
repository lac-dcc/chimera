module top
#(parameter param26 = (|(~&((~^(~&(8'hb1))) ? (~^(~^(7'h41))) : ({(7'h44)} ^~ ((8'h9c) ? (8'ha9) : (8'hb4)))))), 
parameter param27 = {param26, ((((^~param26) != (param26 >>> (7'h44))) ? ((param26 >> param26) != (param26 ? param26 : param26)) : param26) ? (+(((8'hae) >> param26) ? (param26 ? (8'ha3) : param26) : (param26 ? param26 : param26))) : (((param26 >= (8'had)) >= (!param26)) ? ((~&param26) ? (&param26) : param26) : {param26, {param26}}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire25,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire4,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (~^$signed(wire2[(4'h9):(4'h8)]));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          if (wire4[(2'h2):(1'h1)])
            begin
              reg5 <= (|(|wire0));
            end
          else
            begin
              reg5 <= $signed(((+(8'had)) * (wire0[(3'h7):(3'h6)] ?
                  (wire1 << {(8'ha6)}) : reg5)));
              reg6 <= ({wire4[(4'hc):(1'h0)]} ? wire0[(1'h1):(1'h1)] : wire0);
            end
          reg7 <= (^$signed((^{{wire2}, $unsigned(reg6)})));
          reg8 <= {$unsigned((wire0 + reg7)), (~&$signed($signed(reg7)))};
        end
      else
        begin
          reg5 <= $signed(($unsigned((wire0 >= wire2[(4'h9):(3'h4)])) ?
              reg6 : reg7[(1'h0):(1'h0)]));
        end
    end
  assign wire9 = ($unsigned(wire3[(4'hd):(3'h6)]) ?
                     reg6 : (reg5[(1'h0):(1'h0)] && $signed($unsigned(((7'h42) << wire2)))));
  assign wire10 = $unsigned((-($unsigned((8'hb8)) ?
                      $signed($signed(wire2)) : wire9)));
  assign wire11 = (8'hb2);
  assign wire12 = {reg6[(4'h9):(1'h1)], reg8};
  assign wire13 = (($signed((wire4 ?
                      reg6[(2'h2):(2'h2)] : (~^reg6))) && ((~|(wire11 >>> (8'ha7))) >>> $signed($signed(reg8)))) ~^ $signed(($unsigned($signed(wire4)) ?
                      $signed(reg8[(1'h0):(1'h0)]) : (8'ha4))));
  assign wire14 = (wire12[(4'he):(3'h6)] ?
                      $signed($signed($unsigned((wire13 >>> (8'hbd))))) : wire0[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg15 <= wire0;
      reg16 <= (~|(reg5[(4'hc):(3'h5)] ?
          wire12[(1'h1):(1'h1)] : wire4[(4'hd):(4'hc)]));
      reg17 <= {((+wire14[(4'h8):(1'h1)]) && wire13[(5'h14):(4'he)]),
          $unsigned((~&(~^{wire10})))};
      if (((8'h9f) ?
          wire9[(3'h7):(3'h4)] : (-$unsigned($unsigned($unsigned(wire13))))))
        begin
          reg18 <= $unsigned(({((wire3 ?
                  wire12 : wire0) >= reg7[(4'h8):(2'h3)])} & wire2));
          if (($unsigned({wire13}) ?
              {(8'ha0),
                  wire14[(1'h0):(1'h0)]} : $signed({((^~reg5) >> $signed(wire2)),
                  (!(reg18 | (7'h40)))})))
            begin
              reg19 <= ({((!wire13[(4'h9):(3'h7)]) ?
                          (~^wire11) : (+$unsigned(wire3))),
                      (reg15 & (wire13[(1'h0):(1'h0)] & wire1))} ?
                  (~$unsigned({(~^wire12),
                      (wire0 ?
                          wire4 : wire4)})) : (($signed(((7'h44) <<< reg16)) <= ((wire1 | (8'hbc)) ?
                      $signed(wire3) : $unsigned(reg5))) >> reg18[(2'h3):(1'h0)]));
            end
          else
            begin
              reg19 <= $unsigned({(^~($unsigned(wire10) <= reg5[(2'h3):(2'h3)])),
                  wire2[(2'h2):(2'h2)]});
              reg20 <= $unsigned($signed((($unsigned((8'ha1)) ?
                      wire9 : wire11[(3'h4):(2'h2)]) ?
                  ((~^reg19) ?
                      $signed(reg8) : (^~reg19)) : $unsigned(wire3[(4'hd):(4'hb)]))));
              reg21 <= (&(wire12[(1'h0):(1'h0)] && wire13[(3'h4):(3'h4)]));
            end
          reg22 <= (($unsigned(($unsigned(wire4) >>> (reg6 | (7'h40)))) ?
                  $signed(wire9) : reg5) ?
              (~|reg18[(2'h2):(1'h0)]) : ((8'hbf) * $signed((!{wire4, reg6}))));
          if ($unsigned($signed($signed(wire14))))
            begin
              reg23 <= reg20;
              reg24 <= reg8;
            end
          else
            begin
              reg23 <= $signed($unsigned(reg7[(2'h3):(1'h0)]));
              reg24 <= (-($unsigned((+(~|reg23))) && ((|(reg5 ?
                      wire11 : reg19)) ?
                  {((8'hb5) ? wire11 : wire2),
                      (~reg18)} : $signed($signed((8'hac))))));
            end
        end
      else
        begin
          reg18 <= $signed(($signed((^~(-wire4))) >= (~^$unsigned($unsigned(reg21)))));
          if ($signed(wire1))
            begin
              reg19 <= wire4[(4'h9):(3'h7)];
              reg20 <= ($unsigned(({reg20[(3'h4):(1'h0)],
                      $unsigned(reg5)} == $signed(wire10))) ?
                  ((&$signed((reg17 ?
                      wire3 : wire10))) ~^ {(+reg22[(3'h6):(3'h4)])}) : $signed(($unsigned($signed(wire4)) ?
                      $signed($unsigned(wire0)) : ($unsigned(reg24) ?
                          {(8'hb0), wire13} : wire14[(1'h0):(1'h0)]))));
              reg21 <= (~^$signed(reg7[(3'h7):(1'h0)]));
              reg22 <= reg23;
              reg23 <= wire14[(3'h5):(2'h2)];
            end
          else
            begin
              reg19 <= {(+(^~(-(+reg15)))),
                  ($unsigned({(8'had), (8'hae)}) + ({{wire12}} <= reg18))};
              reg20 <= $signed($unsigned($unsigned((wire13 ?
                  wire2[(3'h6):(3'h6)] : reg24[(2'h3):(2'h2)]))));
              reg21 <= $signed($unsigned($unsigned(reg22[(2'h3):(2'h2)])));
              reg22 <= wire12[(3'h7):(3'h7)];
              reg23 <= {(^reg6[(3'h4):(3'h4)]),
                  $signed(((|wire0) ?
                      ((!wire1) - $signed(wire4)) : ((reg22 + wire9) <<< (~^(8'ha1)))))};
            end
          reg24 <= {reg22[(3'h5):(1'h1)]};
        end
    end
  assign wire25 = (($signed(wire13[(1'h0):(1'h0)]) ?
                      wire4 : reg23[(4'hd):(4'ha)]) >>> ((!(8'hbb)) ?
                      reg24[(1'h1):(1'h0)] : $signed(wire1[(5'h13):(4'he)])));
endmodule
