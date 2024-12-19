// Seed: 96708468
module module_0 (
    input wand id_0,
    output wand id_1,
    input wand id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    input wand id_6,
    input tri id_7
);
  wire id_9;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    output tri1 id_3,
    input wire id_4
    , id_11,
    output tri0 id_5,
    input wand id_6,
    input wand id_7,
    input supply1 id_8,
    inout logic id_9
);
  assign id_11 = 1;
  always @((1 ? 1 : 1)) begin : LABEL_0
    begin : LABEL_0
      if ((id_0)) begin : LABEL_0
        wait (id_7);
        id_9 <= id_9;
      end
    end
  end
  specify
    if (1) (id_12 => id_13) = 1;
    $setup(id_14, posedge id_15, id_8 - 1);
    (id_16 => id_17) = 1;
  endspecify
  module_0 modCall_1 (
      id_6,
      id_5,
      id_2,
      id_0,
      id_1,
      id_4,
      id_8,
      id_1
  );
endmodule
