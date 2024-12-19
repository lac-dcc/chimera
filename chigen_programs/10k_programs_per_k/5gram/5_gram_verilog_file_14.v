// Seed: 2115604802
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply1 id_7, id_8 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @((id_4), negedge id_4 - id_2) begin : LABEL_0
    if (1) begin : LABEL_0
      `define pp_6 0
      assume (id_4);
      id_2 <= 1;
      if (id_1) begin : LABEL_0
        if (id_2) id_2 <= "";
      end else `pp_6[1][1!=?1 : `pp_6] <= id_3;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
