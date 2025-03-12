// Seed: 1719295711
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input wand id_2,
    input wand id_3,
    input supply0 id_4
);
  tri1 id_6 = id_1 | id_3 | id_4;
  assign id_6 = -1;
  assign id_6 = -1 - id_3;
  wire id_7;
  parameter id_8 = 1 ? 1 : 1;
  assign module_1.id_5 = 0;
  wire id_9;
  assign id_0 = id_2;
  logic id_10;
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd26,
    parameter id_3  = 32'd72
) (
    input uwire id_0
    , id_12,
    input wor id_1,
    input uwire id_2,
    input tri _id_3,
    input wor id_4,
    input uwire id_5,
    output uwire id_6,
    input uwire id_7,
    output supply0 id_8,
    input tri id_9,
    output logic id_10
);
  _id_13 :
  assert property (@(posedge 1) -1)
  else id_10 <= id_12;
  parameter id_14 = -1;
  logic id_15;
  assign id_12[id_3 : id_13] = id_3 - id_9 & id_7;
  parameter id_16 = id_14;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_5,
      id_9,
      id_5
  );
endmodule
