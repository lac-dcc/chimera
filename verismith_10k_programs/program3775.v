module top
#(parameter param64 = (-((~^((&(7'h43)) ? (-(8'hb0)) : ((8'ha7) && (8'hb2)))) ? ({((8'ha8) && (8'hbf)), ((8'ha2) && (8'ha3))} <<< (~^((8'ha9) + (8'ha8)))) : {((-(8'hbe)) == ((8'hb4) ? (8'haf) : (8'haa))), ({(7'h43)} <= ((8'hb9) ? (8'hbc) : (8'h9d)))})), 
parameter param65 = (param64 ? {(param64 ? ((!(8'ha1)) ? (param64 + (8'hb2)) : (param64 << param64)) : {param64})} : {param64}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h227):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire17;
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire37,
                 wire36,
                 wire17,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 (1'h0)};
  module4 #() modinst18 (wire17, clk, wire0, wire2, wire1, wire3);
  always
    @(posedge clk) begin
      if ((8'ha9))
        begin
          reg19 <= wire1;
          if ((8'hb3))
            begin
              reg20 <= wire2;
              reg21 <= $unsigned((({reg19[(2'h3):(2'h2)]} ?
                  (wire0 >= $unsigned(wire1)) : {(!wire0)}) ^ {wire3[(1'h1):(1'h1)]}));
              reg22 <= (^(wire1 ?
                  $signed(wire1[(4'hd):(4'ha)]) : (reg20[(2'h2):(1'h0)] <= $signed($signed(reg20)))));
              reg23 <= ($signed(wire1[(3'h6):(3'h4)]) ?
                  {reg22[(1'h0):(1'h0)], $signed($signed((-wire17)))} : wire2);
            end
          else
            begin
              reg20 <= wire2[(1'h0):(1'h0)];
              reg21 <= ((+(reg23[(3'h4):(1'h1)] ?
                  wire1 : {reg23, reg19})) < (!wire2[(4'hb):(4'hb)]));
              reg22 <= reg21[(4'hd):(2'h3)];
              reg23 <= (|({reg23,
                  $unsigned($unsigned(reg19))} - ((+$signed(reg19)) || ($signed(reg21) ?
                  (wire3 ? reg23 : reg22) : wire0[(4'ha):(1'h1)]))));
              reg24 <= (~&wire1[(2'h3):(2'h3)]);
            end
          reg25 <= $signed($signed(($signed($unsigned(wire2)) >= (~wire2[(4'ha):(3'h7)]))));
          if ((!$signed((8'ha8))))
            begin
              reg26 <= {(^~((!(reg25 >>> wire17)) ?
                      (reg20 ?
                          $unsigned(reg22) : (reg21 != reg19)) : (!reg25)))};
            end
          else
            begin
              reg26 <= (wire1[(2'h3):(2'h2)] ?
                  (wire1[(3'h7):(1'h1)] ?
                      ((~|(8'haf)) <<< $signed((~^reg23))) : {$unsigned((+wire2)),
                          $signed($unsigned(wire0))}) : wire1);
              reg27 <= reg25[(3'h4):(2'h3)];
              reg28 <= (~|(reg23[(1'h0):(1'h0)] | ((reg20 & reg23[(3'h4):(2'h3)]) & (reg26[(4'ha):(3'h4)] ?
                  (^wire2) : $unsigned(reg27)))));
              reg29 <= (!(($unsigned((-reg23)) ?
                      reg20[(3'h5):(1'h1)] : $signed($unsigned(reg24))) ?
                  ((reg19 ? (+reg24) : (^~reg26)) != ((reg25 ? reg21 : reg23) ?
                      (wire3 ^~ reg23) : reg22[(2'h2):(1'h0)])) : $unsigned($signed(reg19))));
            end
          if (($signed({wire3}) ?
              $signed(($unsigned((~&reg26)) ?
                  reg23 : (reg21 ?
                      (8'hba) : ((8'h9c) >> reg27)))) : reg24[(2'h2):(1'h0)]))
            begin
              reg30 <= wire0[(4'hc):(1'h1)];
              reg31 <= (wire17 ?
                  (^~(wire0 ?
                      reg20[(3'h6):(3'h6)] : $unsigned({(8'hb7),
                          reg20}))) : $signed(((+reg25) ?
                      wire1 : $signed($unsigned(wire1)))));
              reg32 <= (8'hb5);
              reg33 <= $signed($unsigned((reg20[(2'h3):(1'h1)] ?
                  $unsigned(((8'ha2) || (8'hb8))) : {(reg27 ? wire17 : wire3),
                      reg29[(3'h6):(1'h1)]})));
            end
          else
            begin
              reg30 <= (^reg20);
              reg31 <= $unsigned(reg28[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg19 <= (&($unsigned(wire2[(3'h5):(1'h1)]) || (&((^wire1) && (8'hab)))));
          if ((8'ha4))
            begin
              reg20 <= ((+reg33[(3'h5):(1'h1)]) <<< ($unsigned(((8'hb5) ?
                  reg28 : (reg32 < wire17))) ~^ reg29));
              reg21 <= $signed((8'ha6));
            end
          else
            begin
              reg20 <= reg32[(4'hb):(3'h7)];
              reg21 <= {((({wire1, (8'hbd)} ?
                      reg19[(2'h2):(1'h0)] : $signed(reg27)) ^~ $signed((~|reg30))) ^ (wire1 * (reg21 > (|wire3))))};
              reg22 <= $unsigned(reg33[(4'h8):(3'h6)]);
              reg23 <= (reg26 ?
                  $signed((-reg30)) : $signed(((|(reg23 == (8'ha6))) ?
                      reg22 : $unsigned((reg31 >>> wire0)))));
              reg24 <= reg31[(5'h13):(1'h0)];
            end
          reg25 <= (((reg31 ?
                      ({reg20, wire2} >= (|wire17)) : ((reg32 ?
                          reg31 : reg22) != (~^wire1))) ?
                  (reg33[(2'h3):(1'h1)] < ((reg28 != (8'hbd)) ?
                      (~|wire2) : $signed(reg31))) : ((-(reg33 ?
                          reg27 : reg22)) ?
                      $unsigned($unsigned(reg31)) : wire0[(3'h4):(1'h1)])) ?
              reg31[(3'h4):(1'h1)] : reg25);
          reg26 <= $signed(reg27[(4'h8):(1'h1)]);
        end
      reg34 <= (^~$unsigned(wire1));
      reg35 <= $unsigned($unsigned(wire3[(3'h5):(1'h0)]));
    end
  assign wire36 = wire1;
  assign wire37 = (reg20 || $unsigned($unsigned($unsigned({reg30, reg25}))));
  always
    @(posedge clk) begin
      if (reg19)
        begin
          if ((((reg30 >= ((8'hb7) ? (7'h43) : $unsigned(reg29))) == (((reg32 ?
                  reg29 : reg32) >> reg30) || ((~|reg26) ?
                  (~^(8'h9f)) : (reg19 ^~ reg24)))) ?
              (~^(reg29 ?
                  reg23[(1'h1):(1'h1)] : reg32)) : $unsigned($signed(((~reg21) ?
                  reg20[(2'h2):(2'h2)] : $signed(wire3))))))
            begin
              reg38 <= $unsigned($unsigned(($unsigned($unsigned((8'hb0))) ?
                  (+(reg29 ? wire17 : reg25)) : $signed((reg22 ~^ reg23)))));
              reg39 <= ((wire3 - ({$unsigned((8'hb4)),
                      (wire17 ? wire0 : reg21)} ?
                  ((reg27 ? (8'hae) : reg27) == wire0) : ((reg21 & (8'hba)) ?
                      wire17 : $unsigned((8'ha4))))) >> reg28[(1'h0):(1'h0)]);
              reg40 <= (~(reg35[(4'hf):(1'h1)] >>> reg33));
              reg41 <= reg28[(4'hf):(4'hd)];
            end
          else
            begin
              reg38 <= $signed($unsigned($signed(($unsigned(reg24) ?
                  $unsigned(reg35) : $signed((8'hab))))));
            end
          reg42 <= reg35[(3'h6):(1'h0)];
          if ($signed($unsigned(reg41)))
            begin
              reg43 <= $signed($signed($signed(((8'hbe) >> $signed(reg31)))));
              reg44 <= reg29[(2'h2):(2'h2)];
              reg45 <= $signed(wire1);
            end
          else
            begin
              reg43 <= (&wire1);
            end
          reg46 <= ((^~$signed({reg26[(4'he):(4'hc)]})) >>> (&$unsigned(wire37)));
        end
      else
        begin
          if (($signed(reg28[(5'h10):(2'h3)]) >> $signed($signed(($signed((8'hb6)) ?
              reg21[(4'hf):(3'h4)] : (^reg40))))))
            begin
              reg38 <= $unsigned(reg34);
              reg39 <= {reg41[(2'h3):(1'h1)], reg35};
              reg40 <= ($unsigned((~{(reg34 ? reg26 : reg33)})) ?
                  (+(~^(wire17[(2'h3):(2'h2)] <= reg46))) : reg27[(4'h9):(1'h1)]);
            end
          else
            begin
              reg38 <= reg21[(3'h6):(3'h4)];
            end
          reg41 <= $signed((~^{((~&(8'h9d)) ? (~&reg46) : $signed((8'ha3))),
              (^~$signed(reg38))}));
          reg42 <= $unsigned({reg41[(2'h2):(1'h0)]});
        end
      if (((($signed((reg42 ? reg29 : reg25)) ?
              $signed(reg34[(4'he):(3'h6)]) : $signed($signed(reg39))) ?
          wire0 : (+reg46)) & reg29))
        begin
          reg47 <= $unsigned((^$signed($signed((wire3 == reg35)))));
          if (reg27)
            begin
              reg48 <= (&(|($unsigned($signed(reg40)) != $unsigned((reg44 <<< reg21)))));
              reg49 <= $signed((!$unsigned((~$unsigned((8'hb0))))));
              reg50 <= $unsigned($signed($signed(reg40[(2'h2):(1'h1)])));
            end
          else
            begin
              reg48 <= $unsigned((wire37 ?
                  {((-reg25) ?
                          (~^reg50) : $unsigned(reg50))} : $unsigned($signed(reg41))));
              reg49 <= ($signed((^~reg27)) ? reg44 : (^~reg22));
              reg50 <= {$unsigned((reg23[(2'h3):(2'h2)] ? reg28 : (+reg21))),
                  (wire17 ?
                      ((~|$unsigned(reg27)) ?
                          (~reg34[(4'ha):(2'h2)]) : ($unsigned((8'hb6)) ?
                              reg43 : {reg34})) : reg32)};
              reg51 <= wire0;
            end
        end
      else
        begin
          reg47 <= $unsigned((wire0[(4'hd):(1'h0)] || reg49));
          reg48 <= $signed($signed((((~reg51) ?
              (reg38 ^ reg42) : $unsigned((8'hab))) & $unsigned({(8'ha2)}))));
          reg49 <= {{$signed($signed(reg38)),
                  (reg21 ?
                      ($unsigned((8'hb2)) ^~ $unsigned(reg21)) : $signed(reg34[(4'hb):(3'h6)]))},
              {reg27[(3'h7):(3'h4)], (~$signed({(8'h9d), (8'haf)}))}};
        end
      reg52 <= (reg31 <<< ($unsigned($unsigned((!reg27))) ?
          {(-(reg41 ? wire1 : reg51)), wire0} : reg33[(4'hc):(4'hb)]));
      reg53 <= (^~(((wire37[(3'h5):(2'h3)] ?
          (wire36 + reg47) : reg23[(1'h1):(1'h0)]) <= (reg50 < $unsigned(reg32))) > {((!wire1) ?
              (^reg23) : (reg39 == reg31)),
          wire17}));
    end
  assign wire54 = ($signed(reg50[(1'h1):(1'h0)]) <= reg21);
  assign wire55 = (~&{(($signed((8'haf)) ?
                              reg31[(1'h1):(1'h0)] : {reg27, reg27}) ?
                          reg25[(1'h1):(1'h1)] : $signed((~&reg44)))});
  assign wire56 = (+((($signed(reg24) ? (!reg24) : (+reg31)) ~^ (~&(reg34 ?
                          reg48 : wire3))) ?
                      $unsigned((~$unsigned(reg41))) : $signed(reg48[(5'h14):(4'h8)])));
  assign wire57 = reg38;
  assign wire58 = (^~reg48[(5'h14):(4'hd)]);
  assign wire59 = ($signed((wire1 ?
                      $unsigned($signed(reg43)) : (reg22 ~^ reg44))) << wire3);
  assign wire60 = wire58;
  assign wire61 = ($signed(($unsigned($unsigned(reg41)) | $signed((reg29 ?
                      reg27 : wire56)))) ^~ reg20);
  assign wire62 = (8'ha9);
  assign wire63 = (~|wire61);
endmodule

module module4
#(parameter param15 = ((^~((((8'hb3) && (8'had)) ? (~^(8'ha9)) : ((7'h40) ? (8'ha7) : (8'h9d))) <<< (8'ha5))) <<< ((|(((8'hab) - (8'hb6)) ? {(8'ha6)} : (^~(8'had)))) ? (((^~(8'hba)) ? {(8'hac), (8'h9e)} : ((8'hb1) <<< (8'ha3))) ? {((8'hbe) >= (8'hb8)), (|(8'hbc))} : (((8'hb1) > (8'ha8)) ? ((8'hb6) + (8'ha8)) : (^(8'ha1)))) : ((~((7'h42) ? (7'h40) : (8'hbe))) && (((8'hb9) * (8'hbd)) | (^(8'hbb)))))), 
parameter param16 = (!(param15 ? (param15 ? param15 : (8'ha9)) : ({((8'h9f) ? (8'hb9) : param15)} * {(&param15), (param15 || param15)}))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  assign y = {wire14, wire13, wire12, wire11, wire10, wire9, (1'h0)};
  assign wire9 = (!(wire5 >= $signed($unsigned(((8'hac) ? wire7 : (8'ha5))))));
  assign wire10 = (wire7 * $unsigned((~&((wire5 == wire7) ~^ $signed(wire7)))));
  assign wire11 = $signed((8'hb6));
  assign wire12 = wire8[(1'h1):(1'h0)];
  assign wire13 = $unsigned(((($unsigned(wire12) ?
                      (wire9 != wire5) : $signed(wire6)) ^ (wire11 <<< wire12)) != wire8[(2'h2):(1'h0)]));
  assign wire14 = (~^{wire13[(2'h3):(1'h1)],
                      $unsigned($unsigned(wire13[(3'h7):(3'h5)]))});
endmodule
