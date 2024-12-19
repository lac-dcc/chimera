// Seed: 357550003
module module_0;
  id_1(
      .id_0(id_2), .id_1(1)
  ); id_3(
      .id_0(id_1), .id_1(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = id_2;
  module_0 modCall_1 ();
endmodule
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input tri sample,
    input wor id_4,
    input tri1 id_5,
    input tri id_6,
    input wand id_7,
    input wand id_8,
    output supply1 module_2,
    output supply0 id_10,
    input wor id_11,
    output wire id_12,
    input wand id_13,
    output tri id_14,
    input uwire id_15,
    output uwire id_16,
    input wor id_17,
    input supply1 id_18,
    input wand id_19,
    output wire id_20,
    input wand id_21
);
  assign id_10 = 1'b0;
  assign module_3.type_6 = 0;
endmodule
module module_3 (
    input tri0 id_0,
    input uwire id_1,
    input wand id_2,
    input wire id_3,
    input supply0 id_4
    , id_17,
    output logic id_5,
    output uwire id_6,
    input tri id_7,
    input supply1 id_8,
    input tri0 id_9,
    input tri1 id_10,
    input wand id_11,
    output uwire id_12
    , id_18,
    output wand id_13,
    input supply0 id_14,
    output uwire id_15
);
  always begin : LABEL_0
    if (1) id_5 <= 1;
    id_12 = id_11 == id_8 - 1'b0;
  end
  wire id_19 = id_4;
  module_2 modCall_1 (
      id_4,
      id_19,
      id_1,
      id_9,
      id_1,
      id_3,
      id_4,
      id_9,
      id_2,
      id_19,
      id_19,
      id_19,
      id_13,
      id_10,
      id_6,
      id_10,
      id_6,
      id_7,
      id_11,
      id_8,
      id_6,
      id_19
  );
  assign id_15 = 1;
  wire id_20;
endmodule
