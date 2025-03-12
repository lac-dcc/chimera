// Seed: 3783369796
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output logic id_2,
    input tri id_3,
    input supply0 id_4,
    input tri0 id_5,
    input wand id_6,
    input tri0 id_7,
    input supply1 id_8,
    output supply1 id_9
);
  id_11 :
  assert property (@(posedge 1 - id_7) id_11 ? 1 && 1 : id_8)
  else begin : LABEL_0
    if (1) id_2 <= id_7;
  end
  final begin : LABEL_1
    id_11 <= id_8;
  end
  parameter id_12 = -1'b0;
  module_0 modCall_1 (
      id_12,
      id_12
  );
endmodule
