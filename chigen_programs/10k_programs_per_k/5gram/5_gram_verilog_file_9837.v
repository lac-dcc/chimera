// Seed: 4167880926
module module_0 #(
    parameter id_4 = 32'd33,
    parameter id_7 = 32'd98
) (
    output supply0 id_0,
    output supply1 id_1,
    output supply1 id_2,
    input wor id_3
    , id_14,
    input supply0 _id_4,
    output uwire id_5,
    output tri id_6,
    input tri1 _id_7,
    output tri id_8,
    input supply0 id_9,
    output tri1 id_10,
    output supply0 id_11,
    output uwire id_12
);
  localparam id_15 = 1;
  assign module_1.id_2 = 0;
  assign id_5 = 1 == -1;
  wire [{  id_4  {  1  }  } : id_7] id_16 = id_9;
  assign id_5 = 1'b0 & id_4;
endmodule
module module_1 #(
    parameter id_13 = 32'd4
) (
    output logic id_0,
    input tri0 id_1,
    input supply1 id_2,
    output supply0 id_3,
    input tri id_4,
    output tri id_5,
    input wire id_6,
    output uwire id_7,
    input tri1 id_8
    , id_12,
    input tri0 id_9,
    output tri0 id_10
);
  parameter id_13 = 1;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_4,
      id_13,
      id_7,
      id_7,
      id_13,
      id_10,
      id_8,
      id_5,
      id_10,
      id_3
  );
  parameter id_14 = id_13;
  wire id_15;
  always @(1 or posedge id_15) begin : LABEL_0
    id_0 = id_13;
  end
  wire [-1 : id_13] id_16;
endmodule
