module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire18,
                 wire6,
                 wire5,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
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
                 (1'h0)};
  assign wire5 = wire1[(3'h4):(1'h0)];
  assign wire6 = ((^~wire5) < wire0);
  module7 #() modinst19 (.wire11(wire1), .wire8(wire2), .wire9(wire5), .wire10(wire6), .clk(clk), .y(wire18));
  always
    @(posedge clk) begin
      if ($signed(wire4[(3'h5):(2'h2)]))
        begin
          reg20 <= ((wire4[(5'h11):(4'hf)] ?
              (&wire4[(5'h14):(5'h12)]) : (~&$signed((wire1 >>> wire4)))) != (+wire2[(1'h1):(1'h1)]));
          reg21 <= $signed(wire4);
        end
      else
        begin
          reg20 <= ($unsigned($signed((~|{wire5}))) >= ((^~(~^$signed(wire5))) <<< wire5[(3'h5):(3'h4)]));
          reg21 <= (~|$unsigned($signed($unsigned((wire6 ? wire1 : wire3)))));
          if ($signed(wire18))
            begin
              reg22 <= ($signed({(|wire18)}) ?
                  reg21[(3'h5):(1'h1)] : $signed({(8'had)}));
              reg23 <= {reg22[(5'h12):(4'ha)],
                  $unsigned(((wire0 ?
                      $unsigned((8'ha2)) : (wire6 >> wire3)) <<< ((wire6 & wire0) ?
                      wire3 : ((8'hb8) ? wire18 : (8'haf)))))};
              reg24 <= wire0[(1'h1):(1'h0)];
              reg25 <= reg22;
            end
          else
            begin
              reg22 <= ((((~&(^~(8'hb2))) >= $unsigned(reg25)) ?
                  ($unsigned((~|reg24)) - ((wire1 ?
                      wire6 : reg23) ~^ (|reg24))) : {{(8'ha3)},
                      ({reg25} ?
                          wire4 : $signed(wire0))}) || (wire6[(3'h7):(2'h2)] ?
                  {($unsigned(reg23) ^~ (wire3 || wire18))} : ((reg23[(3'h4):(2'h2)] ^~ $unsigned(wire3)) ?
                      $unsigned({(8'hbf), reg22}) : (~{reg22, reg25}))));
              reg23 <= (+({$unsigned($unsigned(reg23)),
                  (^wire2)} * reg21[(2'h3):(1'h0)]));
              reg24 <= (wire5[(2'h3):(2'h3)] ?
                  (wire18 ?
                      ((+(reg20 ? (7'h44) : reg21)) << ((wire5 + reg22) ?
                          wire18[(3'h4):(1'h0)] : $signed(wire2))) : (|wire5[(4'hc):(4'hc)])) : (^~(&wire5)));
              reg25 <= reg23;
            end
        end
      if (wire0[(4'he):(4'he)])
        begin
          if (wire18)
            begin
              reg26 <= wire18;
              reg27 <= $unsigned(((!$unsigned({wire4,
                  reg26})) ~^ {((!wire0) + (reg21 ? reg25 : reg24))}));
              reg28 <= reg26[(4'h9):(3'h7)];
              reg29 <= (8'hae);
            end
          else
            begin
              reg26 <= ((wire3[(4'h8):(3'h6)] ?
                  (^~$unsigned((reg25 & reg23))) : ($unsigned(reg26) + $signed(reg25))) ^ wire6);
              reg27 <= $signed(wire2[(1'h0):(1'h0)]);
            end
          reg30 <= $unsigned({$signed(wire18[(2'h3):(1'h0)]),
              $unsigned($signed(reg24[(3'h7):(1'h0)]))});
        end
      else
        begin
          reg26 <= {(~^$signed(reg27[(3'h6):(3'h4)])), (^~reg29)};
          reg27 <= (((~&$signed({reg22})) && (-(~^(wire3 ? reg26 : (7'h44))))) ?
              $unsigned($unsigned(((8'ha6) ?
                  $unsigned((7'h43)) : {wire6}))) : $signed(wire5));
          reg28 <= (8'had);
          reg29 <= $unsigned(wire1[(4'hf):(4'h8)]);
        end
    end
  assign wire31 = reg23[(3'h5):(3'h4)];
  assign wire32 = ($signed((wire0[(2'h3):(1'h0)] ^ reg29[(3'h7):(1'h1)])) ^~ ((wire18 ?
                      wire1 : $unsigned((~^wire5))) > $signed(wire0[(4'ha):(3'h4)])));
  assign wire33 = (~&reg23[(3'h7):(1'h1)]);
  assign wire34 = reg24[(1'h1):(1'h1)];
  assign wire35 = {{(reg22[(5'h10):(1'h1)] ?
                              (reg28[(2'h2):(2'h2)] ^ $signed(wire33)) : $unsigned({wire2})),
                          $unsigned(((!reg22) ? {reg22, reg20} : (8'hb1)))}};
  assign wire36 = ($signed($unsigned(($signed(reg28) ?
                          $unsigned(reg21) : reg24))) ?
                      (^~{(~(7'h40)),
                          {((7'h44) ?
                                  reg27 : wire33)}}) : $unsigned($unsigned(reg21)));
  assign wire37 = (7'h42);
  assign wire38 = ($signed(($signed($signed(reg26)) ?
                      wire33 : wire1)) > ($signed($unsigned((reg23 ^~ (7'h40)))) <= (($signed(wire34) ?
                          $unsigned(reg21) : reg20[(2'h2):(2'h2)]) ?
                      (!$unsigned(reg25)) : (!reg25))));
  assign wire39 = (reg23 ? $unsigned(wire3) : wire5[(5'h11):(1'h1)]);
  assign wire40 = wire2[(1'h0):(1'h0)];
  assign wire41 = wire38[(4'he):(3'h6)];
  assign wire42 = wire2;
  always
    @(posedge clk) begin
      if (((wire3[(5'h12):(4'hc)] ?
          wire34[(3'h6):(3'h6)] : $unsigned($unsigned($unsigned(wire41)))) >> (!$unsigned((-$signed(reg30))))))
        begin
          reg43 <= (wire33[(4'hc):(2'h3)] ?
              ((((wire33 ?
                  wire1 : reg30) << reg23[(3'h6):(1'h1)]) ^~ (~(8'hb5))) * $signed((8'hb8))) : (-($signed(wire38[(3'h7):(2'h2)]) & reg21[(2'h2):(1'h0)])));
          if ((wire32 ?
              (((reg25[(2'h3):(1'h0)] ? (^~wire2) : (wire6 ^ reg26)) ?
                  {((8'h9c) << wire34), $unsigned(wire5)} : ($signed(wire33) ?
                      $unsigned(wire34) : wire6[(1'h0):(1'h0)])) | (~^($signed((7'h40)) ?
                  (-wire0) : {reg43}))) : $signed(wire36[(4'hf):(2'h3)])))
            begin
              reg44 <= (wire35 && (&$unsigned((((8'ha5) && reg21) ?
                  wire34 : wire31[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg44 <= (wire37[(1'h1):(1'h1)] != ((~|(7'h43)) - (8'had)));
              reg45 <= {wire4};
              reg46 <= ((reg25 == reg22) ?
                  wire38[(5'h10):(1'h1)] : reg25[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg43 <= $unsigned(wire34[(4'hb):(3'h7)]);
        end
      reg47 <= reg30;
    end
  always
    @(posedge clk) begin
      reg48 <= $unsigned(reg46[(2'h2):(2'h2)]);
      reg49 <= ({$signed(wire5)} ?
          ((|$signed((&reg43))) ?
              reg45[(3'h5):(3'h5)] : reg20[(1'h0):(1'h0)]) : (($unsigned((8'hbe)) ~^ (~^(reg20 ?
              wire3 : wire33))) >> (((8'ha8) >> {wire4,
              wire18}) * (wire39[(4'ha):(1'h0)] >> wire35[(2'h3):(1'h1)]))));
    end
endmodule

module module7
#(parameter param16 = (~|(((!(+(8'ha0))) ? (((8'hb8) << (8'h9d)) + (^(8'hbd))) : (((8'ha4) && (8'hb3)) ? ((7'h40) == (8'hb5)) : {(8'h9f)})) ? (((!(8'h9d)) > {(8'hb3), (8'haf)}) ? ((8'hb3) * ((8'hb7) ? (7'h40) : (8'hba))) : {(8'hbb)}) : (&(((8'ha8) ? (8'had) : (8'hab)) >> (!(8'ha2)))))), 
parameter param17 = (param16 - (&param16)))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  assign y = {wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = (wire8 ~^ (wire10 ?
                      {$signed(wire10[(2'h2):(2'h2)])} : $signed($signed((wire10 ^ wire8)))));
  assign wire13 = ($unsigned($unsigned($unsigned(((8'hb8) & wire9)))) * (wire11 ?
                      $unsigned($unsigned((!wire8))) : {{((8'haa) <<< wire10)}}));
  assign wire14 = $signed((~((~(^wire10)) + (~(wire9 || wire13)))));
  assign wire15 = $unsigned($signed(({$unsigned(wire10),
                      (wire12 ?
                          wire8 : (8'ha2))} << $unsigned(wire10[(3'h4):(3'h4)]))));
endmodule
