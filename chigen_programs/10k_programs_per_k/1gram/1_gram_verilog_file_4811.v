// Seed: 2335827402
module module_0 (
    output uwire id_0,
    input  wor   id_1,
    output logic id_2,
    input  tri0  id_3,
    input  tri1  id_4
);
  assign module_1.type_4 = 0;
  generate
    assign id_16 = id_10;
  endgenerate
endmodule
module module_1 (
    input wand id_0,
    inout tri0 id_1,
    input wor id_2,
    input tri id_3,
    input supply0 id_4,
    input wire id_5,
    output wire id_6,
    output wand id_7,
    input uwire id_8,
    input supply0 id_9,
    output uwire id_10,
    input wire id_11,
    input uwire id_12,
    output supply1 id_13,
    input supply1 id_14,
    input tri id_15,
    output tri id_16
    , id_20,
    output wor id_17,
    input supply1 id_18
);
  wire id_21;
  tri0 id_22, id_23, id_24;
  assign id_10 = id_5;
  wire id_25;
  assign id_22 = 1;
  assign id_6  = id_11 === 1'b0;
  assign id_6  = 1;
  or primCall (
      id_1,
      id_5,
      id_3,
      id_21,
      id_9,
      id_2,
      id_18,
      id_11,
      id_4,
      id_23,
      id_14,
      id_22,
      id_26,
      id_24,
      id_0,
      id_25,
      id_15,
      id_12,
      id_20
  );
  id_26(
      .id_0(1), .id_1(1), .id_2(id_18 && 1 == 1)
  );
  module_0 modCall_1 (
      id_17,
      id_18,
      id_7,
      id_9,
      id_8
  );
  wire id_27, id_28;
  wire id_29;
endmodule
