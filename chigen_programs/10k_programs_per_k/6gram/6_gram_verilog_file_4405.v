// Seed: 152126462
module module_0 #(
    parameter id_4 = 32'd46,
    parameter id_5 = 32'd51
) (
    output logic id_0,
    input tri0 id_1,
    input supply0 id_2
);
  wire _id_4;
  parameter id_5 = 1 == 1;
  wire id_6;
  ;
  logic   id_7;
  integer id_8 = id_4;
  always @(id_5 & -1) begin : LABEL_0
    id_0 = id_5;
  end
  wand id_9;
  assign id_9 = 1;
  defparam id_5.id_5 = 1 == id_5;
  tri0 [1 : id_4] id_10;
  assign module_1.id_4 = 0;
  wire id_11;
  ;
  logic [7:0] id_12;
  logic id_13 = id_13 - 1;
  assign id_10 = id_11 ? id_12[1] : 1;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output logic id_5
);
  always @(1) begin : LABEL_0
    id_5 = id_4#(.id_0(1));
  end
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2
  );
endmodule
