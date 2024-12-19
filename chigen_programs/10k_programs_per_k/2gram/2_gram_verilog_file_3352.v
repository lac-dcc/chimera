// Seed: 654933445
module module_0 (
    input uwire id_0,
    input wor id_1,
    input tri0 id_2,
    output tri1 id_3,
    output supply1 id_4,
    input tri id_5,
    input wor id_6,
    input wor id_7,
    input uwire id_8,
    input wire id_9,
    input tri id_10
    , id_17,
    output tri id_11,
    input wand id_12,
    input wire id_13,
    input tri1 id_14,
    output uwire id_15
);
  assign id_4 = id_2;
  id_18(
      .id_0(id_1), .id_1(1), .id_2(), .id_3(1), .id_4
  );
  assign id_4 = 1;
  always id_11 = 1;
  wire id_19;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    output tri id_2,
    input tri id_3,
    input supply0 id_4,
    output uwire id_5,
    output wand id_6,
    input supply0 id_7,
    output logic id_8,
    input wor id_9
);
  or primCall (id_6, id_9, id_1);
  module_0 modCall_1 (
      id_7,
      id_3,
      id_1,
      id_5,
      id_5,
      id_3,
      id_7,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_3,
      id_1,
      id_9,
      id_6
  );
  assign modCall_1.type_9 = 0;
  task id_11;
    begin : LABEL_0
      id_8 <= 1;
    end
  endtask
endmodule
