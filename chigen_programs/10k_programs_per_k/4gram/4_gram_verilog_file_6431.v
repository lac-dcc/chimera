// Seed: 156810143
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_3 ? 1 & 1 : 1'd0;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd97,
    parameter id_6 = 32'd53
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  integer id_4;
  defparam id_5.id_6 = 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_3
  );
  wire id_7;
endmodule
module module_2 ();
  assign id_1 = id_1;
  assign module_3.type_3 = 0;
  assign id_1 = id_2;
endmodule
module module_3 (
    input tri0 id_0,
    input tri1 id_1,
    output tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    output wand id_6,
    output logic id_7,
    output logic id_8,
    input tri0 id_9,
    input uwire id_10,
    input tri1 id_11,
    input wire id_12,
    output tri id_13,
    output tri1 id_14,
    input logic id_15,
    input tri id_16,
    input wand id_17
);
  always @(posedge 1) begin : LABEL_0
    if (id_4) begin : LABEL_0
      id_7 = #id_19  !id_0 - id_3;
      id_8 <= id_15;
      id_6 = 1;
    end else if (id_0 - 1 !=? 1) id_7 <= #id_12 id_15 >= 1'h0;
    else begin : LABEL_0
      id_7 <= 1'h0;
    end
  end
  module_2 modCall_1 ();
endmodule
