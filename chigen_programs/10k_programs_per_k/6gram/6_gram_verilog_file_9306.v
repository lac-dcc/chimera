// Seed: 3840015559
module module_0 #(
    parameter id_7 = 32'd46
) (
    input wor id_0,
    input supply0 id_1,
    input tri id_2,
    input wire id_3
    , id_6,
    output supply1 id_4
);
  wire _id_7;
  wire [id_7 : -1 'b0] id_8;
  always @(posedge 1'd0 or negedge -1) id_6 = #1  !(id_8);
endmodule
module module_1 (
    inout supply0 id_0,
    input tri0 id_1,
    input tri id_2,
    output logic id_3,
    input tri id_4,
    input wand id_5,
    output tri1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    output tri1 id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_7,
      id_9
  );
  assign modCall_1.id_1 = 0;
  always @(1 or posedge id_0)
    if (1 && 1) id_3 <= id_0;
    else begin : LABEL_0
      id_9 += -1;
    end
endmodule
