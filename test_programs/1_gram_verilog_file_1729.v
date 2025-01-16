// Seed: 1851745437
module module_0 (
    input  uwire id_0,
    input  wand  id_1,
    input  tri   id_2,
    input  tri1  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    output wand  id_6,
    input  uwire id_7,
    input  tri   id_8,
    input  tri1  id_9
);
  if (id_8) assign id_6 = id_2;
  else begin : LABEL_0
    begin : LABEL_0
      logic [7:0] id_11;
      begin : LABEL_0
        begin : LABEL_0
          wire id_12;
          assign id_6 = id_5 * -1;
          wire id_13;
          assign id_11 = |id_1;
          supply1 id_14;
          assign id_11[-1] = id_14 - -1;
        end
        wand id_15 = -1;
        localparam id_16 = 1'b0;
      end
    end
    begin : LABEL_0
      wire id_17;
    end
  end
  assign module_1.id_0 = 0;
  wire id_18;
endmodule
module module_1 (
    output wand id_0,
    input wor id_1,
    input tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input tri0 id_6,
    output tri1 id_7,
    input wire id_8,
    output supply0 id_9,
    id_19,
    output tri id_10,
    output tri1 id_11,
    output uwire id_12,
    input wire id_13,
    input wand id_14,
    input tri0 id_15,
    input tri id_16,
    id_20,
    output wor id_17
);
  wire id_21, id_22;
  module_0 modCall_1 (
      id_3,
      id_16,
      id_1,
      id_2,
      id_14,
      id_2,
      id_0,
      id_3,
      id_2,
      id_13
  );
endmodule
