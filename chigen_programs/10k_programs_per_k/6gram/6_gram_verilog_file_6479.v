// Seed: 1257693318
module module_0 (
    output tri0  id_0,
    input  wand  id_1,
    input  tri   id_2,
    output uwire id_3,
    output tri0  id_4,
    output wor   id_5,
    input  tri0  id_6,
    output uwire id_7,
    output tri0  id_8
);
  assign id_5 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input uwire id_2,
    input tri0 id_3,
    output supply0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output wand id_7
    , id_16,
    input uwire id_8,
    input wand id_9,
    input uwire id_10,
    input tri id_11,
    input tri1 id_12,
    input wand id_13,
    output logic id_14
);
  initial
    #1 begin : LABEL_0
      id_1 = id_5;
      if (id_5) begin : LABEL_0
        if (1) begin : LABEL_0
          wait (id_11);
          id_16 = (1);
        end else id_1 = id_8;
      end
      id_14 = #id_17 1;
      id_1 += id_11;
    end
  wand id_18;
  logic [7:0] id_19;
  assign id_7 = id_11;
  assign id_18 = 1;
  assign id_19[1'b0] = {1 - (1) {1 < id_13}};
  assign id_7 = 1;
  wire id_20;
  logic [7:0] id_21;
  wire id_22;
  always @(posedge 1) force id_16 = id_21[1];
  module_0 modCall_1 (
      id_4,
      id_10,
      id_8,
      id_4,
      id_4,
      id_7,
      id_0,
      id_4,
      id_7
  );
endmodule
