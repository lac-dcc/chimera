// Seed: 3734110456
module module_0 (
    id_1
);
  inout wire id_1;
  assign module_1.id_13 = 0;
  logic id_2 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd29,
    parameter id_4 = 32'd73,
    parameter id_5 = 32'd21
) (
    input supply0 id_0,
    output supply1 _id_1,
    output logic id_2,
    output logic id_3,
    input tri0 _id_4,
    input tri0 _id_5,
    output logic id_6,
    input tri1 id_7,
    output tri0 id_8,
    input tri id_9,
    input tri id_10,
    output logic id_11,
    output supply1 id_12,
    output tri0 id_13,
    output logic id_14[{  id_5  }  &&  -1 : id_1]
);
  always_ff begin : LABEL_0
    id_2 <= -1;
    if (1) id_14 = id_7;
    begin : LABEL_1
      if (1) id_14 = -1;
      else if (-1) id_6 <= id_9;
      else $signed(42);
      ;
    end
    fork
      id_3  = id_10 ? "" : -1'b0;
      id_11 = -1;
    join_any
  end
  assign id_13 = id_0;
  assign id_13 = id_9 - id_4;
  assign id_6  = -1;
  wire [id_4 : 1] id_16;
  module_0 modCall_1 (id_16);
endmodule
