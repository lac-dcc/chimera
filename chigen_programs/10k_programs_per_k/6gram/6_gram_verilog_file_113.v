// Seed: 808677102
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    output tri1  id_0,
    output tri   id_1,
    output wor   id_2,
    output logic id_3
);
  id_5(
      .id_0(1)
  );
  initial
  fork : id_6
    id_3 <= 1;
    #(1'b0);
    #1 $display(1, id_6);
  join
  module_0(
      id_6, id_6, id_6, id_6, id_6, id_6, id_6, id_6, id_6
  );
endmodule
