module top
#(parameter param36 = (~|(8'h9f)), 
parameter param37 = {{(param36 ? param36 : {(param36 ? param36 : param36)}), (param36 ? param36 : ((param36 ? param36 : param36) ? param36 : param36))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
      reg5 <= ((wire3[(4'hd):(3'h4)] ^~ $unsigned($signed((wire0 * wire1)))) ?
          (!{(~^(wire0 ?
                  wire3 : wire1))}) : $signed($signed($unsigned((reg4 >> wire3)))));
      reg6 <= reg4[(3'h7):(3'h7)];
    end
  assign wire7 = wire2[(2'h3):(2'h2)];
  assign wire8 = $unsigned(wire0[(1'h0):(1'h0)]);
  assign wire9 = $unsigned(reg4);
  assign wire10 = ((8'haa) * wire3);
  assign wire11 = (8'hb0);
  assign wire12 = (((^$unsigned(wire11[(2'h3):(1'h1)])) ?
                          $unsigned((~wire0)) : wire0) ?
                      $signed((reg5[(2'h2):(1'h0)] >= (|$signed(wire10)))) : $signed((~&reg5)));
  assign wire13 = wire0[(4'hb):(1'h1)];
  always
    @(posedge clk) begin
      reg14 <= $unsigned({($signed(wire13) ?
              ($unsigned(reg6) ?
                  (~&(7'h41)) : $signed(wire12)) : ((wire10 >>> reg5) + $unsigned(wire13))),
          ((&{wire9}) << {{(8'hbb), wire9}})});
    end
  always
    @(posedge clk) begin
      reg15 <= (~^(reg4[(4'ha):(4'ha)] ?
          $unsigned($signed({reg14})) : (!($signed(wire12) ?
              (^wire12) : wire8[(4'hb):(2'h3)]))));
      reg16 <= ((|(((wire3 ? reg15 : wire12) ?
          wire8[(4'h9):(4'h8)] : (wire13 ?
              reg5 : wire10)) - (~(~reg4)))) - (8'hb5));
      reg17 <= (~|(~^$signed(wire2)));
      reg18 <= $unsigned(reg6);
    end
  always
    @(posedge clk) begin
      reg19 <= {$signed($unsigned((wire7 ?
              $signed(reg5) : (wire11 >= wire11))))};
      if (reg14[(2'h3):(1'h0)])
        begin
          reg20 <= wire2[(1'h1):(1'h0)];
          if ($unsigned(($signed(($unsigned(reg18) >> reg5)) ^~ ((reg15[(3'h5):(3'h4)] ?
              wire3 : reg19) != ((8'ha9) ?
              wire7[(2'h3):(1'h0)] : $unsigned(wire3))))))
            begin
              reg21 <= (8'hb3);
              reg22 <= (($signed((8'ha2)) ?
                      $unsigned(wire10[(3'h4):(2'h2)]) : ({(^~reg17),
                          wire2} << ($signed(wire9) ?
                          $signed((8'ha0)) : wire0[(2'h2):(1'h1)]))) ?
                  (reg6[(2'h3):(1'h1)] & wire0) : reg21);
            end
          else
            begin
              reg21 <= wire12;
              reg22 <= $signed(($signed(($signed(wire7) ?
                  {reg14} : (~^wire8))) != reg22[(3'h6):(2'h2)]));
            end
          if ((~&$unsigned((+$unsigned(reg4[(3'h7):(3'h5)])))))
            begin
              reg23 <= ((~&$unsigned($unsigned(wire3))) ?
                  ($signed((((8'ha3) != reg19) ? (!reg17) : $signed(wire9))) ?
                      $unsigned(wire1[(2'h3):(1'h1)]) : reg22[(1'h1):(1'h1)]) : $signed(($signed((reg6 == reg22)) ?
                      (reg6[(5'h10):(4'hf)] >>> (reg18 ?
                          wire3 : wire9)) : $signed((wire1 && wire10)))));
              reg24 <= reg6;
              reg25 <= wire9[(4'hc):(1'h1)];
            end
          else
            begin
              reg23 <= wire10[(4'hc):(3'h7)];
              reg24 <= ((($unsigned($signed(wire11)) >>> $signed((wire11 ?
                  reg23 : (8'h9f)))) ^ ({reg22, $signed(reg21)} ?
                  $unsigned((wire11 && wire13)) : $signed(wire1))) >= (^~$unsigned(((wire3 | (8'hbe)) ?
                  wire11[(3'h4):(1'h0)] : reg24[(1'h1):(1'h0)]))));
              reg25 <= reg15[(3'h7):(1'h1)];
              reg26 <= {reg20,
                  $signed($unsigned($unsigned((wire11 ^ (8'had)))))};
            end
        end
      else
        begin
          reg20 <= $signed(wire11);
          reg21 <= (|(-{(+(reg21 ? wire7 : (8'ha1)))}));
          if ($signed(wire13[(2'h3):(2'h3)]))
            begin
              reg22 <= {{(((wire7 ?
                          wire9 : wire3) >= (&reg21)) - ((reg22 - wire2) << (wire1 == reg4))),
                      ($unsigned(((8'ha1) >> reg16)) > ($unsigned(wire7) ?
                          wire9[(2'h3):(1'h1)] : wire7))}};
            end
          else
            begin
              reg22 <= wire8[(3'h7):(3'h4)];
            end
          if ($unsigned(reg24))
            begin
              reg23 <= reg20[(4'hb):(4'ha)];
              reg24 <= wire10[(1'h1):(1'h0)];
              reg25 <= {wire7[(4'hc):(4'hb)]};
            end
          else
            begin
              reg23 <= reg16;
            end
          reg26 <= (reg17[(4'hc):(4'hc)] <= reg18[(2'h2):(1'h0)]);
        end
      reg27 <= $unsigned({(8'hb6)});
      if (($signed((reg4[(2'h3):(1'h1)] ?
          wire11[(3'h4):(1'h1)] : (((8'hb2) < reg6) < wire12[(3'h6):(2'h2)]))) >>> {{reg20},
          $signed($signed(((8'ha5) >= wire7)))}))
        begin
          reg28 <= $unsigned(wire10[(3'h4):(3'h4)]);
        end
      else
        begin
          reg28 <= wire9[(4'ha):(4'h9)];
          reg29 <= $unsigned($signed($signed(reg19)));
          reg30 <= wire2;
          reg31 <= $signed($signed((((reg19 >> reg20) ?
                  reg27 : $signed(wire3)) ?
              $unsigned((!reg28)) : (~|reg24[(1'h1):(1'h0)]))));
        end
    end
  always
    @(posedge clk) begin
      reg32 <= ($unsigned($unsigned(((^(8'h9e)) || reg16))) >= (&($signed(reg30) ?
          reg27 : $unsigned(wire1))));
    end
  always
    @(posedge clk) begin
      reg33 <= $signed($signed((((reg27 ?
              reg20 : (8'hb6)) * reg28[(1'h0):(1'h0)]) ?
          ($unsigned((8'hba)) || {reg18}) : reg19)));
      reg34 <= (^((reg30[(3'h5):(1'h0)] ?
          $signed(wire12[(1'h0):(1'h0)]) : (!$signed(wire7))) * (^~$signed(((8'ha1) * (8'hb8))))));
      reg35 <= reg4[(3'h7):(3'h4)];
    end
endmodule
