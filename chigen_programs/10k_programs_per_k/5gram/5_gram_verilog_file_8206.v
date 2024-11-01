// Seed: 11738437
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri0 id_2,
    input tri1 id_3,
    output wand id_4,
    output wor id_5,
    input tri0 id_6,
    input tri1 id_7,
    output wire id_8,
    output supply0 id_9,
    input tri0 id_10,
    output supply1 id_11
);
  wire id_13;
  wire id_14;
  assign id_8 = 1;
  assign id_4 = (1);
  uwire id_15 = 1;
  wire  id_16;
  wire  id_17;
  wire  id_18;
  wire  id_19;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    input uwire id_2,
    input wand id_3,
    output tri1 id_4,
    output wor id_5,
    input uwire id_6,
    input wand id_7,
    input wor id_8,
    output supply0 id_9,
    input wand id_10
);
  wor  id_12;
  tri  id_13;
  wire id_14;
  generate
    for (id_15 = 1'b0; id_15; ++id_13) begin : id_16
      assign id_0 = id_12 == id_7 ? id_10 : 1'h0;
    end
  endgenerate
  module_0(
      id_8, id_6, id_7, id_6, id_9, id_4, id_7, id_8, id_4, id_5, id_1, id_4
  );
  wire id_17;
endmodule
