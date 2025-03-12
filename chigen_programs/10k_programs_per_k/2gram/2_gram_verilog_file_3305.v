// Seed: 629977649
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  wire id_5;
  logic [7:0] id_6;
  assign id_6[1] = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd29
) (
    input tri0 id_0,
    input wire id_1,
    input tri1 _id_2,
    input uwire id_3,
    input tri1 id_4,
    input supply0 id_5,
    input uwire id_6,
    input tri id_7,
    output logic id_8,
    input supply1 id_9,
    input supply1 id_10,
    input wand id_11
);
  always_ff begin : LABEL_0
    id_8 <= id_5;
  end
  bufif0 primCall (id_8, id_7, id_10);
  initial
    @(negedge id_3) begin : LABEL_1
      id_8 <= id_4;
      id_8 = "";
    end
  logic id_13 = id_3;
  assign id_8 = id_7;
  struct packed {
    logic id_14;
    logic id_15;
  } [1 : id_2] id_16;
  module_0 modCall_1 (
      id_14,
      id_16,
      id_15,
      id_14
  );
  logic id_17;
  ;
endmodule
