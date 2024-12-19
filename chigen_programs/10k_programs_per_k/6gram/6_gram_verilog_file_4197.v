// Seed: 541411917
module module_0 (
    input tri id_0,
    output supply0 id_1,
    output supply1 id_2,
    input supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    output wor id_7
);
  wire id_9;
  wire id_10;
  assign module_1.id_2 = 0;
  id_11(
      .id_0(id_3), .id_1(1'd0)
  );
  wire id_12;
  assign id_9 = id_9;
endmodule
module module_1 (
    output supply1 id_0,
    output tri1 id_1,
    input tri1 id_2,
    input wire id_3,
    input wire id_4,
    output logic id_5
);
  initial begin : LABEL_0
    @(negedge 1);
    id_1 = 1;
    wait (id_3 != 1);
    id_5 <= 1;
  end
  nor primCall (id_5, id_3, id_2);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_3,
      id_2,
      id_3,
      id_4,
      id_0
  );
endmodule
