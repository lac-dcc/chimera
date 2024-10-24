module top
#(parameter param27 = {(({(8'hbf), (~&(8'hb4))} > (((8'hbd) ? (8'hb1) : (8'haf)) ? ((8'hbd) >>> (8'ha8)) : ((8'hb4) ? (7'h43) : (8'ha2)))) ? (~^({(8'ha0), (8'haf)} || ((8'hb2) ? (8'hbf) : (8'hb2)))) : ((((8'hab) | (8'ha6)) ? ((8'ha8) ? (8'hab) : (8'ha4)) : (-(8'hac))) ? ({(8'hbf)} ? ((8'hbb) >> (8'hbf)) : (8'ha5)) : (~^(8'h9c)))), (((~((8'ha1) >= (8'hae))) > {(|(8'ha0))}) || (8'ha3))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  assign y = {wire23,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg26,
                 reg25,
                 reg24,
                 reg22,
                 reg21,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $signed($unsigned($signed(wire2[(4'ha):(3'h5)])));
  assign wire5 = wire4;
  assign wire6 = (wire4 ?
                     $signed(($signed(wire2[(2'h2):(1'h0)]) ^ wire1[(2'h3):(2'h2)])) : (~&wire3));
  assign wire7 = $unsigned($unsigned(wire2));
  assign wire8 = $unsigned((^(((wire1 * wire7) && {wire3}) & {wire5[(5'h12):(5'h11)]})));
  assign wire9 = $signed({wire4});
  always
    @(posedge clk) begin
      if (($signed((+wire2[(3'h5):(1'h1)])) || ((8'ha6) < $unsigned({wire9,
          $unsigned(wire4)}))))
        begin
          if ((^~$unsigned((~&wire1))))
            begin
              reg10 <= ($unsigned($signed(wire3)) ?
                  wire4[(1'h0):(1'h0)] : wire7);
              reg11 <= (wire4 <<< (~{(!wire0), $signed(wire1[(1'h0):(1'h0)])}));
              reg12 <= (~^$unsigned(wire5));
              reg13 <= (8'h9d);
            end
          else
            begin
              reg10 <= {$signed($signed((^(wire7 ? wire5 : wire6))))};
              reg11 <= (|((~|((-wire9) ? wire6 : $signed(wire5))) ?
                  $signed(($unsigned(wire1) != $unsigned(wire1))) : $signed(reg13)));
              reg12 <= (wire5[(3'h6):(2'h3)] << $unsigned((wire5 & reg13)));
            end
          reg14 <= reg10;
        end
      else
        begin
          reg10 <= wire1;
          reg11 <= $unsigned(wire6[(3'h5):(2'h2)]);
          reg12 <= reg11[(2'h2):(1'h0)];
        end
    end
  assign wire15 = $unsigned($unsigned({(reg14 ? wire1 : $unsigned(reg10)),
                      (((8'h9f) ? reg11 : wire1) ^~ $signed((8'ha5)))}));
  assign wire16 = wire6;
  assign wire17 = ((8'hae) == reg12[(2'h3):(1'h1)]);
  assign wire18 = (~&{($unsigned($signed(wire3)) ^ (^wire7[(1'h0):(1'h0)])),
                      (!{(wire15 < reg12)})});
  assign wire19 = ({{{(~&(8'hb6)), (wire16 << wire16)}}} >= wire1);
  assign wire20 = {wire3};
  always
    @(posedge clk) begin
      reg21 <= ($signed(({(reg13 ? wire3 : wire9),
          wire7[(4'h8):(3'h5)]} ^ $signed((wire9 - wire9)))) && wire19[(4'he):(2'h3)]);
      reg22 <= {($unsigned(wire15[(4'h8):(3'h5)]) ?
              {$unsigned(wire15),
                  (!wire19[(3'h6):(2'h2)])} : $unsigned({(reg12 ?
                      reg12 : wire18),
                  (wire15 || wire8)}))};
    end
  assign wire23 = ($signed($unsigned({$signed((8'ha8)),
                      (wire18 & reg10)})) >= (wire4[(3'h4):(3'h4)] && (~$signed(reg12))));
  always
    @(posedge clk) begin
      reg24 <= wire18[(3'h7):(3'h7)];
      reg25 <= reg10;
      reg26 <= $unsigned(wire20[(3'h5):(2'h3)]);
    end
endmodule
