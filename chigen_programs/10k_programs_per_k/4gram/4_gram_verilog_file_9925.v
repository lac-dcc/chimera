// Seed: 1873238584
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_9;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1
);
  always_comb @(*)
    for (id_3 = id_0; 1; id_3 += id_1) begin : LABEL_0
      if (id_1 !== 1) disable id_4;
      else id_3 <= {id_0 - 1, 1};
    end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
