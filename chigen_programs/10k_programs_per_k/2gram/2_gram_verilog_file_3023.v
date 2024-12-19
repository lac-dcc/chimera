// Seed: 3371519082
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_5;
  assign module_2.type_0 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    output wire id_0,
    input supply1 id_1,
    input supply1 id_2
);
  if (id_1) begin : LABEL_0
    id_4 :
    assert property (@(1 or 1) 1)
    else;
  end
  supply1 id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  logic [7:0] id_6;
  id_7(
      .id_0(id_0), .id_1(1)
  );
  assign id_6[1] = {(1), id_5, 1'b0};
  wire id_8;
  wire id_9;
  nor primCall (id_0, id_1, id_2, id_4);
endmodule
