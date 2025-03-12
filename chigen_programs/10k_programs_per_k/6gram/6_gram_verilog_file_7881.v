// Seed: 2526720693
module module_0 (
    input wand id_0,
    output uwire id_1,
    input supply0 id_2,
    input tri0 id_3,
    output tri id_4,
    output tri1 id_5,
    output tri1 id_6,
    output tri1 id_7,
    input wire id_8,
    output supply1 id_9,
    output tri id_10
);
  assign id_5 = id_0 == id_3;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd98
) (
    input supply0 id_0,
    output tri id_1,
    output wire id_2,
    output wire _id_3,
    input wand id_4,
    input tri1 id_5,
    output wire id_6,
    input tri0 id_7,
    output supply1 id_8
);
  logic [1 : id_3] id_10, id_11, id_12;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_0,
      id_7,
      id_6,
      id_1,
      id_2,
      id_8,
      id_0,
      id_2,
      id_1
  );
  task id_13;
    begin : LABEL_0
      assume (-1);
    end
  endtask
  assign id_8 = id_4;
endmodule
