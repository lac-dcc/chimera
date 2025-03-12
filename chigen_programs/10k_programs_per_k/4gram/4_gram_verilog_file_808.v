// Seed: 3457332602
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    input wor id_3,
    output tri1 id_4
);
  wire id_6;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1,
    output wand  id_2,
    output tri1  id_3,
    input  tri0  id_4
);
  assign id_3 = -1;
  generate
    assign id_3 = 1;
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    output logic id_0,
    input tri id_1,
    input tri0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input tri1 id_5,
    input wire id_6,
    output supply0 id_7,
    output logic id_8,
    output wire id_9
);
  logic id_11;
  assign id_9 = id_6;
  final begin : LABEL_0
    id_8 = id_5 == 1;
    id_0 = 1;
    #1 begin : LABEL_1
      #1;
      wait ((-1));
    end
  end
  wire id_12 = id_6;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_2,
      id_5,
      id_9
  );
  assign modCall_1.id_0 = 0;
  wire id_13;
endmodule
