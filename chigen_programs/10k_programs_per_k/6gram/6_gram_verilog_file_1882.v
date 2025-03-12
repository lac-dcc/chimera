// Seed: 3142208233
module module_0 #(
    parameter id_0 = 32'd1
) (
    input tri1 _id_0,
    output tri id_1,
    input supply0 id_2,
    input wand id_3,
    input uwire id_4,
    output supply0 id_5
);
  wire [1 'b0 : -1] id_7 = id_2;
  logic [id_0 : -1 'b0] id_8;
  wire id_9 = id_9;
endmodule
module module_1 #(
    parameter id_0  = 32'd18,
    parameter id_18 = 32'd70,
    parameter id_4  = 32'd85,
    parameter id_5  = 32'd92,
    parameter id_6  = 32'd80
) (
    input tri _id_0,
    output tri0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    input supply0 _id_4,
    input supply0 _id_5,
    input tri _id_6,
    input tri1 id_7,
    output logic id_8,
    output supply0 id_9,
    output supply1 id_10,
    input tri0 id_11,
    output tri0 id_12,
    input supply0 id_13,
    input supply1 id_14,
    output supply1 id_15,
    input wor id_16
);
  localparam id_18 = 1;
  wire id_19;
  module_0 modCall_1 (
      id_18,
      id_12,
      id_13,
      id_14,
      id_16,
      id_1
  );
  assign modCall_1.id_0 = 0;
  assign id_2 = 1;
  always @(-1)
    if (-1'b0 + 1) assign id_12[-1!==~id_4 :-1-id_6[id_0 : id_18]~^id_5] = id_19;
    else id_8 <= "";
endmodule
