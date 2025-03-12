// Seed: 3781551581
module module_0 (
    output wor id_0,
    output supply0 id_1,
    input supply0 id_2[-1 : -1],
    input uwire id_3,
    input wire id_4,
    input uwire id_5,
    input uwire id_6,
    output tri0 id_7,
    input wand id_8,
    input supply1 id_9,
    input supply1 id_10,
    input wor id_11,
    output tri id_12,
    input supply0 id_13
);
  logic id_15;
  ;
  parameter id_16 = 1;
  logic id_17;
  ;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd76
) (
    input tri1 id_0,
    input tri1 id_1,
    input tri1 _id_2[-1 : id_2],
    input tri0 id_3,
    output logic id_4,
    input tri0 id_5,
    output supply1 id_6,
    input supply0 id_7,
    input wor id_8,
    input tri id_9,
    inout logic id_10,
    output tri id_11,
    input tri0 id_12
);
  final begin : LABEL_0
    for (id_4 = -1; !id_2; id_4 = -1) begin : LABEL_1
      id_10 <= id_9;
      id_4 = 1;
    end
  end
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_5,
      id_1,
      id_5,
      id_5,
      id_6,
      id_1,
      id_0,
      id_0,
      id_1,
      id_11,
      id_7
  );
endmodule
