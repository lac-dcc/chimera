// Seed: 1511768537
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri1 id_4,
    input supply0 id_5,
    input wand id_6,
    input uwire id_7,
    input tri1 id_8,
    output uwire id_9,
    output supply1 id_10,
    output tri1 id_11
);
  always @(negedge id_3) begin : LABEL_0
    $clog2(10);
    ;
  end
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output logic id_1,
    input supply1 id_2,
    input tri id_3,
    input tri id_4,
    input supply1 id_5,
    output tri0 id_6,
    output wor id_7,
    output wire id_8,
    output uwire id_9
);
  wire id_11;
  always
    while (1'b0) begin : LABEL_0
      id_1 = 1;
    end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_0,
      id_2,
      id_4,
      id_2,
      id_4,
      id_0,
      id_3,
      id_6,
      id_9,
      id_8
  );
endmodule
