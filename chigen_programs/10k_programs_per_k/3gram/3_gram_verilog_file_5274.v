// Seed: 1669923685
module module_0 (
    output tri id_0,
    input wand id_1,
    input wire id_2,
    output uwire id_3,
    output logic id_4,
    input uwire id_5,
    input wor id_6
    , id_12,
    output wor id_7,
    input wor id_8,
    input supply0 id_9,
    output supply1 id_10
    , id_13
);
  always #1 begin : LABEL_0
    id_4 <= -1'b0;
  end
  assign module_1.id_3 = 0;
  wire [1 : -1 'b0] id_14;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    output tri id_2,
    input supply0 id_3,
    input tri id_4,
    input uwire id_5,
    input supply1 id_6,
    input wor id_7
);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_2,
      id_0,
      id_4,
      id_5,
      id_2,
      id_3,
      id_3,
      id_2
  );
  always id_0 <= id_4 && id_3 & id_4;
  genvar id_9;
  logic id_10 = id_6, id_11;
endmodule
