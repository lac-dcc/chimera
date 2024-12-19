// Seed: 3370460899
module module_0 (
    output logic id_0,
    output tri0 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output supply1 id_4,
    output tri0 id_5,
    output tri0 id_6
);
  always @(id_3 or posedge 1'b0)
    if (1'h0) id_0 <= #id_3 1;
    else begin : LABEL_0
      forever id_0 = id_3 - 1 ^ id_3 == id_3;
    end
  wire id_8 = id_3;
  wire id_9;
  wire id_10, id_11;
  initial begin : LABEL_0
    if (1) assert (1 >= 1);
  end
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    input  tri   id_0,
    input  tri0  id_1,
    output wire  id_2,
    input  wand  id_3,
    input  wor   id_4,
    input  wor   id_5,
    output logic id_6,
    input  wire  id_7
);
  wire id_9;
  always @(posedge 1) id_6 <= 1;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  wor id_10;
  id_11(
      .id_0(id_7), .id_1(1 - id_10), .id_2(id_4)
  );
  assign id_6 = 1;
endmodule
