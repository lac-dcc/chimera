// Seed: 3554210320
module module_0 (
    output id_0,
    output id_1,
    input  id_2
);
  assign id_1 = id_2;
  assign id_0 = 1 ? (id_2) : id_2[1 : 1];
endmodule
