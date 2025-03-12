// Seed: 747958214
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_11 = 32'd83
) (
    input wand id_0,
    input supply1 id_1,
    output tri id_2,
    input tri0 id_3,
    output uwire id_4,
    output logic id_5
);
  parameter id_7 = 1;
  id_8 :
  assert property (@(posedge id_0) id_0)
  else id_8 <= 1;
  parameter id_9 = id_7;
  and primCall (id_4, id_9, id_1, id_3, id_0, id_8, id_10, id_7);
  for (id_10 = -1; -1; id_8 = -1) begin : LABEL_0
    always begin : LABEL_1
      if (id_9) id_5 = id_0;
    end
  end
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_7,
      id_10
  );
  assign id_2 = -1;
  _id_11 :
  assert property (@(posedge id_9[id_11] or posedge 1) 1)
  else;
endmodule
