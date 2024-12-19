// Seed: 2495752998
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = 1 ? 1'h0 : 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    output logic id_1,
    input  tri   id_2,
    input  tri1  id_3,
    output logic id_4
);
  tri0 id_6 = 1;
  always @* begin : LABEL_0
    if (id_2) begin : LABEL_0
      if (1'd0) #1;
      else assign id_4 = 1;
    end else begin : LABEL_0
      id_6 = id_3;
      wait (1);
      id_0 = id_6 + 1;
      if (id_3) begin : LABEL_0
        id_1 <= 1;
        id_4 <= 1;
      end
    end
  end
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
endmodule
