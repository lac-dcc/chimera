// Seed: 4041341818
module module_0 (
    output wand id_0,
    input tri id_1,
    input wor id_2,
    input uwire id_3,
    input wor sample,
    input uwire id_5,
    input uwire id_6,
    input wire id_7,
    input wor id_8,
    output supply0 module_0,
    input supply1 id_10,
    input wand id_11,
    output supply1 id_12
);
  always @(id_4 or posedge 1) begin : LABEL_0
    wait (id_8 == 1'b0);
    id_14(1);
    #1 id_0 = 1'b0;
    id_12 = id_1;
    fork
      #1;
    join
  end
  assign module_1.id_12 = 0;
  supply0 id_15;
  supply1 id_16;
  final $display(id_10, id_16, id_7, id_15);
endmodule
module module_1 (
    input uwire id_0,
    output uwire id_1,
    input tri id_2,
    input wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input tri id_8,
    input tri0 id_9,
    input tri1 id_10,
    input tri0 id_11,
    output tri0 id_12
);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_8,
      id_5,
      id_11,
      id_9,
      id_7,
      id_10,
      id_10,
      id_1,
      id_5,
      id_0,
      id_12
  );
endmodule
