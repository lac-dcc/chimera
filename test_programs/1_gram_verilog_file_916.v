// Seed: 3630163528
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input wor  id_2
);
  wor id_4;
  always begin : LABEL_0
    begin : LABEL_0
      id_5 = id_0;
    end
  end
  wire id_6;
  assign module_1.type_14 = 0;
  wire id_7, id_8 = id_7;
  wire id_9 = id_8, id_10;
endmodule
module module_1 (
    input wor id_0,
    id_7,
    input tri0 id_1,
    input wire id_2,
    input supply0 id_3,
    input tri id_4,
    output logic id_5
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7
  );
  id_8 :
  assert property (@(negedge -1 or id_7.id_1) id_1) id_5 <= -1;
  id_9(
      id_7, -1'b0, 1'b0
  );
  wire id_10, id_11 = id_10, id_12, id_13;
endmodule
