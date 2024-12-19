// Seed: 2598143934
module module_0 (
    input  wire id_0,
    input  wor  id_1,
    input  tri0 id_2,
    output wand id_3,
    output tri0 id_4
);
  always @(posedge id_2) begin : LABEL_0
    if (1 && id_1) begin : LABEL_0
      fork
        #1;
        repeat (1 - 1) begin : LABEL_0
          id_4 = id_1;
          id_4 = id_2 - 1;
        end
      join
      fork
        id_6(1);
        id_7(1);
      join
    end
  end
  always @(id_1) begin : LABEL_0
    fork
      id_8(id_2);
      $display(id_1,, 1);
    join
  end
  wire id_9;
  supply0 id_10 = 1;
endmodule
module module_0 (
    output supply1 id_0,
    input tri0 id_1
    , id_12,
    output wor id_2,
    input wor id_3,
    input supply1 id_4,
    input wire id_5,
    output tri1 module_1,
    input uwire id_7
    , id_13,
    output wor id_8,
    output tri id_9,
    output supply1 id_10
);
  assign id_12 = 1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_8,
      id_0
  );
  assign modCall_1.type_0 = 0;
endmodule
