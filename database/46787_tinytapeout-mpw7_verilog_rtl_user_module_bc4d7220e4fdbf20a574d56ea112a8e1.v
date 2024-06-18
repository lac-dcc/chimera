// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

module s_p_shift_reg #(parameter LENGTH=256, parameter ROT_LEN = 8) (input d,
                                          input clk,
                                          input rst_n,
                                          input cs_n,
                                          input rot_n,
                                          output reg [LENGTH-1:0] out);
                                                      
  always @(posedge clk or negedge rst_n)
    begin
      if(!rst_n)
        out <= {LENGTH{1'b0}};
      else if (!cs_n)
        out <= {out[LENGTH-2:0], d};
      else if (!rot_n)
        out <= {out[ROT_LEN -1:0], out[LENGTH -1:ROT_LEN]};
      else 
        out <= out;
    end
  
endmodule

module lut #(parameter IN_WIDTH=4, parameter OUT_WIDTH=4) (input [IN_WIDTH-1:0] sel,
                                                           input [2**(IN_WIDTH)*OUT_WIDTH-1:0] in,
                                                           output [OUT_WIDTH-1:0] out);
 
 
  
  wire [OUT_WIDTH-1:0] chunked_in [2**IN_WIDTH-1:0];
  
  genvar i;
  
  generate
    for (i = 0; i < 2**IN_WIDTH; i = i+1) begin
      assign chunked_in[i] = in[(i+1) * OUT_WIDTH - 1 -: OUT_WIDTH];
    end
  endgenerate	     
  
  assign out = chunked_in[sel];
  
endmodule

module serial_load_lut #(parameter IN_WIDTH=4, parameter OUT_WIDTH=4) (
  input d, input clk, input rst_n, input cs_n, input rot_n, input [IN_WIDTH-1:0] sel, output [OUT_WIDTH-1:0] out);
  
  wire [2**(IN_WIDTH)*OUT_WIDTH-1:0] parallel_table;
  
  s_p_shift_reg #(2**(IN_WIDTH)*OUT_WIDTH, OUT_WIDTH) p_s_shift_reg(.d(d),.clk(clk),.rst_n(rst_n),.cs_n(cs_n),
                                                                  .rot_n(rot_n), .out(parallel_table));
  
  lut #(IN_WIDTH, OUT_WIDTH) lut(.sel(sel), .in(parallel_table), .out(out));
  
  
endmodule

module user_module_bc4d7220e4fdbf20a574d56ea112a8e1(
  input [7:0] io_in,
  output [7:0] io_out
);

  
  // Out of I/O to RST -- we can always clock zeros through the shift register instead
  wire rst_n;
  assign rst_n = 1;
  
  serial_load_lut #(4, 3) lut(.d(io_in[0]), .clk(io_in[1]), .cs_n(io_in[2]), .rst_n(rst_n),
                              .rot_n(io_in[7]), .sel(io_in[6:3]), .out(io_out[2:0]));
  
  
  assign io_out[7:3] = 0;
  
endmodule
