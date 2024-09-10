// Seed: 2344184689
module module_0 #(
    parameter id_1 = 32'd35,
    parameter id_2 = 32'd86
) (
    input _id_1,
    input _id_2
);
  assign id_1[id_2] = id_1[id_1 : id_1[1]] ^ 1;
endmodule
