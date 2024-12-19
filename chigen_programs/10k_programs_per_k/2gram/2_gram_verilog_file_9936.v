// Seed: 4143711504
module module_0;
  wire id_1;
  wire id_2;
  assign module_2.type_13 = 0;
endmodule
module module_1;
  assign id_1 = id_1;
  module_0 modCall_1 ();
  logic [7:0] id_2;
  logic [7:0] id_3;
  initial
    if (id_1[1]) id_1 = id_2;
    else begin : LABEL_0
      id_1 = id_3;
    end
  always_comb begin : LABEL_0
    id_2[1] = id_1;
  end
  assign id_1 = id_2;
endmodule
module module_2 (
    input supply0 id_0,
    output wand id_1,
    input wire id_2,
    input wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    output supply1 id_6,
    input uwire id_7,
    output supply0 id_8,
    input supply0 id_9,
    input tri0 id_10,
    input supply1 id_11,
    output tri0 id_12,
    output wor id_13,
    input wor id_14,
    input wand id_15,
    output uwire id_16,
    output wor id_17,
    input uwire id_18,
    input wire id_19,
    input wand id_20,
    input tri0 id_21
);
  assign id_12 = 1;
  module_0 modCall_1 ();
  id_23(
      .id_0(id_20), .id_1(1'b0), .id_2(1), .id_3(1), .id_4(id_7)
  ); id_24(
      .id_0(id_13), .id_1(id_14), .id_2(id_15), .id_3(1 & ~id_10), .id_4(1 * 1'b0)
  );
  wire id_25;
endmodule
