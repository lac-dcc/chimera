// Seed: 1553623394
module module_0 (
    input supply1 id_0,
    id_7,
    input supply0 id_1,
    input wire id_2,
    output wire id_3,
    input uwire id_4,
    input tri0 id_5
);
  wire id_8;
  wor  id_9 = {id_1 << 1, id_2, 1, -1};
  always id_3 = -1'b0;
  id_10(
      -1, 1
  );
  wire id_11, id_12;
  assign module_1.id_2 = 0;
  wire id_13, id_14;
  id_15(
      .id_0(id_4)
  );
  localparam integer id_16 = id_4 !== -1'b0;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    output wire  id_2
);
  always begin : LABEL_0
    id_1 <= -1;
  end
  wire id_4;
  initial id_2 = 1;
  if (id_4) id_5(id_2);
  else begin : LABEL_0
    genvar id_6;
  end
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0
  );
endmodule
