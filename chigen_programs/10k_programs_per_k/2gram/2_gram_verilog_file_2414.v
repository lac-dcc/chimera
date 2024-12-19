// Seed: 2474628323
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
macromodule module_2 (
    output wand id_0,
    input wire id_1,
    output tri id_2,
    input uwire id_3,
    input uwire id_4,
    output tri1 id_5,
    input wor id_6,
    output uwire id_7,
    input uwire id_8,
    input wand id_9,
    output supply1 id_10,
    output supply1 id_11
);
  specify
    $width(id_13, id_3);
    (posedge id_14 => (id_15 -: 1)) = (id_1  : 1  : 1, 1'h0 : id_9  : 1);
    specparam id_16 = $display(1'b0);
    (id_17 => id_18) = (id_6  : 1  : id_18, 1);
    (id_19 *> id_20) = (1'b0, -1);
    (id_21 => id_22) = 1;
    (id_23 => id_24) = (1, 1  : id_22  : id_16);
  endspecify
  always #1;
  assign id_23 = 1;
endmodule
module module_3 (
    input uwire id_0,
    output wor id_1,
    input tri0 id_2,
    input tri id_3,
    output tri1 id_4,
    output tri id_5,
    input tri1 id_6,
    input wor id_7,
    input tri id_8,
    input tri1 id_9,
    input uwire id_10,
    input wor id_11,
    input supply1 id_12,
    input tri1 id_13,
    input tri1 id_14,
    input tri id_15#(
        .id_17(1),
        .id_18(1),
        .id_19(1)
    )
);
  id_20(
      .id_0(1'b0), .id_1(), .id_2(1), .id_3(1 - id_14 + id_1)
  );
  module_2 modCall_1 (
      id_5,
      id_11,
      id_5,
      id_13,
      id_6,
      id_5,
      id_6,
      id_5,
      id_15,
      id_9,
      id_5,
      id_5
  );
  assign modCall_1.id_23 = 0;
endmodule
