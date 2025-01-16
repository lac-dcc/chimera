// Seed: 1860635001
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 #(
    parameter id_6 = 32'd11,
    parameter id_7 = 32'd22,
    parameter id_8 = 32'd28
) (
    input supply1 id_0,
    output tri1 id_1,
    input supply0 id_2
);
  supply1 id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  wire id_5;
  buf primCall (id_1, id_0);
  generate
    begin : LABEL_0
      defparam id_6.id_7 = id_4 * 1, id_8 = id_8;
    end
    logic [7:0][-1]
        id_9 (
            .id_0(id_1),
            .id_1(id_4)
        ),
        id_10;
    begin : LABEL_0
      wire id_11;
    end
  endgenerate
endmodule
