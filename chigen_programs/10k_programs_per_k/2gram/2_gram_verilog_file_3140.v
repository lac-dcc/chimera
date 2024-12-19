// Seed: 404882776
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  pmos (1, 1, (id_1 == 1'b0), id_1, id_2, id_2);
  id_3(
      1, 1 <-> id_2
  );
  assign id_1 = id_2.id_3;
  assign id_3 = id_2;
  id_4(
      .id_0((id_3)), .id_1(id_2 - 1 & id_3), .id_2(1 - id_1), .id_3(1'b0), .id_4()
  );
  wire id_5;
  tri1  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  =  1  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ;
  assign id_3 = id_16 - $display;
  wire id_24;
endmodule
module module_1 (
    input logic id_0,
    output wire id_1,
    output wire id_2,
    output tri0 id_3,
    output supply0 id_4,
    output logic id_5,
    input tri1 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_8
  );
  assign modCall_1.id_23 = 0;
  always_comb id_5 <= id_0;
  xor primCall (id_5, id_0, id_6, id_8);
endmodule
