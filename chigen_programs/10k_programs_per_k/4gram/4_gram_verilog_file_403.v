// Seed: 319921305
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output logic id_2,
    input tri0 id_3,
    input logic id_4,
    output logic id_5,
    input logic id_6,
    output supply0 id_7,
    output supply1 id_8,
    input wor id_9,
    output logic id_10
);
  always @* begin : LABEL_0
    if ("") begin : LABEL_0
      if (1) id_5 <= id_4;
      else id_10 <= id_6;
    end else begin : LABEL_0
      id_10 <= 1;
      id_2  <= id_4;
      id_5 = 1 ** 1;
    end
  end
  assign id_8 = 1 ? 1 * id_4 : 1;
  assign module_1.type_2 = 0;
  int id_12 = id_4;
  assign id_8 = id_6 ? id_0 - id_6.id_4 : {id_3{1}};
  wire id_13;
  wire id_14;
  wire id_15;
endmodule
module module_1 (
    input logic id_0,
    input supply0 id_1,
    output logic id_2,
    output wor id_3,
    input logic id_4,
    output uwire id_5,
    output tri0 id_6
);
  id_8(
      .id_0((id_2)), .id_1(1)
  );
  assign id_2 = 1;
  wire id_9;
  wire id_10;
  initial begin : LABEL_0
    id_2 <= id_0;
  end
  wire id_11;
  wire id_12;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_6,
      id_5,
      id_1,
      id_2
  );
endmodule
