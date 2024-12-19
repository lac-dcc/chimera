// Seed: 295595991
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input tri id_2,
    output tri1 id_3,
    input tri0 id_4,
    input uwire id_5,
    output tri1 id_6
);
  wire id_8;
  assign id_0 = 1;
  reg id_9, id_10, id_11;
  for (id_12 = id_1; 1; id_10 = 1) begin : LABEL_0
    always id_9 <= "";
  end
endmodule
module module_1 (
    output tri0 id_0,
    input  tri1 id_1
);
  assign id_0 = ~id_1;
  supply1 id_3;
  wire id_4, id_5, id_6, id_7;
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_0
  );
  assign id_0 = id_3;
endmodule
