// Seed: 2707485097
`default_nettype id_8
module module_0 (
    output id_0,
    output logic id_1,
    output id_2,
    output id_3,
    input supply0 id_4,
    output logic id_5,
    output id_6,
    output logic id_7,
    output id_8,
    output id_9
);
  logic id_10;
  defparam id_11.id_12 = 1;
  uwire id_13;
  logic id_14;
  initial begin
    if (1) begin
      if (id_12) id_0 <= id_12;
      else begin
        id_8 = id_4;
      end
    end else if (id_10) id_6 <= "";
  end
  type_23 id_15 (
      .id_0 (id_5),
      .id_1 (1'b0 * 1 * ""),
      .id_2 (id_2),
      .id_3 (1),
      .id_4 ({1} == 1'b0),
      .id_5 (1'b0),
      .id_6 (~id_1),
      .id_7 (1),
      .id_8 (),
      .id_9 (1'b0),
      .id_10(id_8[{1, 1} : 1])
  );
  assign id_13[1] = id_10;
endmodule
