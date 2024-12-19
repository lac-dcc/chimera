// Seed: 768661277
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
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final begin : LABEL_0
    for (id_1 = 1; 1; id_4 = 1) begin : LABEL_0
      begin : LABEL_0
        id_2 <= #1 1;
        `define pp_8 0
        if (1) begin : LABEL_0
          id_2 <= id_5++;
        end
      end
    end
  end
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_3,
      id_6,
      id_1
  );
endmodule
