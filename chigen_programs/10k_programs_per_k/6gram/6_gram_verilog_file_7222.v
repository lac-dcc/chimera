// Seed: 2724064364
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output logic id_2
);
  assign id_2 = -1 * id_0;
  always @(id_0) begin : LABEL_0
    id_2 = 1;
  end
endmodule
module module_1 (
    output logic id_0,
    output tri1  id_1
    , id_7,
    input  wand  id_2,
    input  uwire id_3,
    input  tri0  id_4,
    output wor   id_5
);
  always @(1 or posedge 1) begin : LABEL_0
    id_0 = id_7;
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0
  );
endmodule
module module_2 (
    input supply1 id_0,
    output wor id_1,
    input tri id_2,
    input wor id_3,
    output wor id_4,
    output uwire id_5,
    input supply1 id_6,
    input tri id_7,
    input wand id_8,
    input supply1 id_9,
    output tri id_10,
    input tri1 id_11,
    input tri0 id_12
    , id_15,
    input wand id_13
);
  wire id_16;
endmodule
module module_3 #(
    parameter id_3 = 32'd72,
    parameter id_8 = 32'd26
) (
    input tri0 id_0,
    input tri id_1,
    input wire id_2,
    output wire _id_3,
    output wor id_4,
    input supply1 id_5,
    output tri id_6,
    output wor id_7
    , id_10,
    output uwire _id_8
);
  wire id_11;
  struct packed {logic [1 : -1  ==  id_8] id_12;} [~  (  1  )  ==  id_3 : -1 'h0] id_13;
  ;
  module_2 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_5,
      id_7,
      id_4,
      id_0,
      id_0,
      id_0,
      id_0,
      id_7,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_5 = 0;
  assign id_4 = $clog2(78);
  ;
endmodule
