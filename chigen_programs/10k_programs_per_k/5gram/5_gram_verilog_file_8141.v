// Seed: 475308463
module module_0;
  id_1(
      .id_0(id_2), .id_1(1), .id_2(id_3), .id_3(id_2), .id_4(1), .id_5(1), .id_6(1)
  );
  assign module_2.type_13 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2
);
  initial begin : LABEL_0
    id_4 <= 1;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    output supply1 id_0,
    input wire id_1,
    output supply1 id_2,
    input supply0 id_3,
    input logic id_4,
    output tri1 id_5,
    input uwire id_6
);
  task automatic id_8;
    input id_9;
    if (id_4 * id_8 - id_3) begin : LABEL_0
      id_9 <= id_4;
    end
  endtask
  and primCall (id_0, id_1, id_3, id_4, id_6, id_8, id_9);
  module_0 modCall_1 ();
  wire id_10;
endmodule
