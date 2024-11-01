// Seed: 2750434380
module module_0 #(
    parameter id_18 = 32'd36,
    parameter id_19 = 32'd63
) (
    input tri1 id_0,
    input wor id_1,
    input supply0 id_2,
    output tri1 id_3,
    input tri1 id_4
    , id_14,
    input wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    output wor id_8,
    input wire id_9
    , id_15,
    input uwire id_10,
    input supply0 id_11,
    output tri0 id_12
);
  generate
    for (id_16 = 1 + 1; id_1; id_16 = id_10) begin : id_17
      defparam id_18.id_19 = 1'h0;
    end
  endgenerate
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input tri id_2,
    input tri1 id_3,
    input wor id_4,
    input wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    input wor id_8,
    output uwire id_9
);
  assign id_0 = id_6 < id_3;
  assign id_9 = id_4 ? 1 : id_4;
  initial begin
    assume (id_2);
    $display();
    id_0 = 1'h0 !== 1 / 1'b0;
  end
  module_0(
      id_2, id_6, id_5, id_9, id_5, id_6, id_7, id_1, id_0, id_1, id_1, id_3, id_9
  );
endmodule
