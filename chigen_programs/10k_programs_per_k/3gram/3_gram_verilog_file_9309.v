// Seed: 3592462588
module module_0 (
    input supply1 id_0,
    output logic id_1,
    input tri id_2,
    input wor id_3
);
  final begin : LABEL_0
    if (1 - (1)) begin : LABEL_1
      id_1 = "";
      id_1 = id_0;
    end
  end
endmodule
module module_1 (
    output wire id_0,
    input supply1 id_1,
    input tri id_2,
    output logic id_3,
    input tri1 id_4,
    input wor id_5,
    input tri1 id_6
);
  parameter id_8 = 1;
  uwire id_9 = -1;
  wire  id_10;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_4,
      id_1
  );
  assign modCall_1.id_2 = 0;
  logic id_11;
  ;
  id_12 :
  assert property (@(posedge -1'b0) -1 * -1)
  else begin : LABEL_0
    id_3  = {1, 1, -1};
    id_12 = 1 == id_1;
  end
  parameter id_13 = id_8;
endmodule
