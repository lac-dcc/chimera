// Seed: 1139662247
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output uwire id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri0 id_5,
    output tri id_6,
    input tri id_7,
    output tri1 id_8
);
  wire id_10, id_11, id_12;
  wire id_13;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    output logic id_2,
    output wire id_3
);
  task id_5;
    fork
      id_0 <= 1'b0 - 1;
      #1 id_2 = id_5;
      $display;
    join
  endtask
  module_0 modCall_1 (
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3
  );
  initial begin : LABEL_0
    #1;
    id_5 <= id_1 * id_1 - (1);
  end
endmodule
