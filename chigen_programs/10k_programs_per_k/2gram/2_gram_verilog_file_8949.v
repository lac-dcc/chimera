// Seed: 1779422589
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1
);
  inout supply0 id_1;
  nor primCall (id_1, id_7, id_5, id_3, id_2, id_4);
  reg id_2, id_3, id_4, id_5, id_6, id_7;
  wire id_8;
  always begin : LABEL_0
    for (id_1 = 1; -1'b0; id_7 = 1) @(-1) id_7 = -1;
    id_3 = id_2;
    @(-1'h0 - 1 or posedge id_7);
    id_4 = id_1;
    id_3 <= id_6;
  end
  module_0 modCall_1 (
      id_8,
      id_1,
      id_1,
      id_1,
      id_1,
      id_8,
      id_8,
      id_1,
      id_8,
      id_1,
      id_1,
      id_8
  );
endmodule
