// Seed: 2092100944
module module_0 (
    input wire id_0,
    output tri1 id_1,
    input tri1 void id_2,
    output wor id_3,
    output wire id_4,
    input wand id_5,
    input uwire id_6,
    output wire id_7,
    output uwire id_8,
    input tri1 id_9,
    input tri id_10,
    input tri0 id_11,
    input supply0 id_12,
    input wand id_13,
    input uwire id_14,
    input tri1 id_15,
    output wire id_16,
    input supply1 id_17
);
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    output supply1 id_5,
    input wand id_6,
    input wand id_7,
    input tri id_8,
    input uwire id_9,
    output wand id_10,
    input tri0 id_11,
    input supply0 id_12,
    output supply0 id_13,
    output supply1 id_14,
    output tri1 id_15,
    input supply0 id_16
);
  wand  id_18;
  uwire id_19;
  assign id_14 = id_18 && -1;
  wire id_20;
  wire id_21;
  assign id_18 = -1;
  module_0 modCall_1 (
      id_0,
      id_15,
      id_7,
      id_5,
      id_2,
      id_3,
      id_6,
      id_15,
      id_14,
      id_16,
      id_12,
      id_12,
      id_9,
      id_4,
      id_0,
      id_7,
      id_10,
      id_7
  );
  assign modCall_1.id_0 = 0;
  task id_22;
    id_19 = -(1'b0 << id_19);
  endtask
  id_23(
      .id_0(id_0), .id_1(1'b0), .id_2(id_5), .id_3(1 == (-1'd0 - 1))
  );
  generate
    id_24(
        1, 1
    );
  endgenerate
  assign id_15 = -1;
  wire id_25;
endmodule
