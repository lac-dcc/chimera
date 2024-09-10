// Seed: 1634289535
`default_nettype id_1 `timescale 1 ps / 1ps `timescale 1 ps / 1 ps
module module_0 #(
    parameter id_1 = 32'd26,
    parameter id_2 = 32'd91,
    parameter id_3 = 32'd80
) (
    _id_1,
    _id_2
);
  output _id_2;
  input _id_1;
  logic _id_3;
  always @(id_3, posedge 1) begin
    id_2 <= id_1[id_2[{"", 1} :-id_2]];
    case (id_3[1])
      1 + (id_3): {id_2, (1'h0), 1'b0} = id_1;
      id_2: begin
        id_1 = id_2;
      end
      id_1: id_2 = 1;
      id_3: begin
        if (~id_3) begin
          id_2 = 1;
        end
      end
      id_2: id_1 <= id_1[!id_3 : 1];
      "": id_3 <= id_1 - 1;
      1: id_1 <= 1;
      id_1: begin
        id_2 <= id_2 == 1'b0;
      end
      id_2[id_1]: id_3 = id_3;
      id_3[""]: id_1[id_3 : id_2] = 1 < id_2;
      1: id_2 = id_2 + id_3;
      "": id_3 <= id_3;
      1: id_1 = 1'b0;
    endcase
  end
  assign id_1 = 1;
  type_6(
      ~id_2, id_1 - 1'b0, 1
  );
  type_7 id_4 (
      .id_0({1, 1}),
      .id_1(id_2),
      .id_2(id_3),
      .id_3(1)
  );
endmodule
