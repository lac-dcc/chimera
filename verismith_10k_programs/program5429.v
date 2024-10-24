module top
#(parameter param20 = {((((!(7'h41)) ? ((8'haf) ? (7'h41) : (8'ha8)) : (8'hb0)) & (!(&(8'ha6)))) ? (((^(8'hae)) ? ((8'hab) && (8'hb1)) : ((8'hb1) + (8'hac))) ? (+((8'ha1) ^~ (8'ha0))) : (^((8'hba) ? (8'h9e) : (8'hb7)))) : (8'ha4))}, 
parameter param21 = param20)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  assign y = {wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $signed($signed((~((~^wire3) ?
                     ((8'hba) & (8'hb6)) : (wire0 ? wire2 : wire3)))));
  assign wire5 = wire3;
  assign wire6 = (8'hb2);
  assign wire7 = (^~wire0);
  assign wire8 = (wire7[(3'h4):(2'h2)] - wire3);
  assign wire9 = $unsigned((^(((~^wire1) < wire0) ?
                     (wire2[(2'h3):(2'h2)] ?
                         $signed(wire2) : $signed(wire6)) : (+wire7[(4'hd):(3'h7)]))));
  always
    @(posedge clk) begin
      reg10 <= wire4;
      if ({$unsigned(wire5[(1'h1):(1'h0)]), $signed(wire9[(4'h8):(3'h4)])})
        begin
          if (($signed($unsigned({(!wire7),
              $signed(wire7)})) <<< $unsigned(wire4)))
            begin
              reg11 <= $unsigned(($unsigned($signed($signed(wire0))) == reg10));
              reg12 <= (+(wire7 ?
                  (((wire8 ? wire0 : wire7) ?
                      $signed((8'ha8)) : $unsigned((8'haf))) == (-{wire8,
                      (8'hb1)})) : $unsigned((+wire7[(3'h7):(3'h4)]))));
            end
          else
            begin
              reg11 <= reg12;
              reg12 <= $signed(((wire0 <<< ($signed(reg10) ~^ $signed(wire9))) != $unsigned($unsigned((wire5 ?
                  reg11 : wire3)))));
            end
          reg13 <= wire4;
          reg14 <= ($unsigned((!$signed((^~reg10)))) && (+wire1));
          if (reg13)
            begin
              reg15 <= (~|$unsigned(($signed((|wire8)) ?
                  reg12[(5'h10):(4'ha)] : ($signed(reg11) <<< $unsigned(wire1)))));
            end
          else
            begin
              reg15 <= wire1;
            end
          reg16 <= (wire8 ?
              (reg14 ?
                  $unsigned(wire7[(3'h7):(3'h6)]) : (7'h40)) : $signed($unsigned(reg15[(1'h1):(1'h0)])));
        end
      else
        begin
          if (reg11[(1'h1):(1'h1)])
            begin
              reg11 <= ($unsigned(wire1[(4'h8):(3'h4)]) ?
                  $signed($signed(reg14)) : (wire1 ^~ $unsigned($signed($signed((8'had))))));
              reg12 <= $signed(reg11[(4'hb):(4'hb)]);
              reg13 <= wire8;
            end
          else
            begin
              reg11 <= (+$unsigned($unsigned(wire5)));
              reg12 <= {(8'haf)};
              reg13 <= {$unsigned(reg16),
                  (^~$signed({(+reg11), $signed(reg15)}))};
            end
          reg14 <= reg13;
          reg15 <= {$unsigned({(|wire4[(1'h0):(1'h0)]), reg12[(4'he):(4'ha)]}),
              {$signed($unsigned((wire4 ^~ wire6))),
                  ((^reg14[(4'h9):(4'h9)]) ?
                      $unsigned(wire3) : reg16[(2'h2):(1'h0)])}};
          reg16 <= wire7;
          reg17 <= $signed(wire5[(2'h2):(2'h2)]);
        end
      if ({$unsigned((-(wire6 ? (~|reg11) : $unsigned(wire8))))})
        begin
          reg18 <= (wire8[(2'h3):(1'h1)] ?
              reg14[(1'h0):(1'h0)] : ({$signed((!reg10))} ?
                  reg12 : $signed((!wire2[(2'h3):(1'h0)]))));
          reg19 <= $signed($signed((^reg17[(3'h7):(1'h0)])));
        end
      else
        begin
          reg18 <= {{$unsigned(({(8'haf), wire6} && $unsigned(wire3))),
                  reg17[(3'h4):(1'h0)]}};
        end
    end
endmodule
