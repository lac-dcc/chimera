// Seed: 937025156
module module_0 (
    input wire id_0,
    input tri0 id_1,
    input tri1 id_2,
    input supply0 id_3,
    output tri1 id_4,
    output wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    input tri0 id_8,
    input wor id_9
);
  assign id_5 = $realtime;
endmodule
module module_1 #(
    parameter id_5 = 32'd15
) (
    output logic id_0,
    input tri id_1,
    input tri0 id_2,
    output tri0 id_3,
    input wand id_4,
    input wor _id_5,
    input tri1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    output tri1 id_9,
    input wire id_10,
    output logic id_11
);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_7,
      id_9,
      id_9,
      id_10,
      id_6,
      id_2,
      id_10
  );
  assign modCall_1.id_0 = 0;
  wire [id_5 : 1  <  1] id_13;
  initial begin : LABEL_0
    begin : LABEL_1
      id_11 = id_7;
    end
    if (-1) id_0 <= id_5;
  end
endmodule
