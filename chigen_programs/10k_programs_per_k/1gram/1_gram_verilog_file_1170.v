// Seed: 4215493225
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output tri1 id_2,
    input supply0 id_3,
    output supply0 id_4,
    input wand id_5
);
  assign id_2 = ~!id_3;
endmodule
module module_1 #(
    parameter id_1  = 32'd13,
    parameter id_16 = 32'd92,
    parameter id_7  = 32'd2
) (
    output supply0 id_0,
    input tri0 _id_1#(._id_7(1)),
    input wor id_2,
    input tri0 id_3,
    output logic id_4,
    input wand void id_5
);
  wire id_8;
  assign id_0 = id_2;
  wand [-1 : (  -1  )] id_9;
  generate
    assign id_8 = id_3;
    wire id_10;
  endgenerate
  always id_4 <= 1'h0;
  logic id_11[id_1 : id_7], id_12, id_13;
  assign id_4 = id_11;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_0,
      id_5,
      id_0,
      id_5
  );
  assign modCall_1.id_2 = 0;
  assign id_0 = -1;
  wire [id_7 : 'b0] id_14;
  logic id_15;
  wire _id_16;
  xor primCall (id_4, id_13, id_9, id_8, id_11, id_5, id_3, id_2);
  wire id_17, id_18;
  assign id_9 = id_8 && id_8;
  wire id_19;
  assign id_15[(id_16)] = id_5 - 1;
endmodule
