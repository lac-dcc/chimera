// Seed: 843642022
module module_0 (
    output logic id_0,
    input  wand  id_1
);
  always @* begin : LABEL_0
    id_0 <= id_1;
    id_0 <= -1;
  end
endmodule
module module_1 (
    input wand id_0,
    input wand id_1,
    output supply1 id_2,
    output logic id_3,
    input uwire id_4,
    input tri id_5,
    input tri0 id_6,
    input uwire id_7,
    input supply0 id_8,
    inout wor id_9
);
  always_ff @(posedge !id_8) id_3 = id_4;
  module_0 modCall_1 (
      id_3,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
