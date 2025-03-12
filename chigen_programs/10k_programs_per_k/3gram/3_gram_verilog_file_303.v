// Seed: 4058508547
module module_0 (
    output logic id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    input tri1 id_4
);
  parameter id_6 = 1;
  always id_0 <= "";
  initial begin : LABEL_0
    assume (!1);
    id_0 <= 1;
  end
endmodule
module module_1 (
    input  wand  id_0,
    output wire  id_1,
    output logic id_2,
    input  tri0  id_3
);
  always force id_1.id_3 = id_3;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_2 = 0;
  always #1 begin : LABEL_0
    id_2 = 1;
  end
endmodule
