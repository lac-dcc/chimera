// Seed: 4196527372
module module_0 (
    output uwire id_0,
    output tri0 id_1,
    input supply1 id_2,
    input uwire id_3,
    input tri id_4,
    input wand id_5,
    input wor id_6,
    output supply1 id_7,
    output wire id_8,
    output tri0 id_9,
    input tri1 id_10,
    output logic id_11
);
  wire id_13;
  initial begin : LABEL_0
    {1 & id_6} += 1;
    id_11 = 1;
  end
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input tri1 id_2
    , id_11,
    output logic id_3,
    input wand id_4,
    input uwire id_5,
    input tri id_6,
    output tri0 id_7,
    output supply1 id_8,
    output logic id_9
);
  wire id_12;
  ;
  always @(posedge id_6) if (1) id_9 <= 'h0;
  wire id_13;
  ;
  wire id_14;
  always id_3 = #1 -1 ^ -1'b0;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_6,
      id_4,
      id_5,
      id_2,
      id_6,
      id_8,
      id_7,
      id_8,
      id_5,
      id_3
  );
endmodule
