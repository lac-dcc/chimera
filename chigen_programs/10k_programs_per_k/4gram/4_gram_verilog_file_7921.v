// Seed: 2474074180
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    output wire id_2,
    input wire id_3,
    output supply0 id_4
);
  localparam id_6 = 1;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd77
) (
    input supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    output uwire id_3,
    input tri id_4,
    input supply1 _id_5,
    input wor id_6,
    output logic id_7,
    output tri0 id_8,
    input supply1 id_9,
    input supply1 id_10
);
  generate
    if (!1) begin : LABEL_0
      assign id_8 = 1;
    end else begin : LABEL_1
      always @(posedge 1 or posedge -1'b0) begin : LABEL_2
        id_7 <= id_10;
      end
    end
  endgenerate
  wire [1 : id_5] id_12;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_9,
      id_8
  );
  logic \id_13 ;
  assign \id_13 [1] = (1);
endmodule
