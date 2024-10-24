// Seed: 3029549025
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout id_5;
  input id_4;
  input id_3;
  inout id_2;
  inout id_1;
  generate
    initial begin
      id_5 <= #1 id_3;
      if (1 === id_2) id_1 <= !id_2;
      else begin
        id_5 <= 1;
      end
    end
  endgenerate
endmodule
