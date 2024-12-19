// Seed: 2952534724
module module_0 (
    output uwire id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    input  tri1  id_3,
    input  wor   id_4
);
  logic [7:0] id_6;
  assign id_0 = id_4;
  assign module_0 = id_2;
  assign id_6[{1, 1}] = 1 == 1;
  wire id_7;
  wire id_8;
  wire id_9;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    input supply0 id_2,
    output tri id_3,
    input tri1 id_4,
    input tri id_5,
    output supply0 id_6,
    input supply0 id_7,
    input supply0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_8,
      id_4
  );
  supply1 id_11, id_12, id_13;
  for (id_14 = 1; 1; id_13 = 1) begin : LABEL_0
    if (id_2) begin : LABEL_0
      wire id_15;
    end else begin : LABEL_0
      for (id_16 = 1; 1; id_0 = id_7) begin : LABEL_0
      end
    end
  end
  wire id_17;
  nor primCall (id_3, id_7, id_10, id_2);
endmodule
