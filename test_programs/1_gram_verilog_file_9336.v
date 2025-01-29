// Seed: 1887546482
module module_0 (
    input tri id_0,
    input uwire id_1,
    input uwire id_2,
    input tri id_3,
    input tri0 id_4,
    id_15,
    output tri1 id_5,
    input tri0 id_6,
    input wire id_7,
    output supply1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    output supply0 id_11,
    input wor id_12,
    output wire id_13
);
  assign id_13 = id_0 - id_7;
  wire id_16;
  always
  fork
    $display((id_7));
  join
  wire id_17;
  wire id_18;
  assign id_5 = id_12;
  assign module_1.id_6 = 0;
  tri0 id_19 = (id_10);
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input wire id_2,
    output wire id_3,
    output logic id_4,
    input wor id_5,
    input uwire id_6
);
  wire id_8;
  initial id_4 <= 'h0;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_3,
      id_5,
      id_6,
      id_3,
      id_3,
      id_0,
      id_3,
      id_5,
      id_3
  );
endmodule
