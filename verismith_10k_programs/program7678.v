module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire28,
                 wire25,
                 wire24,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
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
                 (1'h0)};
  assign wire4 = wire0[(3'h6):(1'h0)];
  assign wire5 = (|$signed((-wire1)));
  assign wire6 = {{$unsigned((|$signed(wire3))), wire3[(4'h9):(3'h4)]},
                     wire0[(3'h6):(2'h2)]};
  assign wire7 = ((8'ha9) ? $signed((8'hba)) : wire4);
  assign wire8 = wire3[(3'h5):(1'h0)];
  assign wire9 = wire6;
  assign wire10 = {((!$signed((8'hbc))) ^ (wire5[(2'h2):(1'h0)] >> wire2[(2'h3):(1'h1)])),
                      $unsigned((wire9[(2'h2):(1'h0)] ?
                          ($unsigned(wire9) ?
                              (7'h42) : wire6[(3'h5):(3'h5)]) : ((~&wire2) ?
                              wire7 : $unsigned(wire5))))};
  assign wire11 = (|{$signed($unsigned($unsigned(wire3)))});
  always
    @(posedge clk) begin
      reg12 <= (8'hbf);
      if ((wire5[(2'h2):(1'h1)] << ((~^((-wire8) << {wire3})) >= wire11)))
        begin
          reg13 <= reg12;
          if ($signed($signed((-wire4))))
            begin
              reg14 <= wire2[(4'hd):(3'h4)];
              reg15 <= (^wire11);
              reg16 <= wire5[(1'h1):(1'h0)];
            end
          else
            begin
              reg14 <= {(reg13[(1'h1):(1'h1)] ^ reg13)};
            end
          if ((wire8[(1'h1):(1'h0)] ?
              ((wire9[(3'h5):(2'h2)] ?
                  {$unsigned(wire1),
                      $unsigned(wire2)} : wire1) || $signed($signed($signed(wire0)))) : (~|wire10[(1'h1):(1'h1)])))
            begin
              reg17 <= wire11[(3'h6):(1'h1)];
              reg18 <= wire5[(1'h0):(1'h0)];
              reg19 <= $unsigned(wire6[(1'h0):(1'h0)]);
            end
          else
            begin
              reg17 <= (({(8'h9c),
                      ((wire9 ? reg16 : wire4) && $unsigned((8'hab)))} ?
                  ($signed($unsigned((8'hb3))) && (reg15[(1'h1):(1'h0)] ?
                      {wire5} : $unsigned(wire2))) : wire9) < (^({reg12[(1'h1):(1'h1)]} ?
                  $signed($signed(wire1)) : (~|$unsigned(reg16)))));
              reg18 <= {(~|(&((wire10 ? wire1 : wire1) ?
                      $unsigned(reg16) : $signed(wire9))))};
            end
        end
      else
        begin
          if ((|wire10[(4'he):(4'h9)]))
            begin
              reg13 <= reg16;
              reg14 <= (wire6 & {reg18});
            end
          else
            begin
              reg13 <= (($signed($unsigned($signed(reg14))) ?
                      ($signed((wire0 >> wire5)) - (~|((8'hb4) ?
                          wire7 : wire5))) : ((7'h43) ?
                          (wire6[(3'h6):(2'h3)] ^~ (&reg17)) : reg12)) ?
                  ($signed(wire5) == reg18[(4'h9):(4'h9)]) : wire10);
              reg14 <= (~^$unsigned(reg18[(3'h6):(3'h5)]));
              reg15 <= ($unsigned($signed(($unsigned(reg15) >> ((8'hb6) > reg19)))) ?
                  ($signed({(~&wire11)}) ?
                      wire9 : $unsigned(({reg19} ?
                          reg14[(4'hc):(3'h6)] : ((8'hb4) ?
                              reg15 : wire6)))) : ($unsigned((reg13[(5'h11):(4'hb)] ^ (wire6 & wire4))) + (({reg19,
                          wire1} ~^ $signed(wire6)) ?
                      (reg17 ?
                          (&wire8) : $unsigned(reg18)) : $unsigned((|reg13)))));
              reg16 <= (reg19 ? wire3 : wire1);
              reg17 <= (((8'hb6) ?
                      (wire9 ?
                          $unsigned({(8'ha7)}) : wire4) : wire9[(2'h2):(1'h1)]) ?
                  {(^(reg14 ? reg17 : $unsigned(wire1))),
                      wire11} : (($signed($unsigned((8'hb9))) ?
                      $signed((-wire1)) : ({reg12,
                          wire6} | (|wire5))) < $signed($unsigned(reg17))));
            end
          reg18 <= (((^~{wire9}) ?
                  $unsigned((wire4 ?
                      $signed(reg14) : (^reg12))) : wire1[(4'ha):(4'ha)]) ?
              {{$signed($signed(wire9))}} : ((~|{$unsigned(wire11),
                  $unsigned(wire9)}) || $signed($unsigned((-reg17)))));
          reg19 <= (wire0 ?
              reg17[(4'ha):(3'h4)] : $signed($unsigned({$unsigned((8'ha5)),
                  (~wire6)})));
          reg20 <= $signed((~&(&($signed(reg14) * (wire8 >> wire8)))));
        end
      reg21 <= wire5;
      reg22 <= ($signed((wire2[(4'h9):(3'h7)] & reg12[(2'h3):(2'h3)])) <<< ((|(&(-wire5))) ?
          reg21[(2'h3):(1'h1)] : $signed((^~(&(7'h44))))));
      reg23 <= $unsigned($unsigned((({(8'hb6)} ?
          (wire2 ? (8'hab) : reg17) : (^~wire2)) < wire4)));
    end
  assign wire24 = $signed(wire6);
  assign wire25 = $unsigned($signed({{(+(8'hbc))}}));
  always
    @(posedge clk) begin
      reg26 <= (!$signed($signed((|$unsigned(wire11)))));
      reg27 <= reg17;
    end
  assign wire28 = {reg21};
  always
    @(posedge clk) begin
      if ($signed($unsigned($unsigned((wire5[(1'h0):(1'h0)] ?
          $unsigned(reg14) : (&reg19))))))
        begin
          reg29 <= $signed(({wire2[(5'h10):(1'h1)],
              reg14[(1'h1):(1'h0)]} >>> (8'hbe)));
          reg30 <= $unsigned(({((wire6 ? reg27 : (8'hb2)) ?
                      (reg17 >>> reg15) : $unsigned(reg17)),
                  ((reg14 ? reg22 : reg26) && (reg15 ? reg16 : reg15))} ?
              $unsigned(reg15[(4'hf):(3'h7)]) : $unsigned(wire0)));
          reg31 <= reg21[(3'h5):(2'h3)];
        end
      else
        begin
          if ({(wire9 ? wire11 : reg13[(5'h10):(5'h10)]),
              ($signed(wire10) + wire11[(3'h5):(2'h2)])})
            begin
              reg29 <= $signed(reg22);
              reg30 <= reg18[(4'h9):(3'h5)];
            end
          else
            begin
              reg29 <= $unsigned($unsigned(wire2));
            end
          reg31 <= $signed((|(~&((&reg16) ? $unsigned(reg21) : (~&reg29)))));
          if (wire8)
            begin
              reg32 <= $unsigned((|(&(wire3 ?
                  {reg29} : reg22[(4'h8):(4'h8)]))));
              reg33 <= reg30;
            end
          else
            begin
              reg32 <= (+(^(^wire8)));
            end
          reg34 <= reg33[(4'ha):(1'h1)];
          reg35 <= wire3;
        end
    end
  always
    @(posedge clk) begin
      reg36 <= reg18[(4'h8):(3'h7)];
      reg37 <= {{$unsigned($signed((8'hb6))), $signed(reg21)}};
    end
  assign wire38 = $unsigned($signed((8'hb5)));
  assign wire39 = (~^($unsigned($unsigned(((8'hb8) < wire2))) ?
                      reg21 : {$signed((reg27 ? reg37 : reg20)),
                          (-$signed((8'ha3)))}));
  always
    @(posedge clk) begin
      reg40 <= $signed((wire38 - ($unsigned((-reg32)) << (+(~^reg18)))));
      reg41 <= ($signed((reg23 ?
              (8'ha3) : ((wire38 && reg19) || $unsigned(wire28)))) ?
          (($unsigned(reg31) ?
              ((reg12 ? reg29 : reg23) - ((8'hbc) << reg20)) : ($signed(reg29) ?
                  (^~reg29) : (~|wire10))) >= ($unsigned($unsigned((8'hb6))) <<< reg21[(3'h6):(3'h6)])) : {$signed((^(8'hba))),
              $signed(((wire25 ? reg18 : wire39) ?
                  $unsigned(wire2) : (reg37 >>> wire5)))});
      reg42 <= $signed(((($signed((7'h41)) - (+reg26)) || $signed(wire24[(1'h0):(1'h0)])) ?
          $signed((8'hb3)) : (&reg40[(1'h0):(1'h0)])));
      reg43 <= reg32;
    end
endmodule
