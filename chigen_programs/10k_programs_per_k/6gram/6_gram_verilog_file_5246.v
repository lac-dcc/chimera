// Seed: 3582800916
module module_0 (
    input  tri1  id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output logic id_3
);
  always @({
    "",
    1
  } or id_2)
    case (id_1)
      1: id_3 = -1'b0 | 1;
      1: begin : LABEL_0
        disable id_5;
      end
      default: id_3 = 1;
    endcase
endmodule
module module_1 (
    input tri0 id_0
    , id_7,
    input supply0 id_1,
    input tri1 id_2,
    output tri0 id_3,
    input uwire id_4,
    output logic id_5
);
  initial begin : LABEL_0
    id_5 = id_2;
    if ("") disable id_8;
    else id_7 <= 1;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
